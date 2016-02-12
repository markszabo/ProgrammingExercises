import static org.junit.Assert.*;

import org.junit.Test;


public class PE51Test {

	@Test
	public void testSubstitute_1(){
		assertEquals(5,PE51.substitute(3,0,5));
	}
	@Test
	public void testSubstitute_2(){
		assertEquals(35,PE51.substitute(45,1,3));
	}
	@Test
	public void testSubstitute_3(){
		assertEquals(89,PE51.substitute(81,0,9));
	}
	@Test
	public void testSubstitute_4(){
		assertEquals(46987,PE51.substitute(46287,2,9));
	}
	@Test
	public void testSubstitute_5(){
		assertEquals(8926412,PE51.substitute(8986412,4,2));
	}

	@Test
	public void testIsPrime_1(){
		assertEquals(false,PE51.isPrime(1));
	}
	@Test
	public void testIsPrime_2(){
		assertEquals(true,PE51.isPrime(2));
	}
	@Test
	public void testIsPrime_3(){
		assertEquals(true,PE51.isPrime(37));
	}
	@Test
	public void testIsPrime_4(){
		assertEquals(false,PE51.isPrime(43518));
	}

	@Test
	public void testBinaryToIntArray_1(){
		assertArrayEquals(new int[]{0,0,2,0},PE51.binaryToIntArray(4, 4));
	}
	@Test
	public void testBinaryToIntArray_2(){
		assertArrayEquals(new int[]{0,1,2,0},PE51.binaryToIntArray(7, 4));
	}
	@Test
	public void testBinaryToIntArray_3(){
		assertArrayEquals(new int[]{0,0,0,0,4,0,0,0},PE51.binaryToIntArray(17, 8));
	}
	@Test
	public void testBinaryToIntArray_4(){
		assertArrayEquals(new int[]{0,0,2,0,0,5,0},PE51.binaryToIntArray(36, 7));
	}

	@Test
	public void testIsSpecialPrime_1(){
		assertEquals(true,PE51.isSpecialPrime(13, new int[]{1,0}, 6));
	}
	@Test
	public void testIsSpecialPrime_2(){
		assertEquals(false,PE51.isSpecialPrime(15, new int[]{1,0}, 6));
	}
	@Test
	public void testIsSpecialPrime_3(){
		assertEquals(false,PE51.isSpecialPrime(11, new int[]{1,0}, 6));
	}
	@Test
	public void testIsSpecialPrime_4(){
		assertEquals(true,PE51.isSpecialPrime(56003, new int[]{1,2,0}, 7));
	}
	@Test
	public void testIsSpecialPrime_5(){
		assertEquals(false,PE51.isSpecialPrime(55003, new int[]{1,2,0}, 7));
	}
	@Test
	public void testIsSpecialPrime_6(){
		assertEquals(false,PE51.isSpecialPrime(13, new int[]{1}, 7));
	}
	
	@Test
	public void testNthDigit_1(){
		assertEquals(5,PE51.getNthDigit(151, 1));
	}
	@Test
	public void testNthDigit_2(){
		assertEquals(2,PE51.getNthDigit(1234, 2));
	}

}
