package com.example.lanqiao0327ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class ImgController {
    //上传图片的接口
    @RequestMapping("uploadImg")
    @ResponseBody
    public Map uploadImg(MultipartFile file, HttpSession session) throws IOException {   //返回Map
//        HashMap map=new HashMap();
//        map.put("名字","deng");              map集合（键值对）
//        map.  put("值","123");               标准的json对象
//        return  map;

        String fileName = file.getOriginalFilename();
        String houzhui = fileName.substring(fileName.lastIndexOf("."));
        String name = UUID.randomUUID().toString();
        String path = session.getServletContext().getRealPath("imgs");
        file.transferTo((new File((path + File.separator + name + houzhui))));
        HashMap map = new HashMap();
        map.put("imgUrl","/imgs/"+name+houzhui);
        //put是往集合里面添加参数      键     值
        return map;

    }

}
