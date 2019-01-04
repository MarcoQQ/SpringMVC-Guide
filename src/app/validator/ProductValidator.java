package app.validator;

import app.domain.Product;
import app.form.ProductForm;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductValidator implements Validator {
    public boolean supports(Class<?> klass){
        return Product.class.isAssignableFrom(klass);
    }

    public void validate(Object target, Errors errors){
        Product product = (Product) target;
        ValidationUtils.rejectIfEmpty(errors, "name", "productname required");
        ValidationUtils.rejectIfEmpty(errors, "price", "productprice required");
        ValidationUtils.rejectIfEmpty(errors, "productDate", "productDate required");
        Float price = product.getPrice();
        if(price != null && price < 0){
            errors.rejectValue("price", "price negative");
        }
        Date productDate = product.getProductDate();
        if(productDate != null){
            if(productDate.after(new Date())){
                errors.rejectValue("productDate", "productDate invalid");

            }
        }

    }
}
