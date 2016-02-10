import static org.junit.Assert.*;

import org.junit.Test;


public class PE2Test {

	@Test
	public void testNthFibonacciNumber_1() {
		assertEquals(1, PE2.nthFibonacciNumber(1));
	}
	@Test
	public void testNthFibonacciNumber_2() {
		assertEquals(2, PE2.nthFibonacciNumber(2));
	}
	@Test
	public void testNthFibonacciNumber_3() {
		assertEquals(3, PE2.nthFibonacciNumber(3));
	}
	@Test
	public void testNthFibonacciNumber_4() {
		assertEquals(5, PE2.nthFibonacciNumber(4));
	}
	@Test
	public void testNthFibonacciNumber_5() {
		assertEquals(8, PE2.nthFibonacciNumber(5));
	}
	@Test
	public void testNthFibonacciNumber_6() {
		assertEquals(13, PE2.nthFibonacciNumber(6));
	}
	@Test
	public void testNthFibonacciNumber_10() {
		assertEquals(89, PE2.nthFibonacciNumber(10));
	}

}
