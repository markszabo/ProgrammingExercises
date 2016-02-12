import java.math.BigInteger;

public class PE56 {
	
	public static void main(String[] args) {
		int max = 0;
		for(int i=0; i<100; i++){
			for(int j=0; j<100; j++){
				BigInteger pow = BigInteger.valueOf(i).pow(j);
				max = Math.max(digitSum(pow), max);
			}
		}
		System.out.println(max);
	}

	private static int digitSum(BigInteger n) {
		int sum = 0;
		String s = n.toString();
		for (int i = 0; i < s.length(); i++)
			sum += s.charAt(i) - '0';
		return sum;
	}
	
	public static long sumOfDigits(long number){
		long sum = 0L;
	    while(number > 0L){
	        sum += number%10L;
	        number /= 10L;
	    }
	    return sum;
	}
	
	public static long longPower(long a, long b){
		long power = 1L;
		for(long i=0L; i<b; i++){
			power *= a;
		} 
		return power;
	}
}
