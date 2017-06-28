/*------------------------------------------------------
 Author : www.webthemez.com
 License: Commons Attribution 3.0
 http://creativecommons.org/licenses/by/3.0/
 ---------------------------------------------------------  */

(function ($) {
        "use strict";
        var mainApp = {

            initFunction: function () {
                /*MENU
                 ------------------------------------*/
                $('#main-menu').metisMenu();

                $(window).bind("load resize", function () {
                    if ($(this).width() < 768) {
                        $('div.sidebar-collapse').addClass('collapse')
                    } else {
                        $('div.sidebar-collapse').removeClass('collapse')
                    }
                });

            },
            initialization: function () {
                mainApp.initFunction();
                mainApp.getPayAndIncome();
                mainApp.getUser();
            },
            getPayAndIncome: function () {
                $.ajax({
                    url: "/payment/getPayAndIncome.do",
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        var flag = data.flag;
                        if (flag == 2) {
                            alert(data.msg);
                        } else {
                            var list = data.list;
                            var pay = 0;
                            var income = 0;
                            $.each(list, function (index, item) {
                                if (item.moneyType == 1) {
                                    pay = item.money;
                                } else if (item.moneyType == 2) {
                                    income = item.money;
                                }
                            })
                            $("#income").html(income);
                            $("#pay").html(pay);
                            $("#all").html(income - pay);
                        }
                    }
                });
            },
            getUser: function () {
                $.ajax({
                    url: "/getUser.do",
                    type: "get",
                    dataType: "json",
                    success: function (data) {
                        var flag = data.flag;
                        if (flag == 0) {
                            window.location.href = "login.html"
                        } else {
                            $("#days").html(data.days);
                            $("#username").html("欢迎  " + data.name);
                        }
                    }
                })
            }
        }
        // Initializing ///

        $(document).ready(function () {
            mainApp.initialization();
            $("#sideNav").click(function () {
                if ($(this).hasClass('closed')) {
                    $('.navbar-side').animate({left: '0px'});
                    $(this).removeClass('closed');
                    $('#page-wrapper').animate({'margin-left': '260px'});

                }
                else {
                    $(this).addClass('closed');
                    $('.navbar-side').animate({left: '-260px'});
                    $('#page-wrapper').animate({'margin-left': '0px'});
                }
            });
        });

    }
    (jQuery)
);
