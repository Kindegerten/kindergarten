$(function () {
});

function changeImg() {
    var path = $("#path").val();
    // var img = document.getElementsByTagName("img")[0];
    $("#vCodeImg").attr("src", "/VerifyCodeControl/code?time=" + new Date().getTime());
    // node.src =path + "/verifyCodeServlet?time=" + new Date().getTime() ;
}
function ajax() {
    var healtherPhone = $("#healtherPhone").val();
    var healtherPwd = $("#healtherPwd").val();
    var vCode=$("#vCode").val();
    console.log(healtherPhone,vCode);
    // var user = {"healtherPhone": healtherPhone, "healtherPwd": healtherPwd};//js对象

    $.ajax({
            url:"/HealtherControl/login",
            async: true,
            type: "post",
            data: {"healtherPhone":healtherPhone,"healtherPwd":healtherPwd,"vCode":vCode},
            datatype: "text",
            success: function (msg) {
                alert(msg);
                if (msg == "登陆成功") {
                    location.href ="/healther/jsp/index.jsp";
                } else {
                    changeImg();
                }
            },
            error: function () {
                alert("网络繁忙！");
            },
        }
    );
}
