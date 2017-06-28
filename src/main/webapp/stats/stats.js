var config = {
    type: 'pie',
    data: {
        datasets: [{
            data: [],
            backgroundColor: [
                window.chartColors.red,
                window.chartColors.orange,
                window.chartColors.yellow,
                window.chartColors.green,
                window.chartColors.blue,
                window.chartColors.purple,
                window.chartColors.grey
            ],
            label: 'Dataset 1'
        }],
        labels: []
    },
    options: {
        responsive: true
    }
};

function init() {
    $("#canvas-holder").children().remove();
    $("#canvas-holder").append('<canvas id="chart-area"/>');
    var ctx = document.getElementById("chart-area").getContext("2d");
    window.myPie = new Chart(ctx, config);
};
function reback() {
    window.location.href = "/info/payments.html";
}
function getPayAndIncome() {
    var startTime = $("#startTime").val();
    var endTime = $("#endTime").val();
    $.ajax({
        url: "/payment/getPayAndIncome.do",
        type: "post",
        dataType: "json",
        data: {
            "startTime": startTime,
            "endTime": endTime,
        },
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
}
function getStats() {
    var startTime = $("#startTime").val();
    var endTime = $("#endTime").val();
    $("#canvas-holder").children().remove();
    $("#canvas-holder").append('<canvas id="chart-area"/>');
    var moneyType = $("#btn_all input:radio:checked").val()
    $.ajax({
        url: "/payment/getStats.do",
        type: "post",
        dataType: "json",
        data: {
            "startTime": startTime,
            "endTime": endTime,
            "moneyType": moneyType
        },
        success: function (data) {
            var flag = data.flag;
            if (flag == 2) {
                alert(data.msg);
            } else {
                var list = data.list;
                config.data.datasets[0].data = []
                config.data.labels = [];
                if (list.length > 0) {
                    $.each(list, function (index, item) {
                        config.data.datasets[0].data.push(item.money);
                        config.data.labels.push(item.categoryName);

                    })
                    init()
                }
            }
        }
    });
}
$(function () {
    getPayAndIncome();
    getStats();
    $("input[name='options']").change(function () {
        getStats();
    })
});