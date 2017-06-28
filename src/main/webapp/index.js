$(function () {
    var ctx, data, myLineChart, options;
    Chart.defaults.global.responsive = true;
    ctx = $('#pie-chart-pay').get(0).getContext('2d');
    options = {
        showScale: false,
        scaleShowGridLines: false,
        scaleGridLineColor: "rgba(0,0,0,.05)",
        scaleGridLineWidth: 0,
        scaleShowHorizontalLines: false,
        scaleShowVerticalLines: false,
        bezierCurve: false,
        bezierCurveTension: 0.4,
        pointDot: false,
        pointDotRadius: 0,
        pointDotStrokeWidth: 2,
        pointHitDetectionRadius: 20,
        datasetStroke: true,
        datasetStrokeWidth: 4,
        datasetFill: true,
        legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
    };
    data = [
        {
            value: 300,
            color: "#FA2A00",
            highlight: "#FA2A00",
            label: "Red"
        }, {
            value: 50,
            color: "#1ABC9C",
            highlight: "#1ABC9C",
            label: "Green"
        }, {
            value: 100,
            color: "#FABE28",
            highlight: "#FABE28",
            label: "Yellow"
        }
    ];
    myLineChart = new Chart(ctx).Pie(data, options);
});
