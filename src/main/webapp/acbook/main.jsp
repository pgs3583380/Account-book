<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
<head>
    <script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        function getlevel() {
            $.ajax({
                url: "/getlevel1.do?aa=" + new Date(),
                type: "get",
                dataType: "json",
                success: function (data) {
                    var list = data.list;
                    var len = list.length;
                    var level = $("#level1")
                    for (var i = 0; len > i; i++) {
                        level.append('<option value=' + list[i].id + '>' + list[i].categoryName + '</option>')
                    }
                }
            })
        }
        function getchild(v) {
            var parentId;
            var level;
            if (v == 2) {
                parentId = $("#level1").val();
                level = $("#level2");
            }
            if (v == 3) {
                parentId = $("#level2").val();
                level = $("#level3");
            }
            $.ajax({
                url: "/getchild.do?aa=" + new Date(),
                type: "get",
                dataType: "json",
                data: {
                    "parentId": parentId
                },
                success: function (data) {
                    var flag = data.flag;
                    if (flag == 200) {
                        var list = data.list;
                        if (v == 2) {
                            $("#level2").children().remove();
                            $("#level3").children().remove();
                        } else {
                            $("#level3").children().remove();
                        }
                        var len = list.length;
                        for (var i = 0; len > i; i++) {
                            level.append('<option value=' + list[i].id + '>' + list[i].categoryName + '</option>')
                        }
                    } else {
                        alert("获取数据失败");
                    }
                }
            })
        }
        function save() {
            var categoryType = $("#level3").val();
            if (isEmpty(categoryType)) {
                alert("流水类型请选择第三级");
                return;
            }
            var moneyType = $("#level1").val();
            var remark = $("#remark").val();
            var time = $("#time").val();
            var money = $("#money").val();
            $.ajax({
                url: "/saveOrupdate.do",
                type: "post",
                dataType: "json",
                data: {
                    'money': money,
                    'categoryType': categoryType,
                    'moneyType': moneyType,
                    'remark': remark
                },
                success: function (data) {
                    console.log(data);
                }
            });
        }
        $(function () {
            getlevel();
        });
    </script>
</head>
<body>
<select id="level1" onchange="getchild(2)">
    <option value="">first</option>
</select>
<select id="level2" onchange="getchild(3)">
    <option value="">second</option>
</select>
<select id="level3">
    <option value="">third</option>
</select>
<p>money<input type="text" id="money"/></p>
<p>time<input type="date" id="time"/></p>
<p>remark<input type="text" id="remark"/></p>
<p><input type="button" value="save" onclick="save()"/></p>
</body>
</html>