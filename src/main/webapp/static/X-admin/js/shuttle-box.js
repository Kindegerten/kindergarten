$(function () {

    $.ajax({
        url: "/platformController/selectRole",
        type: "post",
        dataType: "json",
        success: function (datas) {
            // console.log("datas.menu"+datas.menu)
            if (datas.length > 0) {
                $("#roleName").empty();
                // $("#parentName").append("<option value=''>菜单</option>");
                for (var i = 0; i < datas.length; i++) {
                    var role = datas[i];
                    $("#roleName").append("<option value=" + role.roleId + ">" + role.roleName + "</option>");
                }
            } else {
                $("#roleName").empty();
                // $("#parentName").append("<option value=''>菜单</option>");
            }
            // form.render("select");
        }
    });
    var piece_frame;
    $(document).on("click", ".frame-btn", function () {

        piece_frame = layer.open({
            type: 1, //类型，解析url   1（页面层）
            title: false, //页面标题
            area: ['700px', '556px'], //弹出层页面比例
            closeBtn: 0,//关闭按钮是否显示 1 显示 0 不显示
            scrollbar: false, //默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
            skin: 'yourclass',//设定样式
            content: $('.freight-frame-wrap'),//弹出层的url
            success: function () {
                var div=$("#freight-formwork");
                div.empty();
                var rid= $("#roleName").val();
                console.log("rid"+rid)
                $.ajax({
                    //  url: 'static/js/quanxian.json',
                    url: '/platformController/selectMenuDemoThree?rid='+rid,
                    type: 'get',
                    dataType: 'json',

                    success: function (data) {
                        console.log( JSON.stringify(data))
                        // console.log("data:" + data)
                        var $city = '<ul class="f_province">',
                            $data = data.data.list[0]['_child'];//得到省市区的数据
                        // console.log("$data:" + data.data.list[1]);
                        for (var province in $data) { //省级
                            $city += '<li class="f_province_list' + province + '">' +
                                '<span class="f_list"><label id="' + province + '" class="f_list_p' + province + '">' +
                                '<i></i><input class="checkedInput" type="checkbox" />' +
                                '</label><em>' + $data[province].regionName + '</em>' +
                                '</span>' +
                                '<ul class="f_city">';
                            for (var city in $data[province]._child) { //市级
                                $city += '<li>' +
                                    '<span class="f_list">' +
                                    '<label id="' + city + '"  class="f_list_c' + city + '">' +
                                    '<i></i><input class="checkedInput" type="checkbox" />' +
                                    '</label>' +
                                    '<em>' + $data[province]['_child'][city].regionName + '</em>' +
                                    '</span><ul class="f_area">';
                                for (var area in $data[province]['_child'][city]._child) { //区级
                                    $city += '<li>' +
                                        '<span class="f_list">' +
                                        '<label id="' + area + '"  class="f_list_a' + area + '">' +
                                        '<i></i><input class="checkedInput" type="checkbox" />' +
                                        '</label>' +
                                        '<em>' + $data[province]['_child'][city]['_child'][area].regionName + '</em>' +
                                        '</span>' +
                                        '</li>';
                                }
                                $city += '</ul></li>';
                            }
                            $city += '</ul></li>';
                        }
                        $city += '</ul>';
                        // console.log("$city:" + $city)
                        $("#freight-formwork").append($city);//左边添加区
                        $("#freight-formwork_checked").append($city);//右边添加区 一样的

                        // 全选
                        function checkInputAll(selector) {
                            $(selector).on("click", function () {
                                var checked = $(this).prop("checked");//获取匹配的元素集中第一个元素的属性（property）值  true/false
                                if (checked) {
                                    //：addClass为每个匹配的元素添加指定的样式类名
                                    //siblings：获得匹配元素集合中每个元素的兄弟元素,可以提供一个可选的选择器。。
                                    $(this).parents(".f_list").siblings("ul").find(".checkedInput").prop("checked", true).siblings("i").addClass("checked");//siblings兄弟节点，

                                } else {
                                    $(this).parents(".f_list").siblings("ul").find(".checkedInput").prop("checked", false).siblings("i").removeClass("checked");
                                }
                            });
                        }

                        checkInputAll(".frame-wrap .f_province > li > span .checkedInput");
                        checkInputAll(".frame-wrap .f_city > li > span .checkedInput");

                        // 单选
                        function checkInputSolo(selector, parents, parents2) {
                            $(selector).on("click", function () {
                                var $parent = $(this).parents(parents).children("li"),
                                    checkedArr = [], checkedArr2 = [];
                                $parent.find(".checkedInput").each(function () {
                                    var checked = $(this).prop("checked");
                                    checkedArr.push(checked);//push() 方法可向数组的末尾添加一个或多个元素，并返回新的长度。
                                    if (checkedArr.indexOf(false) !== -1) {//如果要检索的字符串值没有出现，则该方法返回 -1。
                                        $(this).parents(parents).siblings(".f_list").find(".checkedInput").prop("checked", false).siblings("i").removeClass("checked");
                                    } else {
                                        $(this).parents(parents).siblings(".f_list").find(".checkedInput").prop("checked", true).siblings("i").addClass("checked");
                                    }
                                });
                                if (parents2 !== '') {
                                    var $parent2 = $(this).parents(parents2).children("li");
                                    $parent2.children("span").find(".checkedInput").each(function () {
                                        var checked = $(this).prop("checked");
                                        checkedArr2.push(checked);
                                        if (checkedArr2.indexOf(false) !== -1) {
                                            $(this).parents(parents2).siblings(".f_list").find(".checkedInput").prop("checked", false).siblings("i").removeClass("checked");
                                        } else {
                                            $(this).parents(parents2).siblings(".f_list").find(".checkedInput").prop("checked", true).siblings("i").addClass("checked");
                                        }
                                    });
                                }
                            });
                        }

                        checkInputSolo(".frame-wrap .f_city > li > span .checkedInput", ".frame-wrap .f_city", '');
                        checkInputSolo(".frame-wrap .f_area .checkedInput", '.f_area', '.frame-wrap .f_city');
                    }
                });
            }
        });
    });

    // 点击确定按钮 返回数据给后台
    $(document).on("click", ".freight-frame .confirm", function (e) {
        var rid= $("#roleName").val();
        var sourceArr2 = [];
        $(".frame_right .f_city .checkedInput").each(function () {
            var selected = $(this).attr('select');

            if (selected) {
                var $city = parseInt($(this).parents(".f_city").siblings().find("label").prop('id')),
                    $province = parseInt($(this).parents(".f_province").siblings().find("label").prop('id'));
                sourceArr2.push($province);
                sourceArr2.push($city);
                sourceArr2.push(parseInt($(this).parent().prop('id')));
            }
        });
        // console.log("this:"+this)
        console.log(sourceArr2);
        sourceArr2.sort();
        sourceArr2= $.unique(sourceArr2);//去重
        // alert("sss")
        //  console.log( $.uniqueSort(sourceArr2));
         console.log(sourceArr2);
         var arr=[];
        for(var i=0;i<sourceArr2.length;i++){
            if(sourceArr2[i]===sourceArr2[i]){
                arr.push(sourceArr2[i]);
            }
        }
        // return arr;
        if (arr.length>0){
            $.ajax({
                url: "/platformController/updatePermissions",
                type: "post",
                dataType: "text",
                traditional:true,
                data:{
                    sourceArr2:arr,
                    rid:rid
                },
                success: function (datas) {
                    if (datas=="success"){
                        alert("配置成功");
                    }
                    layer.close(piece_frame);
                    window.parent.location.reload();
                    $("#freight-formwork_checked").empty();//右边添加区 一样的
                }
            });
        }else {
            alert("请选择需要配置的权限");
        }


    });

    // 关闭弹框
    $(document).on("click", ".freight-frame .cancel, .close-frame-btn", function (e) {
        layer.close(piece_frame);
    });

    // 复选框按钮
    $(document).on("click", ".checkedInput", function (e) {
        e.stopPropagation();
        var checked = $(this).prop("checked");
        if (checked) {
            $(this).siblings("i").addClass("checked");
        } else {
            $(this).siblings("i").removeClass("checked");
        }
    });

    // 展开收缩
    $(document).on("click", ".frame-wrap .f_list em", function () {
        $(this).parent().toggleClass("active").siblings("ul").slideToggle();
    });

    // 右移
    $(".frame-wrap .right_btn").on("click", function () {
        $(".frame_left .checkedInput").each(function () {
            var $checked = $(this).prop("checked");
            if ($checked) {
                //$(elem).attr("checked")  "checked" (String) 复选框的初始状态;不会改变
                var $parents = $(this).parents("[class ^= f_province_list]").attr('class'),
                    $parent = $(this).parent().attr('class');
                $(".frame_right").find('.' + $parents).find('.' + $parent).find(".checkedInput").prop("checked", true).attr('select', 'selected').siblings("i").addClass("checked").parents(".f_list").addClass("active").parent().show().parents("ul").show().siblings(".f_list").addClass("active").parents().show();
                $(this).parents(".f_list").parent().hide();
            }
        });
    });

    // 左移
    $(".frame-wrap .left_btn").on("click", function () {
        $(".frame_right .checkedInput").each(function () {
            var $checked = $(this).prop("checked");
            if ($checked) {
                var $parents = $(this).parents("[class ^= f_province_list]").attr('class'),
                    $parent = $(this).parent().attr('class');
                $(".frame_left").find('.' + $parents).find('.' + $parent).parents(".f_list").addClass("active").parent().show().parents("ul").show().siblings(".f_list").addClass("active").parents().show();
                $(this).removeAttr('select').parents(".f_list").parent().hide();
            }
        });
    });

});
