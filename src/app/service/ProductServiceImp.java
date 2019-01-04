package app.service;

import app.domain.Product;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

@Service
public class ProductServiceImp implements ProductService{
    private Map<Long, Product> products = new HashMap<Long, Product>();
    private AtomicLong generator = new AtomicLong();

    public ProductServiceImp(){
        Product product = new Product();
        product.setPrice(12.0f);
        product.setDescription("perfect");
        product.setName("JKJJ");
        add(product);
    }

    public Product add(Product product){
        Long id = generator.incrementAndGet();
        product.setId(id);
        products.put(id, product);
        return product;
    }

    public Product get(Long id){
        return products.get(id);
    }
}
