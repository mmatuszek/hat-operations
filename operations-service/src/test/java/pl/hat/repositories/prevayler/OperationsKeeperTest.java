package pl.hat.repositories.prevayler;

import org.junit.Assert;
import org.junit.Test;

import pl.hat.model.Operation;

public class OperationsKeeperTest {

	OperationsKeeper keeperInTest = new OperationsKeeper();

	@Test
	public void shouldKeepAndReturnOperation() {

		//Given
		Operation operation = new Operation() { };

		//When
		keeperInTest.keep(operation);

		//Then
		Assert.assertEquals(operation, keeperInTest.operations().get(0));


	}
}
