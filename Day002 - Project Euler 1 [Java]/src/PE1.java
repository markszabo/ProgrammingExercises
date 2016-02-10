
public class PE1 {
	public static void main(String[] args) {
		System.out.println(sumOfMultiplesBy3Or5(1000));
	}
	
	public static int sumOfMultiplesBy3Or5(int limit){
		int sum = 0;
		for(int i = 0; i < limit; i++){
			if(i%3 == 0) sum += i;
			else if(i%5 == 0) sum +=i;
		}
		return sum;
	}
}
