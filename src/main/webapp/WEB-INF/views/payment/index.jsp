<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
</head>

<body>
<div id="wrapper">
    <jsp:include page="/common/header.jsp"/>
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
                首页
                <small id="username"></small>
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
                                    <h3 id="all">0</h3>
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
                                    <h3 id="pay">0</h3>
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
                                    <h3 id="income">0</h3>
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
                                    <h3 id="days">0</h3>
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
                                <div class="title">收入</div>
                            </div>
                        </div>
                        <div class="panel-body" id="pie-1">
                            <canvas id="pie-chart-pay" class="chart"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <div class="panel panel-default chartJs">
                        <div class="panel-heading">
                            <div class="card-title">
                                <div class="title">支出</div>
                            </div>
                        </div>
                        <div class="panel-body" id="pie-2">
                            <canvas id="bar-chart-income" class="chart"></canvas>
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
<script src="/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="/assets/js/bootstrap.min.js"></script>

<!-- Metis Menu Js -->
<script src="/assets/js/jquery.metisMenu.js"></script>

<script type="text/javascript" src="/assets/js/chart.min.js"></script>

<script src="/assets/js/custom-scripts.js?v=201706291249"></script>
<script src="index.js?v=201706291249"></script>
</body>
</html>