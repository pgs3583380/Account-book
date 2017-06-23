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
    var len = level_list.length;
    level.append('<option value="">二级</option>')
    for (var i = 0; i < len; i++) {
        if (level_list[i].parentId == parentId) {
            level.append('<option value=' + level_list[i].id + '>' + level_list[i].categoryName + '</option>')
        }
    }
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
            var len = list.length;
            level_list_2 = data.list;
            for (var i = 0; len > i; i++) {
                $("#pay_level_1").append('<option value=' + list[i].id + '>' + list[i].categoryName + '</option>')
            }
        }
    });
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
    var entTime = $("#endTime").val();
    $.ajax({
        url: "/payment/selectByCondition.do",
        type: "post",
        dataType: "json",
        data: {
            "categoryType": categoryType,
            "startTime": startTime,
            "endTIme": entTime,
            "categoryParent": categoryType1
        },
        success: function (data) {
            var flag = data.flag;
            if (flag == 2) {
                alert(data.msg);
            } else {
                var list = data.list;
                var len = list.length;
                $("#info").children().remove();
                if (len == 0) {
                    $("#info").append('<tr>'
                        + '<th>未找到流水记录</th>'
                        + '</tr>')
                } else {
                    for (var i = 0; i < len; i++) {
                        var x = "";
                        x = '<tr><td><input type="button" value="see" class="btn btn-info"  onclick="selectOne(' + list[i].id + ')"></td>'
                            + '<td>' + list[i].categoryName + '</td>'
                        if (list[i].moneyType == 1) {
                            x += '<td class="money-pay">' + list[i].money + '</td>'
                        } else {
                            x += '<td class="money-income">' + list[i].money + '</td>'
                        }
                        x += '<td>' + list[i].editTime + '</td>'
                            + '<td>' + list[i].remark + '</td>'
                            + '<td><input type="button" value="delete" class="btn btn-warning" onclick="del(' + list[i].id + ')"></td>'
                            + '</tr>'
                        $("#info").append(x);
                    }
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
    var len1 = level_list.length;
    var len2 = level_list_2.length;
    for (var i = 0; i < len2; i++) {
        x = "";
        if (v.moneyType == level_list_2[i].parentId) {
            if (level_list_2[i].id == v.categoryParent) {
                x += '<option value=' + level_list_2[i].id + ' selected="selected">' + level_list_2[i].categoryName + '</option>'
            } else {
                x += '<option value=' + level_list_2[i].id + '>' + level_list_2[i].categoryName + '</option>'
            }
        }
        $("#level1").append(x);
    }
    for (var i = 0; i < len1; i++) {
        x = "";
        if (v.categoryParent == level_list[i].parentId) {
            if (level_list[i].id == v.categoryType) {
                x += '<option value=' + level_list[i].id + ' selected="selected">' + level_list[i].categoryName + '</option>'
            } else {
                x += '<option value=' + level_list[i].id + '>' + level_list[i].categoryName + '</option>'
            }
        }
        $("#level2").append(x);
    }
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
                window.location.href = "../login.html"
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
    window.location.href = "main.html";
}
$(function () {
    getlevel();
    getlevel2();
});