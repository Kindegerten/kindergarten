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

// function testphone() {
//     var phoneNode = document.getElementById("healtherPhone");
//     var phone = phoneNode.value;
//     var spanNode = phone.nextElementSibling;
//     if (/^1(?:3\d|4[4-9]|5[0-35-9]|6[67]|7[013-8]|8\d|9\d)\d{8}$/.test(phone)) {
//         spanNode.innerText = "√";
//         phoneNode.parentNode.appendChild(spanNode);
//     } else {
//         spanNode.innerText = "号码格式错误";
//         phoneNode.parentNode.appendChild(spanNode);
//         // alert(" 不符合要求");
//     }
// }

// function testpassword() {
//     var passwordNode = document.getElementById("healtherPwd");
//     var password = passwordNode.value;
//     var spanNode = passwordNode.nextElementSibling;
//     if (password == null || password.length == 0) {
//         spanNode.innerText = "密码不能为空";
//         passwordNode.parentNode.appendChild(spanNode);
//     } else {
//         spanNode.innerText = "√";
//         passwordNode.parentNode.appendChild(spanNode);
//     }
// }