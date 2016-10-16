package pl.hat.model;

public final class IncomeOperation extends Operation {

    private int categoryId;
    private int accountId;
    private PlannedIncomeOperation plannedOperation;

    public IncomeOperation() {
        super();
    }

    public IncomeOperation(long id) {
        super(id);
    }

    public int getCategoryId() {
        return categoryId;
    }

    public int getAccountId() {
        return accountId;
    }

}
