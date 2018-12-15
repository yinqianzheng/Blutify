
var ctx = document.getElementById("gameStats").getContext("2d");
ctx.canvas.width = 180;
ctx.canvas.height = 180;
window.myDoughnut = new Chart(ctx).Doughnut(gameStats, {});

var champData = {
    labels: [],
    datasets: [
        {
          
        },
        {
           
        }
    ]
};
var ctx = document.getElementById("champData").getContext("2d");
window.myBarChart = new Chart(ctx).Bar(champData, {responsive: true});


var ctx = document.getElementById("roleStats").getContext("2d");
ctx.canvas.width = 180;
ctx.canvas.height = 180;
window.myPolarArea = new Chart(ctx).PolarArea(roleStats, {responsive: false});

var timeData = {
    labels: ["January", "February", "March", "April", "May"],
    datasets: [
        {
            label: "This Year",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [65, 59, 80, 81, 56]
        },
        {
            label: "Last Year",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [28, 48, 40, 19, 86]
        }
    ]
};
var ctx = document.getElementById("timeData").getContext("2d");
window.myLineChart = new Chart(ctx).Line(timeData, {responsive: true});