package pl.hat.dto;

import java.net.URL;

public final class CategoryDto {

    private final URL link;
    private final String name;

    public CategoryDto(URL link, String name) {
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
