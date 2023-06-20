package com.example.lanqiao0327ssm.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
public class PayController {

    //appid
    private final String APP_ID = "2021000122672119";
    //应用私钥
    private final String APP_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCC2DafLPBEsLAjVR1HUSChyOHTYJDlkXRHqHAmTIDzMOUilKnbT/gsjudgu0aQPcJ0YW3yl9tdPJbmaINpNGxgFU/mYKp+GOTFJ32wxbWSNlFbqNhxqfoAAepGHxJQ7rcLTil85Sb+BsgKA2l3MgnmPhNCqIM0e0DKSvr+ZmzT4GFXu5zDdwVY32yzV3v3fZfZffPKzamhFmnJ3G8fp5E101qzfztNTFF7JYmlUU5RqK/0rb679WgZ024TxTzqE8DJYQ0IQwTDUJgFro2wsf6k4oPkfn3jEY2kBxDe4CSyfhIyVOxI8YIJSAfMgFQ0obMWbf1MsXt8V3cDSkM7WLVBAgMBAAECggEAGZM9ift0s1h99UoLwQbgg/8J9REpAVZfDiqkUTge9GoYP5wjX1TQQ5VjMIsqjcMkoS7yGLsKC71uGXdQSF4Q2O8RgQxgBunCva6saMMcbInleS8Vr5Hz5dB6BF7Ka7tdV/5dKaZ46qpUq3BjSwMi4Dg994eMrdNxpJjnWpaWqwsnL4KOx0+z2NPzP9Gj9Wu9Jc9uWj1LlcKbWRya33ggOif4IL0uJ+fTk1z2Fi6oRzWekzIMetOxdA+bxDePycGsoYobpZwh4vj2ju81JZ+/kTQZC1VJnNHpnBiqTRmKN2OUHBEvN+b8s1ZkHLBne+Fl68vHRgHbTkbyzChqgYh9gQKBgQC3KYBdU7eAPhEQacl034IRGXcRtbFM2jg1t3WXnmpv+/DD/2OlK9aTSGBb8EO0xDfFZa3odb6TogcTlResSQy87T/n6MGmWOdW/1x0FTfTiDP8v4/JsKQKUBm5vkjun1uG1Wa7zhhEx13DqctSG1i8kAobmISVWDhURtb4jsYhuQKBgQC24J4BP2qQKlumCMmgJyMBEEXKbXLl9/IgLE1sBv6LdR1qw4JyvJQ/34tlCogOEGu5gCiSWY48boEYgodGVzc/6J/7cPdTpFlQ2rgtvCdeiGd/mf6NdxBMFz+/fY+ruWi9VMA9U/6tkDEuh+XOfk72V1pZA8+BdQNqdT3hUUOTyQKBgBLoIM0BcEa3oXFNSjNbQwTa2RSl6bhiKj05Q9Uz0A7hNdg1i6aoIM0xQmkbIxIM0yj4Nvxw8wwwRIS79iadn8f8wYUB3MN8F90+HOAKtKmMPLmRWJlcN4KtBArNXp/rKTqA2sr2GkE3RzGEXG2MTxufzrtMghsccSwZ5+TecAtZAoGALjiPNtmEYXOTPl+yNhwuKLKoMQWAqMcGF0ObPdZ2t2CeUsGfUsh+37XsUVlcEdHsqDHQD007OeLkFgHHluusNybgaHigyi8bs+fT7RtFCAuJvSJ6x95z7AdkQU3G5iwyYMfu3pFAKTXseEo4tvwNkQ169EyWQa4Fcv626R/U6KECgYEAgxYcP68tGE+Si0RiB2CcFxYyroeP2DNbC1BMFNYh5NP2+NprWE6EinyfqEP15BWy4usXwm60l8HkZJrJrdk8hBAIrrsg6dLEFYZhWMfPTi5aEA7+SA4ziwk8wc7xC6/bbcRQThLyIgvqkaesqMxlCiYWSGlH64WtAncgZWe1ap4=";
    private final String CHARSET = "UTF-8";
    // 支付宝公钥
    private final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAl5+5WhgcBJgjyB7DGTYxK15zBBlPUkOVUhErhumTXOygo79bYuiBBgpNMpreMy318klxWL8WK9V648ixNlXCp+20ZsoOkx2c3ovghp7Ztnq6h6iRJgdTSMvBCk/6pUp4J+FQ1kHwE8U+znjn+TAMRjPQVHs2lIEeD76fv4c8k/+IKOLj/iFD5AMFVjSEShJbUaUl5fl3aPLhCTx1Uk/14G5q+Moecmd2QmP8zDjAfSmgAdqGPUtZsQQf+nK+C/uZdPKxNtzXyA0rQS+8YLWSjZLcv22xv3+orZjhdR6pp8jWiuFxtY9MUEUoaWfVC0PisIntM3LsLJAmBiavhJE5RwIDAQAB";
    //这是沙箱接口路径,正式路径为https://openapi.alipay.com/gateway.do
    private final String GATEWAY_URL ="https://openapi-sandbox.dl.alipaydev.com/gateway.do";
    private final String FORMAT = "JSON";
    //签名方式
    private final String SIGN_TYPE = "RSA2";
    //支付宝异步通知路径,付款完毕后会异步调用本项目的方法,必须为公网地址
    private final String NOTIFY_URL = "http://127.0.0.1/notifyUrl";
    //支付宝同步通知路径,也就是当付款完毕后跳转本项目的页面,可以不是公网地址
    private final String RETURN_URL = "http://localhost:8080/returnUrl";

    //必须加ResponseBody注解，否则spring会寻找thymeleaf页面
    @ResponseBody
    @RequestMapping("/pay/alipay")
    public String alipay(HttpSession session, Model model,
                         @RequestParam("dona_money") float dona_money,
                         @RequestParam("dona_id") int dona_id) throws AlipayApiException {
        //把dona_id项目id 放在session中
        session.setAttribute("dona_id",dona_id);

        //生成订单号（支付宝的要求？）
        String time = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String user = UUID.randomUUID().toString().replace("-","").toUpperCase();

        String OrderNum = time+user;

        //调用封装好的方法（给支付宝接口发送请求）
        return sendRequestToAlipay(OrderNum,dona_money,"ghjk");
    }
    /*
参数1：订单号
参数2：订单金额
参数3：订单名称
 */
    //支付宝官方提供的接口
    private String sendRequestToAlipay(String outTradeNo,Float totalAmount,String subject) throws AlipayApiException {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(GATEWAY_URL,APP_ID,APP_PRIVATE_KEY,FORMAT,CHARSET,ALIPAY_PUBLIC_KEY,SIGN_TYPE);

        //设置请求参数
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(RETURN_URL);
        alipayRequest.setNotifyUrl(NOTIFY_URL);

        //商品描述（可空）
        String body="";
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + outTradeNo + "\","
                + "\"total_amount\":\"" + totalAmount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return result;
    }

}
