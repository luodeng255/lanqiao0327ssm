package com.example.lanqiao0327ssm.Utill;

//订单号生成
public class Test {


//    1.依靠数据库的自动增长生成订单号  成交单数可以看见
//    2.依靠java时间戳生成   但在并发量较大的时候会出现重复值
//public static void main(String[] args) {
//    System.out.println(System.currentTimeMillis());
//}

//    3.依靠算法实现(雪花算法) 经常在分布式架构情况下生成不重复 递增的一串长整型数字

    public static void main(String[] args) {
        SnowflakeIdGenerator snow=new SnowflakeIdGenerator(1,1);
        System.out.println(snow.nextId());
    }
}
