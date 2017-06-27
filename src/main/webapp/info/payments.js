var level_list = [];
var level_list_2 = [];
function getchild(v) {
    var parentId;
    var level;
    if (v == 's') {
        parentId = $("#pay_level_1").val();
        level = $("#pay_level_2");
    } else {
        parentId = $("#level1").val();
        level = $("#level2");
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
        url: "/getlevel.do?aa=" + new Date(),
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
        url: "/getlevel.do?aa=" + new Date(),
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
function reback() {
    window.location.href = "/login.html";
}
function del(id) {
    if (!confirm("确定删除当前流水信息吗？")) {
        return;
    }
    $.ajax({
        url: "/payment/del.do",
        type: "post",
        dataType: "json",
        data: {
            "id": id
        },
        success: function (data) {
            alert(data.msg);
            if (data.flag == 6) {
                searchInfo();
            }
        }
    });
}
function searchInfo() {
    var categoryType = $("#pay_level_2").val();
    var categoryType1 = $("#pay_level_1").val();
    var startTime = $("#startTime").val();
    var endTime = $("#endTime").val();
    $.ajax({
        url: "/payment/selectByCondition.do",
        type: "post",
        dataType: "json",
        data: {
            "categoryType": categoryType,
            "startTime": startTime,
            "endTime": endTime,
            "categoryParent": categoryType1
        },
        success: function (data) {
            var flag = data.flag;
            if (flag == 2) {
                alert(data.msg);
            } else {
                var list = data.list;
                $("#info").children().remove();
                if (list.length == 0) {
                    $("#info").append('<tr>'
                        + '<th>未找到流水记录</th>'
                        + '</tr>')
                } else {
                    $.each(list, function (index, item) {
                        var x = "";
                        x = '<tr><td><input type="button" value="see" class="btn btn-info"  onclick="selectOne(' + item.id + ')"></td>'
                            + '<td>' + item.categoryName + '</td>'
                        if (item.moneyType == 1) {
                            x += '<td class="money-pay">' + item.money + '</td>'
                        } else {
                            x += '<td class="money-income">' + item.money + '</td>'
                        }
                        x += '<td>' + item.editTime + '</td>'
                            + '<td>' + item.remark + '</td>'
                            + '<td><input type="button" value="delete" class="btn btn-warning" onclick="del(' + item.id + ')"></td>'
                            + '</tr>'
                        $("#info").append(x);
                    });
                }
            }
        }
    });
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
function selectOne(id) {
    clearInfo();
    $.ajax({
        url: "/payment/selectOne.do?aaa=" + new Date(),
        type: "get",
        dataType: "json",
        data: {
            "id": id
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
}
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
        url: "/payment/saveOrupdate.do",
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
                window.location.href = "/login.html"
            } else {
                alert(data.msg);
                if (data.editCode == 4) {
                    searchInfo();
                    $("#edit").modal("hide");
                }
            }
        }
    })
}
function add() {
    window.location.href = "/info/addInfo.html";
}
function toStats() {
    window.location.href = "/stats/stats.html";
}
$(function () {
    getlevel();
    getlevel2();
    searchInfo();
});