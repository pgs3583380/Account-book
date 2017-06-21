<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
<head>
    <script type="text/javascript" src="../js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        function login() {
            var username = $("#username").val();
            var password = $("#password").val();
            if (isEmpty(username) || isEmpty(password)) {
                alert("用户名或者密码不能为空");
                return;
            }
            $.ajax({
                url: "/login.do",
                type: "post",
                dataType: "json",
                data: {
                    "username": username,
                    "password": password
                },
                success: function (data) {
                    var flag = data.flag;
                    if (flag == 1) {
                        window.location.href = "acbook/main.jsp";
                    } else {
                        alert(flag.msg);
                    }
                }
            })
        }
    </script>
</head>
<body>
<h2>Hello pan!</h2>
</body>
</html>