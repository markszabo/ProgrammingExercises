import static org.junit.Assert.*;

import org.junit.Test;


public class PE56Test {

	@Test
	public void testSumOfDigits_1(){
		assertEquals(1,PE56.sumOfDigits(1));
	}
	@Test
	public void testSumOfDigits_2(){
		assertEquals(12,PE56.sumOfDigits(156));
	}
	@Test
	public void testSumOfDigits_3(){
		assertEquals(10,PE56.sumOfDigits(1234));
	}

	@Test
	public void testLongPower_1(){
		assertEquals(4,PE56.longPower(2,2));
	}
	@Test
	public void testLongPower_2(){
		assertEquals(8,PE56.longPower(2,3));
	}
	@Test
	public void testLongPower_3(){
		assertEquals(125,PE56.longPower(5,3));
	}


}
