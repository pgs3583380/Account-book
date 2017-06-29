<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/payment/index"><strong><i class="icon fa"></i>小账本</strong></a>
        <div id="sideNav" href="">
            <i class="fa fa-bars icon"></i>
        </div>
    </div>

    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li>
                <li class="divider"></li>
                <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                </li>
            </ul>
        </li>
    </ul>
</nav>
<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li>
                <a href="/payment/index" id="index"><i class="fa fa-dashboard"></i>首页</a>
            </li>
            <li>
                <a href="/payment/charge" id="charge"><i class="fa fa-desktop"></i> 记一笔</a>
            </li>
            <li>
                <a href="/payment/capitalflow" id="capitalflow"><i class="fa fa-desktop"></i> 流水信息</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-qrcode"></i> 统计图表</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-table"></i>个人信息</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-edit"></i> 其他 </a>
            </li>
        </ul>
    </div>
</nav>
<script src="/assets/js/jquery-1.10.2.js"></script>

<script src="/assets/js/bootstrap.min.js"></script>

<script src="/assets/js/jquery.metisMenu.js"></script>

<script type="text/javascript" src="/assets/js/chart.min.js"></script>

<script src="/assets/js/custom-scripts.js?v=201706291249"></script>