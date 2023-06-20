package com.example.lanqiao0327ssm.Utill;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

//专门用来处理时间的工具类
public class DateUtill {

//    静态的   被static修饰的方法不需要实例化，可以直接使用
//                       时间转换成字符串
    public static String dateToString(Date date){
//        格式转换                                                需要传一个格式
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
        String dateString=sdf.format(date);
        return  dateString;
    }

//   字符串转换时间
    public  static Date stringDate(String str ){

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss" );

        try {
            Date date=sdf.parse(str);
             return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
//        如果出现问题  就返回null
        return null;
    }

}
