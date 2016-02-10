import static org.junit.Assert.*;

import org.junit.Test;


public class PE3Test {

	@Test
	public void testPrimeFactorization_0() {
		assertArrayEquals(new long[]{0},PE3.findPrimeFactors(0));
	}
	@Test
	public void testPrimeFactorization_1() {
		assertArrayEquals(new long[]{1},PE3.findPrimeFactors(1));
	}
	@Test
	public void testPrimeFactorization_4() {
		assertArrayEquals(new long[]{2,2},PE3.findPrimeFactors(4));
	}
	@Test
	public void testPrimeFactorization_5() {
		assertArrayEquals(new long[]{5},PE3.findPrimeFactors(5));
	}
	@Test
	public void testPrimeFactorization_6() {
		assertArrayEquals(new long[]{2,3},PE3.findPrimeFactors(6));
	}
	@Test
	public void testPrimeFactorization_13195() {
		assertArrayEquals(new long[]{5,7,13,29},PE3.findPrimeFactors(13195));
	}

}
