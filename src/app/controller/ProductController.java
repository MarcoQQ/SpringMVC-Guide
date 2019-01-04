package app.controller;

import app.domain.Product;
import app.form.ProductForm;
import app.service.ProductService;
import app.service.ProductServiceImp;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.channels.MulticastChannel;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    private static final Log logger =
            LogFactory.getLog(ProductController.class);

    @RequestMapping("/product_input")
    public String inputProduct(){
        logger.info("inputProduct called");
        return "ProductForm";
    }

    @RequestMapping(value = "/product_save", method = RequestMethod.POST)
    public String saveProduct(ProductForm form, HttpServletRequest request, RedirectAttributes redirectAttributes){
        logger.info("saveProduct called");

        Product product = new Product();
        product.setName(form.getName());
        product.setDescription(form.getDescription());
        product.setPrice(Float.parseFloat(form.getPrice()));
        product.setImages(form.getImages());

        List<MultipartFile> files = form.getImages();
        List<String> fileNames = new ArrayList<>();

        if(null != files && files.size() > 0){
            for(MultipartFile multipartFile : files){
                String fileName = multipartFile.getOriginalFilename();
                fileNames.add(fileName);
                System.out.println(fileName);

                File imageFile = new File(request.getServletContext().getRealPath("/image"), fileName);
                System.out.println(request.getServletContext().getRealPath("/image"));

                try{
                    multipartFile.transferTo(imageFile);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }


        Product savedProduct = productService.add(product);
        redirectAttributes.addFlashAttribute("message", "success");
        return "redirect:/product_view/" + savedProduct.getId();
    }

    @RequestMapping("/product_view/{id}")
    public String viewProduct(@PathVariable long id, Model model){
        Product product = productService.get(id);
        model.addAttribute("product", product);
        return "ProductView";
    }

}
