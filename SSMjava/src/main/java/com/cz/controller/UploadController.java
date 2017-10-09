package com.cz.controller;

import com.cz.bean.ControllerResult;
import com.cz.commer.PathUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/upload")
public class UploadController {
    @GetMapping("int")
    public String uppage(){
        return "upload";
    }
    @PostMapping("up")
    @ResponseBody
    public ControllerResult upload(MultipartFile file, HttpServletRequest request){
        try {
            file.transferTo(new File(PathUtils.uploadDir(request)+"/"+file.getOriginalFilename()));
        }catch (IOException e){
            e.printStackTrace();
        }
        return ControllerResult.getSUCCESSResult("上传成功！");
    }
}
