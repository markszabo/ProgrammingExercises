import static org.junit.Assert.*;

import org.junit.Test;


public class PE60Test {

	@Test
	public void testFirstNPrime_1() {
		assertArrayEquals(new int[]{2},PE60.firstNPrime(1));
	}
	@Test
	public void testFirstNPrime_2() {
		assertArrayEquals(new int[]{2,3},PE60.firstNPrime(2));
	}
	@Test
	public void testFirstNPrime_6() {
		assertArrayEquals(new int[]{2,3,5,7,11,13},PE60.firstNPrime(6));
	}
	
	@Test
	public void testIsInTheArray_1(){
		assertEquals(true,PE60.isInTheArray(1, new int[]{1,2,3}, true));
	}
	@Test
	public void testIsInTheArray_2(){
		assertEquals(false,PE60.isInTheArray(5, new int[]{1,2,3}, true));
	}
	@Test
	public void testIsInTheArray_3(){
		assertEquals(true,PE60.isInTheArray(9, new int[]{1,2,3,10,78,9,56,3}, false));
	}

}
