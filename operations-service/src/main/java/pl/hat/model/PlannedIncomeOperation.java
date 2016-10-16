package pl.hat.model;

public final class PlannedIncomeOperation extends PlannedOperation {

    private int categoryId;

    public PlannedIncomeOperation(int id) {
        super(id);
    }

    public int getCategoryId() {
        return categoryId;
    }
}
