<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta content="" name="description"/>
    <meta content="webthemez" name="author"/>
    <title>记一笔</title>
    <!-- Bootstrap Styles-->
    <link href="/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="/assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="/assets/js/Lightweight-Chart/cssCharts.css">

    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/laydate/laydate.js"></script>
</head>
<body>
<div id="wrapper">
    <jsp:include page="/common/header.jsp"/>
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                记账
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">记账</a></li>
            </ol>
        </div>
        <div id="page-inner">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">支出</a>
                                </li>
                                <li class=""><a href="#profile" data-toggle="tab">收入</a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="home">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-xs-2 control-label">类型</label>
                                            <div class="col-sm-6 form-inline">
                                                <select id="pay_level_1" onchange="getchild('pay')"
                                                        class="form-control">
                                                    <option value="">一级</option>
                                                </select>
                                                <select id="pay_level_2" class="form-control">
                                                    <option value="">二级</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="money" class="col-xs-2 control-label">金额</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="money" placeholder="金额">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="time" class="col-xs-2 control-label">时间</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="time" placeholder="时间"
                                                       onclick="laydate({istime: true,format:'YYYY-MM-DD hh:mm:ss'})">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="remark" class="col-xs-2 control-label">备注</label>
                                            <div class="col-sm-6">
                                                <textarea rows="3" class="form-control" id="remark"
                                                          placeholder="备注"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="time" class="col-xs-2 control-label"></label>
                                            <div class="col-sm-6">
                                                <input type="button" value="保存" class="btn btn-default"
                                                       onclick="save('pay')"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-xs-2 control-label">类型</label>
                                            <div class="col-sm-6 form-inline">
                                                <select id="income_level_1" onchange="getchild('income')"
                                                        class="form-control">
                                                    <option value="">一级</option>
                                                </select>
                                                <select id="income_level_2" class="form-control">
                                                    <option value="">二级</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="income_money" class="col-xs-2 control-label">金额</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="income_money"
                                                       placeholder="金额">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="income_time" class="col-xs-2 control-label">时间</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="income_time"
                                                       placeholder="时间"
                                                       onclick="laydate({istime: true,format:'YYYY-MM-DD hh:mm:ss'})">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="income_remark" class="col-xs-2 control-label">备注</label>
                                            <div class="col-sm-6">
                                                <textarea rows="3" class="form-control" id="income_remark"
                                                          placeholder="备注"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="time" class="col-xs-2 control-label"></label>
                                            <div class="col-sm-4">
                                                <input type="button" value="保存" class="btn btn-default"
                                                       onclick="save('income')"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var level_list = [];
    function getchild(v) {
        var parentId;
        var level;
        if (v == 'pay') {
            parentId = $("#pay_level_1").val();
            level = $("#pay_level_2");
        }
        if (v == 'income') {
            parentId = $("#income_level_1").val();
            level = $("#income_level_2");
        }
        level.children().remove();
        level.append('<option value="">二级</option>')
        $.each(level_list, function (index, item) {
            if (item.parentId == parentId) {
                level.append('<option value=' + item.id + '>' + item.categoryName + '</option>')
            }
        })
    }
    function getlevel2() {
        $.ajax({
            url: "/category/getlevel?aa=" + new Date(),
            type: "get",
            dataType: "json",
            data: {
                "level": 3
            },
            success: function (data) {
                level_list = data.list;
            }
        });
    }
    function getlevel() {
        $.ajax({
            url: "/category/getlevel?aa=" + new Date(),
            type: "get",
            dataType: "json",
            data: {
                "level": 2
            },
            success: function (data) {
                var list = data.list;
                var len = list.length;
                $.each(list, function (index, item) {
                    if (item.parentId == 1) {
                        $("#pay_level_1").append('<option value=' + item.id + '>' + item.categoryName + '</option>')
                    } else {
                        $("#income_level_1").append('<option value=' + item.id + '>' + item.categoryName + '</option>')
                    }
                })
            }
        });
    }
    function save(v) {
        var moneyType;
        var remark;
        var time;
        var money;
        var categoryType;
        var categoryParent;
        if (v == 'pay') {
            moneyType = 1;
            remark = $("#remark").val();
            time = $("#time").val();
            money = $("#money").val();
            categoryType = $("#pay_level_2").val();
            categoryParent = $("#pay_level_1").val();
        } else {
            moneyType = 2;
            remark = $("#income_remark").val();
            time = $("#income_time").val();
            money = $("#income_money").val();
            categoryType = $("#income_level_2").val();
            categoryParent = $("#income_level_1").val();
        }
        if (isEmpty(categoryType)) {
            alert("资金类型请选择第二级");
            return;
        }
        $.ajax({
            url: "/payment/saveOrupdate",
            type: "post",
            dataType: "json",
            data: {
                "money": money,
                "categoryType": categoryType,
                "moneyType": moneyType,
                "remark": remark,
                "editTime": time,
                "categoryParent": categoryParent
            },
            success: function (data) {
                var flag = data.flag;
                if (flag == 0) {
                    window.location.href = "/"
                } else {
                    alert(data.msg);
                    window.location.href = "/payment/charge";
                }
            }
        });
    }
    $(function () {
        $("#charge").addClass("active-menu");
        getlevel();
        getlevel2();
    })
</script>
</body>
</html>