package app.service;

import app.domain.Product;
import org.springframework.stereotype.Service;


public interface ProductService {
    Product add(Product product);
    Product get(Long id);
}
