import java.util.Arrays;

/*

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/
public class PE3 {
	
	public static void main(String[] args) {
		long[] factors = findPrimeFactors(600851475143L);
		for(int i=0; i<factors.length; i++){
			System.out.println(factors[i]);
		}
	}
	
	private static final int MAX_NUMBER_OF_FACTORS = 100;

	public static long[] findPrimeFactors(long number){
		if(number < 4) return new long[]{number};
		long[] tmpFactors = new long[MAX_NUMBER_OF_FACTORS];
		int findex=0;
		for(int i=2; i <= number && number > 1; i++){
			while(number%i == 0){
				tmpFactors[findex] = i;
				number /= i;
				findex++;
			}
		}
		long[] factors = Arrays.copyOfRange(tmpFactors, 0, findex);
		return factors;
	}
}
