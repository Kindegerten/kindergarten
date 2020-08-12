package com.kindergarten.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.kindergarten.bean.SchoolBill;
import com.kindergarten.mapper.ParentsMapper;
import com.kindergarten.util.TradenoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("alipay")
public class AliPayController {
    @Autowired
   private ParentsMapper parentsMapper;

    //支付宝支付主页
    @RequestMapping("pay")
    public void alipayIndex(HttpServletRequest request, HttpServletResponse response,int billId) throws IOException {

        SchoolBill schoolBill=parentsMapper.Pay(billId);
        String UUID= TradenoUtil.getUUID(); //生成唯一的商户订单号
        request.getSession().setAttribute("PayBillId",billId);


        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.APP_ID, AlipayConfig.APP_PRIVATE_KEY, "json", AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = new String(UUID);
        //付款金额，必填
        String total_amount = new String(String.valueOf(schoolBill.getBillMoney()));
        //订单名称，必填
        String subject = new String(schoolBill.getBillName());
        //商品描述，可空
        String body = new String(schoolBill.getBillDirector());

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
        //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
        //		+ "\"total_amount\":\""+ total_amount +"\","
        //		+ "\"subject\":\""+ subject +"\","
        //		+ "\"body\":\""+ body +"\","
        //		+ "\"timeout_express\":\"10m\","
        //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

        //请求
        String form = "";
        try {
            form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=" + AlipayConfig.CHARSET);
        response.getWriter().write(form);//直接将完整的表单html输出到页面
        response.getWriter().flush();
        response.getWriter().close();
    }



//    public String alipayIndex(HttpServletRequest request, HttpSession session, String orderName) {
//
//        //订单号
//        request.setAttribute("util",Util.getUUID());
//        //商品价格
//        request.setAttribute("orderPayMoney", 255);
//        //商品名称
//        request.setAttribute("orderName", "小一班学费");
//        //
//
//        return "/pay/index.jsp";
//    }
//
//    @RequestMapping("pay")
//    public String pay(){
//        System.out.println("进来了");
//        return "/pay/alipay.trade.page.pay.jsp";
//    }
//
//    @RequestMapping("notifyurl")
//    public String notifyurl(){
//        return "/pay/notify_url.jsp";
//    }

//    //商户订单号，商户网站订单系统中唯一订单号，必填
//    String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
//    //付款金额，必填
//    String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"), "UTF-8");
//    //订单名称，必填
//    String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"), "UTF-8");
//    //商品描述，可空
//    String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"), "UTF-8");

}