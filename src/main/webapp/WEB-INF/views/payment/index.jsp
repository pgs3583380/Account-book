<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta content="" name="description"/>
    <meta content="webthemez" name="author"/>
    <title>小账本</title>
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
    <script type="text/javascript" src="/assets/js/echarts.min.js"></script>
</head>
<body>
<div id="wrapper">
    <jsp:include page="/common/header.jsp"/>
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                首页
                <small>欢迎 ${num.name}</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">首页</a></li>
                <li class="active">数据</li>
            </ol>

        </div>
        <div id="page-inner">
            <div class="row">
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="board">
                        <div class="panel panel-primary">
                            <div class="number">
                                <h3>
                                    <h3 id="all">${num.all}</h3>
                                    <small>总资产</small>
                                </h3>
                            </div>
                            <div class="icon">
                                <i class="fa fa-eye fa-5x red"></i>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="board">
                        <div class="panel panel-primary">
                            <div class="number">
                                <h3>
                                    <h3 id="pay">${num.pay}</h3>
                                    <small>支出</small>
                                </h3>
                            </div>
                            <div class="icon">
                                <i class="fa fa-shopping-cart fa-5x blue"></i>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="board">
                        <div class="panel panel-primary">
                            <div class="number">
                                <h3>
                                    <h3 id="income">${num.income}</h3>
                                    <small>收入</small>
                                </h3>
                            </div>
                            <div class="icon">
                                <i class="fa fa-comments fa-5x green"></i>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="board">
                        <div class="panel panel-primary">
                            <div class="number">
                                <h3>
                                    <h3 id="days">${num.days}</h3>
                                    <small>记账天数</small>
                                </h3>
                            </div>
                            <div class="icon">
                                <i class="fa fa-user fa-5x yellow"></i>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                    <div class="panel panel-default chartJs">
                        <div class="panel-heading">
                            <div class="card-title">
                                <div class="title">支出</div>
                            </div>
                        </div>
                        <div class="panel-body" id="pie-1" style="width: 600px;height:400px;">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <div class="panel panel-default chartJs">
                        <div class="panel-heading">
                            <div class="card-title">
                                <div class="title">收入</div>
                            </div>
                        </div>
                        <div class="panel-body" id="pie-2" style="width: 600px;height:400px;">

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
${num.list}
<script type="text/javascript">
    $(function () {
        $("#index").addClass("active-menu");
        var pay = echarts.init(document.getElementById('pie-1'));
        $.get('/payment/getInfo/1').done(function (data) {
            pay.hideLoading();
            pay.setOption({
                tooltip: {
                    trigger: 'axis'
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
                },
                yAxis: {
                    type: 'value'
                },
                series: [
                    {
                        name: '支出',
                        type: 'line',
                        stack: '总量',
                        data: eval(data)
                    }
                ]
            })
        })
        var income = echarts.init(document.getElementById('pie-2'));
        $.get('/payment/getInfo/2').done(function (data) {
            income.hideLoading();
            income.setOption({
                tooltip: {
                    trigger: 'axis'
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
                },
                yAxis: {
                    type: 'value'
                },
                series: [
                    {
                        name: '收入',
                        type: 'line',
                        stack: '总量',
                        data: eval(data)
                    }
                ]
            })
        })
    });
</script>
</body>
</html>