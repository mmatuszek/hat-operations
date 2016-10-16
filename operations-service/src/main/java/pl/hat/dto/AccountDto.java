package pl.hat.dto;

import java.net.URL;

public final class AccountDto {

    private final URL link;
    private final String name;

    public AccountDto(URL link, String name) {
        this.link = link;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public URL getLink() {
        return link;
    }

}
