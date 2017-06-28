$(function () {
    var colors = [
        'rgb(255, 99, 132)',
        'rgb(255, 159, 64)',
        'rgb(255, 205, 86)',
        'rgb(75, 192, 192)',
        'rgb(54, 162, 235)',
        'rgb(153, 102, 255)',
        'rgb(201, 203, 207)'
    ]
    var ctx, data, myLineChart, options;
    Chart.defaults.global.responsive = true;
    ctx = $('#pie-chart-pay').get(0).getContext('2d');
    options = {
        showScale: true,
        scaleShowGridLines: false,
        scaleGridLineColor: "rgba(0,0,0,.05)",
        scaleGridLineWidth: 0,
        scaleShowHorizontalLines: false,
        scaleShowVerticalLines: false,
        bezierCurve: false,
        bezierCurveTension: 0.4,
        pointDot: true,
        pointDotRadius: 0,
        pointDotStrokeWidth: 2,
        pointHitDetectionRadius: 20,
        datasetStroke: true,
        datasetStrokeWidth: 4,
        datasetFill: true,
        legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
    };
    data = [
        //     {
        //         value: 300,
        //         color: "#FA2A00",
        //         highlight: "#FA2A00",
        //         label: "Red"
        //     }, {
        //         value: 50,
        //         color: "#1ABC9C",
        //         highlight: "#1ABC9C",
        //         label: "Green"
        //     }, {
        //         value: 100,
        //         color: "#FABE28",
        //         highlight: "#FABE28",
        //         label: "Yellow"
        //     }
    ];
    var arr = {
        value: "",
        label: "",
        color: ""
    };
    $.ajax({
        url: "/payment/getStats.do",
        type: "post",
        dataType: "json",
        success: function (data) {
            var flag = data.flag;
            if (flag == 2) {
                alert(data.msg);
            } else {
                var list = data.list;
                data = [];
                if (list.length > 0) {
                    $.each(list, function (index, item) {
                        var count = index % (colors.length - 1);
                        arr = {
                            value: item.money,
                            label: item.categoryName,
                            color: colors[count]
                        }
                        data.push(arr);
                    })
                    myLineChart = new Chart(ctx).Pie(data, options);
                }
            }
        }
    });
});
