<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta content="" name="description"/>
    <meta content="webthemez" name="author"/>
    <title>资金流水</title>
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
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>类别</th>
                                    <th>金额</th>
                                    <th>时间</th>
                                    <th>备注</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">详细信息</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <input type="hidden" id="infoId"/>
                                <label class="col-xs-2 control-label">类型</label>
                                <div class="col-sm-6 form-inline">
                                    <select id="level1" onchange="getchild('i')" class="form-control">
                                        <option value="">一级</option>
                                    </select>
                                    <select id="level2" class="form-control">
                                        <option value="">二级</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="money" class="col-xs-2 control-label">金额</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="money" placeholder="money">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="time" class="col-xs-2 control-label">时间</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="time" placeholder="time"
                                           onclick="laydate({istime: true,format:'YYYY-MM-DD hh:mm:ss'})">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="remark" class="col-xs-2 control-label">备注</label>
                                <div class="col-sm-6">
                                    <textarea rows="3" class="form-control" id="remark" placeholder="remark"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="update()">保存</button>
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
<script src="/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="/assets/js/dataTables/dataTables.bootstrap.js"></script>
<script type="text/javascript">
    var table;
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
                level_list_2 = data.list;
                $.each(list, function (index, item) {
                    $("#pay_level_1").append('<option value=' + item.id + '>' + item.categoryName + '</option>')

                })
            }
        });
    }
    $(function () {
        $("#capitalflow").addClass("active-menu");
        table = $('#dataTables').DataTable({
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "每页 _MENU_ 项",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
                "sInfoEmpty": "当前显示第 0 至 0 项，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页",
                    "sJump": "跳转"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            "aoColumns": [
                {data: 'id'},
                {data: 'categoryName'},//这里还可以用mDataProp
                {data: 'money'},
                {data: 'editTime'},
                {data: 'remark'},
                {data: ''}
            ],
            "ajax": {
                "url": '/payment/selectByCondition'
            },
            "columnDefs": [{
                "targets": -1, //最后一列添加删除按键
                "data": null,
                "defaultContent": "" +
                "<button id='update' class='btn btn-primary' type='button'>编辑</button>" +
                "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                "<button id='del' class='btn btn-warning' type='button'>删除</button>"//自定义内容
            }, {
                "targets": 0, //第一列隐藏
                "data": "id",
                "visible": false,//不可见
                "searchable": false
            }]
        });
        getlevel();
        getlevel2();
        $('#dataTables tbody').on('click', 'button#del', function () {
            var data = table.row($(this).parents('tr')).data();//所选择的行的数据
            if (!confirm("确定删除当前流水信息吗？")) {
                return;
            }
            $.ajax({
                url: "/payment/del",
                type: "post",
                dataType: "json",
                data: {
                    "id": data.id
                },
                success: function (data) {
                    alert(data.msg);
                    if (data.flag == 6) {
                        table.ajax.reload();
                    }
                }
            });
        });
        $('#dataTables tbody').on('click', 'button#update', function () {
            var data = table.row($(this).parents('tr')).data();//所选择的行的数据
            clearInfo();
            $.ajax({
                url: "/payment/selectOne?aaa=" + new Date(),
                type: "get",
                dataType: "json",
                data: {
                    "id": data.id
                },
                success: function (data) {
                    if (data.flag == 2) {
                        alert(data.msg)
                    } else {
                        if (null != data.payment) {
                            initInfo(data.payment);
                        }
                    }
                }
            })
        });
    })
    function update() {
        var id = $("#infoId").val();
        var categoryType = $("#level2").val();
        if (isEmpty(categoryType)) {
            alert("流水类型请选择到第二级")
            return;
        }
        var money = $("#money").val();
        var remark = $("#remark").val();
        var time = $("#time").val();
        $.ajax({
            url: "/payment/saveOrupdate",
            type: "post",
            dataType: "json",
            data: {
                "id": id,
                "money": money,
                "categoryType": categoryType,
                "remark": remark,
                "editTime": time
            },
            success: function (data) {
                var flag = data.flag;
                if (flag == 0) {
                    window.location.href = "/"
                } else {
                    alert(data.msg);
                    if (data.editCode == 4) {
                        table.ajax.reload();
                        $("#edit").modal("hide");
                    }
                }
            }
        })
    }
    function clearInfo() {
        $("#level1").children().remove();
        $("#level2").children().remove();
    }
    function initInfo(v) {
        $.each(level_list_2, function (index, item) {
            x = "";
            if (v.moneyType == item.parentId) {
                if (item.id == v.categoryParent) {
                    x += '<option value=' + item.id + ' selected="selected">' + item.categoryName + '</option>'
                } else {
                    x += '<option value=' + item.id + '>' + item.categoryName + '</option>'
                }
            }
            $("#level1").append(x);
        })
        $.each(level_list, function (index, item) {
            x = "";
            if (v.categoryParent == item.parentId) {
                if (item.id == v.categoryType) {
                    x += '<option value=' + item.id + ' selected="selected">' + item.categoryName + '</option>'
                } else {
                    x += '<option value=' + item.id + '>' + item.categoryName + '</option>'
                }
            }
            $("#level2").append(x);
        })
        $("#infoId").val(v.id);
        $("#money").val(v.money);
        $("#remark").val(v.remark);
        $("#time").val(v.editTime);
        $("#edit").modal("show");
    }
</script>
</body>
</html>