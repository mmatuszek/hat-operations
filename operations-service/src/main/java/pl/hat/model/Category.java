package pl.hat.model;

public final class Category {

    private final int id;
    private String name;

    public Category() {
        this.id = -1;
    }

    public Category(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
