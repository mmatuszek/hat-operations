package pl.hat.model;

public class Account {

    private final int id;
    private String name = "";

    public Account() {
        this.id = -1;
    }

    public Account(int id) {
        this.id = id;
    }

    public final int getId() {
        return id;
    }

    public final String getName() {
        return name;
    }
}
