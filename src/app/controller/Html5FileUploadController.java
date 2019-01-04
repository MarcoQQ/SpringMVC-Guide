package app.controller;

import app.domain.UploadFile;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
public class Html5FileUploadController {

    public static final Log logger = LogFactory.getLog(Html5FileUploadController.class);

    @RequestMapping(value = "/html5")
    public String inputProduct(){
        return "Html5";
    }

    @RequestMapping(value = "/file_upload")
    public void saveFile(HttpServletRequest request, @ModelAttribute UploadFile uploadFile, Model model){
        MultipartFile multipartFile = uploadFile.getMultipartFile();
        String fileName = multipartFile.getOriginalFilename();
        try{
            File file = new File(request.getServletContext().getRealPath("/file"), fileName);
            multipartFile.transferTo(file);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
