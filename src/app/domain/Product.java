package app.domain;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


public class Product implements Serializable{
    private static final long serialVersionUID = 748392348L;
    private String name;
    private String description;
    private float price;
    private Long id;
    private Date productDate;
    private List<MultipartFile> images;

    public void setImages(List<MultipartFile> images){ this.images = images; }

    public List<MultipartFile> getImages() {
        return images;
    }

    public void setProductDate(Date productDate) {
        this.productDate = productDate;
    }

    public Date getProductDate() {
        return productDate;
    }

    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
