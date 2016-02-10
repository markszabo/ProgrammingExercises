import static org.junit.Assert.*;

import org.junit.Test;


public class PE1Test {

	@Test
	public void test1() {
		assertEquals(0,PE1.sumOfMultiplesBy3Or5(2));
	}
	@Test
	public void test3(){
		assertEquals(0,PE1.sumOfMultiplesBy3Or5(3));
	}
	@Test
	public void test4(){
		assertEquals(3,PE1.sumOfMultiplesBy3Or5(4));
	}
	@Test
	public void test5(){
		assertEquals(3,PE1.sumOfMultiplesBy3Or5(5));
	}
	@Test
	public void test6(){
		assertEquals(8,PE1.sumOfMultiplesBy3Or5(6));
	}
	@Test
	public void test7(){
		assertEquals(14,PE1.sumOfMultiplesBy3Or5(7));
	}
	@Test
	public void test10(){
		assertEquals(23,PE1.sumOfMultiplesBy3Or5(10));
	}

}
