/*
 
The primes 3, 7, 109, and 673, are quite remarkable. 
By taking any two primes and concatenating them in any order the result will 
always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. 
The sum of these four primes, 792, represents the lowest sum for a set of four 
primes with this property.

Find the lowest sum for a set of five primes for which any two primes 
concatenate to produce another prime.
 */
public class PE60 {
	public static void main(String[] args) {
		System.out.println("Program started");
		boolean found = false;
		for(int nrOfPrimes = 10; !found; nrOfPrimes += 10){
			System.out.println("No solution found, trying 10 more");
			int[] primes = firstNPrime(nrOfPrimes);
			for(int i1=0; i1 < nrOfPrimes-4; i1++){
				for(int i2=i1+1; i2 < nrOfPrimes-3; i2++){
					for(int i3=i2+1; i3 < nrOfPrimes-2; i3++){
						for(int i4=i3+1; i4 < nrOfPrimes-1; i4++){
							for(int i5=i4+1; i5 < nrOfPrimes; i5++){
								//so now I have 5 primes, let's test them
								boolean isGood = true;
								int[] selectedPrimes = {primes[i1], primes[i2], primes[i3], primes[i4], primes[i5]};
								for(int m=0; m<5 && isGood; m++){
									for(int n=0; n<5 && isGood; n++){
										if(n==m) continue;
										isGood = isInTheArray(concatIntegers(selectedPrimes[m],selectedPrimes[n]),primes,true);
									}
								}
								if(isGood){
									System.out.println("Primes found!");
									System.out.println(primes[i1]);
									System.out.println(primes[i2]);
									System.out.println(primes[i3]);
									System.out.println(primes[i4]);
									System.out.println(primes[i5]);
									found = true;
								}
							}
						}
					}
				}
			}
		}
	}
	
	public static int[] firstNPrime(int n){
		int[] primes = new int[n];
		primes[0] = 2;
		int primeNr = 1;
		for(int i=3; primeNr < n; i++){
			boolean isPrime = true;
			for(int j=0; j < primeNr; j++){
				if(i%primes[j] == 0){
					isPrime = false;
					break;
				}
			}
			if(isPrime) primes[primeNr++] = i;
		}
		return primes;
	}
	
	public static boolean isInTheArray(int element, int[] array, boolean isSorted){
		for(int i=0; i<array.length; i++){
			if(array[i] == element) return true;
			if(isSorted && array[i] > element) return false;
		}
		return false;
	}
	public static boolean isInTheArray(int element, int[] array){
		return isInTheArray(element, array, false); //if not specified, assume that it's not sorted
	}
	public static int concatIntegers(int a, int b){
		return Integer.parseInt(Integer.toString(a).concat(Integer.toString(b)));
	}
}
