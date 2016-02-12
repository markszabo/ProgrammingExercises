import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 Prime digit replacements
Problem 51

By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible 
values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the 
first example having seven primes among the ten generated numbers, yielding the family: 56003, 
56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this 
family, is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) 
with the same digit, is part of an eight prime value family.
 
 */

public class PE51 {
	
	private static final String PRIME_WEBSITE_URL = "http://primes.utm.edu/lists/small/100000.txt";
	public static Vector<Integer> primes;
	
	public static void main(String[] args) {
		int nrOfSpecialPrimes = 8;
		primes = getTheFirstPrimesFromUrl(PRIME_WEBSITE_URL);
		System.out.println("Primes are downloaded");
		int toTest = 1;
		boolean found = false;
		while(!found){
			int candidate = primes.get(toTest);
			int nrOfDigits = (int) Math.floor(Math.log10(candidate)) + 1;
			//select all the possible combination of the digits to change
			digitsToChange:
			for(int d=2;d<Math.pow(2, nrOfDigits);d++){
				int[] mask = binaryToIntArray(d, nrOfDigits);
				//test if the candidate has the same values under the mask
				int firstValue=-1;
				for(int mi=0; mi<mask.length; mi++){
					if(mask[mi] > 0 && firstValue == -1) firstValue = getNthDigit(candidate,mi); //save if first
					else if(mask[mi] > 0 && firstValue != getNthDigit(candidate,mi)) continue digitsToChange; //if differ, wrong mask
				}
				if(isSpecialPrime(candidate, mask, nrOfSpecialPrimes)){
					System.out.println("We found it! "+Integer.toString(candidate));
					for(int mii=0; mii<mask.length; mii++)
						System.out.println(Integer.toString(mask[mii]));
					found = true;
					break;
				}
			}
			
			toTest++;
		}
	}
	
	public static int getNthDigit(int number, int n){
		return (int) Math.floor(number/Math.pow(10,n)) % 10;
	}
	
	public static int[] binaryToIntArray(int bin, int length){
		int[] mask = new int[length];
		int tmp=bin;
		for(int t=0;t<length;t++){
			if(tmp%2 == 1) mask[t] = t;
			tmp /=2;
		}
		return mask;
	}
	
	public static boolean isSpecialPrime(int base, int place[], int nr){
		int numberOfPrimes = 0;
		for(int i=0; i<10; i++){
			int newNumber = base;
			boolean firstDigitChanged = false;
			for(int s=0; s<place.length; s++){
				if(place[s] == 0) continue;
				if(s == place.length-1 && i == 0) firstDigitChanged=true; //do not change the first digit to zero
				newNumber = substitute(newNumber, place[s], i);
			}
			if(!firstDigitChanged && isPrime(newNumber)) {
				numberOfPrimes++;
			}
		}
		if(numberOfPrimes >= nr) return true;
		else return false;
	}
	
	public static int substitute(int base, int place, int newDigit){
		int originalDigit = (int) Math.floor(base/Math.pow(10,place)) % 10;
		return (int)(base + (newDigit - originalDigit)*Math.pow(10,place));
	}
	
	public static boolean isPrime(int number){
		if(primes == null) primes = getTheFirstPrimesFromUrl(PRIME_WEBSITE_URL); 
		return primes.contains(number);
	}
	
	public static Vector<Integer> getTheFirstPrimesFromUrl(String webPage){
		Vector<Integer> primes = new Vector<Integer>();
		String result = "";
		try {
			URL url = new URL(webPage);
			URLConnection urlConnection = url.openConnection();
			InputStream is = urlConnection.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);

			int numCharsRead;
			char[] charArray = new char[1024];
			StringBuffer sb = new StringBuffer();
			while ((numCharsRead = isr.read(charArray)) > 0) {
				sb.append(charArray, 0, numCharsRead);
			}
			result = sb.toString();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//parse the primes
        Pattern pattern = Pattern.compile("\\d+");
        Matcher matcher = pattern.matcher(result);

        while (matcher.find()) {
            primes.add(Integer.parseInt(matcher.group()));
        }
        //remove the first few numbers, they are not primes
        while(primes.get(0) != 2 || primes.get(1) != 3)
        	primes.remove(0);
		return primes;
	}
}
