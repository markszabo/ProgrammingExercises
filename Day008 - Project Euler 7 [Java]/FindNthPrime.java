import java.lang.*;

public class FindNthPrime {

    public static void main(String[] args) {
			long begin = System.currentTimeMillis();
         if(args.length < 1){ System.out.println("Usage: give a positive number as parameter"); return;}
			int n=0;
			try {
				n = Integer.parseInt(args[0]);
			} catch (NumberFormatException e) {
				System.out.println("Usage: give a number as parameter"); return;
			}
			if(n < 1){ System.out.println("Usage: give a positive number as parameter"); return;} 
			int nthPrime = searchPrime(n);
			double elapsedTime = (System.currentTimeMillis()-begin);
         System.out.println("The " + Integer.toString(n) + "th prime is " + Integer.toString(nthPrime) + ". It took " + Double.toString(elapsedTime/1000) + " seconds to calculate it.");
    }

	public static int searchPrime(int n){
			int[] primes = new int[n];
			primes[0] = 2;
			int i = 3;
			int p = 1;
			while(primes[n-1] == 0)
			{
				boolean isPrime = true;
				for(int j=0; primes[j] <= Math.sqrt(i); j++){
					if(i%primes[j] == 0){ isPrime = false; break; }
				}
				if(isPrime) {primes[p] = i; p++;}
				i++;
			}
			return primes[n-1];
	}
}
