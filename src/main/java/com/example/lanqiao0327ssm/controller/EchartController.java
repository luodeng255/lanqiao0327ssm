package com.example.lanqiao0327ssm.controller;
import com.example.lanqiao0327ssm.mapper.EchartsMapper;
import com.example.lanqiao0327ssm.pojo.Product;
import com.example.lanqiao0327ssm.pojo.ToDay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("echarts")
public class EchartController {
   @Autowired
    EchartsMapper echartsMapper;

   @RequestMapping("queryAll")
    public String queryAll(Model model){
        List<Product> prods= echartsMapper.queryAll();
        model.addAttribute("product",prods);
        return "Echarts";
    }

    @RequestMapping("queryOrder")
    public String queryOder(Model model){
       List<Map> orders=echartsMapper.queryOrder();
       model.addAttribute("Order",orders);
       return "Echarts";
    }

    @RequestMapping("selectDayNum")
    public String selectDayNum(Model model){
       List<Map> dayNum=echartsMapper.selectDayNum();
       model.addAttribute("DayNum",dayNum);
       List<ToDay> dayPrice=echartsMapper.selectDayPrice();
       model.addAttribute("DayPrice",dayPrice);
       List<Map> WeekNum=echartsMapper.selectWeek();
       model.addAttribute("Week",WeekNum);
       List<Map> toWeekPrice=echartsMapper.selectWeekPrice();
       model.addAttribute("toWeekPrice",toWeekPrice);
       List<Map> Month=echartsMapper.selectMoth();
        model.addAttribute("month",Month);
//       柱状图
        List<Map> AllTen=echartsMapper.AllTen();
       model.addAttribute("AllTen",change(echartsMapper.AllTen()));


       List<Map> AllUser=echartsMapper.selectAllUser();
       model.addAttribute("allUser",AllUser);
       List<Map> AllCate=echartsMapper.selectCate();
       model.addAttribute("allCate",AllCate);
       List<Map> selectProduct=echartsMapper.selectProduct();
       model.addAttribute("selectPro",selectProduct);
       List<Map> selectOrder=echartsMapper.selectOrder();
       model.addAttribute("selectOder",selectOrder);
        List<Map> selectPrice=echartsMapper.selectPrice();
        model.addAttribute("selectPrice",selectPrice);
        List<Map> selectEday=echartsMapper.selectEday();
        model.addAttribute("selectEday",selectEday);
        List<Map> first=echartsMapper.first();
        model.addAttribute("selectfirst",first);
        List<Map> MothPrice=echartsMapper.selectMothPrice();
        model.addAttribute("MothPrice",MothPrice);
        List<Map> Ten=echartsMapper.selectTen();
        model.addAttribute("TenSelect",Ten);
       return "index";
    }


//过去七天
    public List<Map> change(List<Map> oldList){
       List<Map> newList=new ArrayList<>();
//       获取现在的时间
        Calendar calendar=Calendar.getInstance();
//        在当前时间的基础上+上时间  add(单位,数量)
//        往前七天的时间
        calendar.add(Calendar.DATE,-7);
        for (int i = 0; i < 7; i++) {
            calendar.add(Calendar.DATE,1);
            Map map=new HashMap();
//            往map里面放值
            map.put("date",new SimpleDateFormat("MM-dd").format(calendar.getTime()));
            map.put("sales_amount",0);
            newList.add(map);
        }
//        循环新的容器
        for (Map newMap : newList) {
            String date = (String) newMap.get("date");
            for (Map oldMap : oldList) {
//                如果新容器里面的时间和老的相等
                if (date.equals(oldMap.get("date").toString())) {
                    newMap.put("sales_amount", oldMap.get("sales_amount"));
                }
            }
        }
        return newList;
    }

}
