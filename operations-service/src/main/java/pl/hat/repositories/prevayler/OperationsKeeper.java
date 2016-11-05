package pl.hat.repositories.prevayler;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import pl.hat.model.Operation;

public class OperationsKeeper implements Serializable {

	private List<Operation> operationList = new ArrayList<>();

	public void keep(Operation operation) {
		operationList.add(operation);
	}

	public List<Operation> operations() {
		return operationList;
	}
}
