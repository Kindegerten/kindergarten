package com.kindergarten.controller;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号,开发时使用沙箱提供的APPID，生产环境改成自己的APPID
    public static String APP_ID = "2021000116675642";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String APP_PRIVATE_KEY ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCQIwiApeeL8sdyNik8zoxIW9ML99ZvNgTZcJC5WsnxwmH35nYxhVvMxup3kmNRnCQvhVijSc/5ytRywqwWpahgCf51Jx0/AIOiOGajfOFxbuR7E04jweBmy4+eQzOfg6L4qL0XVUfQsVKdvYpHdNvlnBFdR9Crzi5Mb0D4TlU5m9fTemTH1G9pfUw2CKw0WUhyU0vr1KqWhYAlbSIEsWhDLDRErOIuzDdP5Biu0DZSzAY7uE+yzm9Kk2dje4xkgFPfBgzuBfrGoQM3+exr16xP2OFdbY/HYhgFWfK/pD+kriDg2sF3pg7XUR4MH+tlr2/BBTvj8aRIT5UBgVma+HyHAgMBAAECggEATQdr89S1+cS1cgQf5a88qS7piuvYXXaxAMN3lJdAdUM8uA8h+zUZ6kYj5+MD0QlxDTRmOl2oGAadovcGoNPHOAwfQNy2dIUB1B/wOk7y7Hwm/t9CUzm5gzYmep3PaOAgqGMFKwMYbh9V15cD30xEeGD/pqpKioaVl6OdRRYX1cDyQ2CL3Rbs/qGIs+4GppVMnDSMPhBVM31clieOljkxfm5PRzkhhThMZKiiF2PNj0Xma7yaJqK5+19PRZ90LsaiNHl8nGEXn7vMmZO8lyrzsx7YA1fAwmsK2OHSEbQDKPHzHW1xWrCasEH9+LGrg/eEMKpuHXi48bXoFSjoWY/0AQKBgQDpoUW8HPq7iGX57v1JJbgiCK+BCh3gPPY+3MVoeRDXyf4Z+RQ/Se/kd1Wq47OXJhNcefKz3AeH8jtEudp4lMCPmnDndEssQTY5ly304kppL7VQazt7yYZD7vAedwXqUXxz8pDRO0Qhc+icyWhf3lZ9VPnOHnIbKr26sDbVo+cxYQKBgQCd8Bv9ASNOccRZ9MfUlJCjEZG4gHAhNuyUSpzuTiwk8Sup3hIy3pcyAXOZLlue6xaH8mZ8lxAb3mqJEsZt3+0EvgGqowd+348vc2sWrs2fD6FwLz6Pw//8SgMRifK8ByPnhskR+XlHFNfaTBNRmRn4F7wljnuDMRvHwkGHVquu5wKBgBUlj9ZTGS7YTcKtqydvzpbmCly3ubSOUAuomAW4z5l4oxNexEJmQtx/ILXzHlJUE/SO5TT6eYQInOy/ldLMRBG7fPS2Rgefb3UPBg3gXbPfqZ251wyBVTHY8ssPIu3uqkEkd484uhX9E9T9NgFXcqStiF7rypBC8iFvycbUqxyBAoGAbjZRAaPapHIFaBTFodWufOzUuGCAXt06CF1s12sbqQfWxWofXvovngifR2SvMN2yUlnYJNcxuZDi3RaJ+8CIYIfLF+0+XM3a2Gz9bM281WON74A4cxB+QOrQ61tNVOLSrk1DYNSrSewEmOP/kzB4i8TcWYTtMeaCEUrAeZYEpj8CgYEAmbIl9ZYo+QxNmbsQKRgEixYRKpv2Emdgai8vveUY8ny5d01lvedxSX1L5xW023QBSWjPic6GeqFPMctMUnAot/ybSeYjy63aUs2ifo0pFIceITvcoHc6Fhal7oc/BXVwRFUuq4uXmCFEJRryi4LnprNIC+X/iZDRlzwUkVZCMyQ=";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String ALIPAY_PUBLIC_KEY ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArkIT/zJVv9pPDhDk490aQ/nipxRWLVgMJrvPyMkndipR3DvcXhK7xuvSG47j3VtX4J7ChCtXWDn8grrZSjmS2uT/9ijIY3beJhTQEM2KvF/Bwy0xa27uvM/LsnD41XBMIwitH+bwjYHLsHYK8MVTrE1uSXLIixZ3YXXCgB/jPHGJFhrJkLySDlhycelWqq85+S3REpGQgTcTGT80aWABdSn/Vngl+gWwq72jrnykEvroFFpqe/RibLSVnIQQs1oVaMYruY1JKbaXK3nIqTuV0LrTt/44iJDh9+00aOBea58S5dHDvxHvm/VgysmSHBRQOKyr8hqwuLWzhpcdr0wDMQIDAQAB";
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/pay/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问(其实就是支付成功后返回的页面)
    public static String return_url = "http://localhost:8080/pay/return_url.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String CHARSET = "utf-8";

    // 支付宝网关，这是沙箱的网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "F:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
