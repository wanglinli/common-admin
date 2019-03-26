
<p>开始日期: <input type="text" id="datepickerStart">　　　结束日期: <input type="text" id="datepickerEnd"></p>　　　

<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 600px;height:400px;"></div>

<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    var outcomes = [];
    var incomes = [];
    myChart.showLoading();
    // 使用刚指定的配置项和数据显示图表。
    $(function () {
        $( "#datepickerStart" ).datepicker();
        $( "#datepickerEnd" ).datepicker();

        $.ajax({
            url: '/analysis/money',
            type: 'post',
            dataType: 'text',
            success: function (data) {
                var json = JSON.parse(data);
                outcomes = json.outcomes;
                incomes = json.incomes;
            },
            error: function () {
                alert("失败");
            }
        });
    });


    option = {
        title: {
            text: '金额统计',
            subtext: '数据来自财务管理系统'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['支出金额', '收入金额']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01]
        },
        yAxis: {
            type: 'category',
            data: ['巴西','印尼','美国','印度','中国','世界人口(万)']
        },
        series: [
            {
                name: '支出金额',
                type: 'bar',
                data: []
            },
            {
                name: '收入金额',
                type: 'bar',
                data: []
            }
        ]
    };





    setInterval(function () {
        myChart.hideLoading();
        myChart.setOption({
            series: [
             {
                name:'支出金额',
                data: outcomes
             },
             {
                name:'收入金额',
                data: incomes
             }
            ]
        });
    }, 500);
    myChart.setOption(option);

</script>