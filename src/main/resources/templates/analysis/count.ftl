<style>
    table {
        cellspacing: 0;
        *border-collapse: collapse; /* IE7 and lower */
        border-spacing: 0;
        width: 100%;
    }

    .bordered tr:hover {
        background: #fbf8e9;
        -o-transition: all 0.1s ease-in-out;
        -webkit-transition: all 0.1s ease-in-out;
        -moz-transition: all 0.1s ease-in-out;
        -ms-transition: all 0.1s ease-in-out;
        transition: all 0.1s ease-in-out;
    }

    .bordered th {
        padding: 7px;
        text-align: center;
        cellspacing: 0;
    }

    .bordered td {
        padding: 7px;
        text-align: center;
        cellspacing: 0;
    }


    .bordered th {

        background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
        background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
        background-image: linear-gradient(top, #ebf3fc, #dce9f9);
    }

    .bordered td:first-child, .bordered th:first-child {
        border-left: none;
    }


    .bordered tr:nth-of-type(2n) {
        background: #FFFFFF;
        cursor: pointer;
    }

    .bordered tr:nth-of-type(2n+1) {
        background: #F7FAFC;
        cursor: pointer;
    }

    .bordered tbody tr:hover {
        background: #fbf8e9;
        -o-transition: all 0.1s ease-in-out;
        -webkit-transition: all 0.1s ease-in-out;
        -moz-transition: all 0.1s ease-in-out;
        -ms-transition: all 0.1s ease-in-out;
        transition: all 0.1s ease-in-out;
    }

</style>
<div class="row">
    <div class="col-md-6">
        <label for="year">请选择时间</label>
        <input type="text" id="year" />　
        <button class="btn btn-primary" onclick="refresh()">查询</button>
    </div>
</div>
<div class="row" style="margin-top: 10px">
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div class="col-md-6">
        <div id="leftYearMonth" style="width: 500px;height:400px;"></div>
    </div>
    <div class="col-md-6">
        <div id="rightMonthWeek" style="width: 500px;height:400px;"></div>
    </div>
</div>



<script type="text/javascript">
    $('#year').datepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayHighlight: true
    });


    function getWeek(i,date) {
        var now = new Date(date);
        var firstDay=new Date(now - (now .getDay() - 1 ) * 86400000);
        firstDay.setDate(firstDay.getDate() + i);
        var mon = Number(firstDay.getMonth()) + 1;
        if (mon < 10) {
            mon = "0"+mon
        }
        var day = firstDay.getDate();
        if (day < 10){
            day = "0" + day;
        }
        return   now.getFullYear() + "-" + mon + "-" + day;
    }

    function getTable(opt, colName, typeName) {
        var axisData = opt.xAxis[0].data;//获取图形的data数组
        var series = opt.series;//获取series
        var num = 0;//记录序号
        var sum = new Array();//获取合计数组（根据对应的系数生成相应数量的sum）
        for (var i = 0; i < series.length; i++) {
            sum[i] = 0;
        }
        var table = '<table class="bordered"><thead><tr>'
            + '<th>' + colName + '</th>'
            + '<th>' + typeName + '</th>';
        for (var i = 0; i < series.length; i++) {
            table += '<th>' + series[i].name + '</th>'
        }
        table += '</tr></thead><tbody>';
        for (var i = 0, l = axisData.length; i < l; i++) {
            num += 1;
            for (var n = 0; n < series.length; n++) {
                if (series[n].data[i]) {
                    sum[n] += Number(series[n].data[i]);
                } else {
                    sum[n] += Number(0);
                }

            }
            table += '<tr>'
                + '<td>' + num + '</td>'
                + '<td>' + axisData[i] + '</td>';
            for (var j = 0; j < series.length; j++) {
                if (series[j].data[i]) {
                    table += '<td>' + series[j].data[i] + '</td>';
                } else {
                    table += '<td>' + 0 + '</td>';
                }

            }
            table += '</tr>';
        }
        //最后一行加上合计
        table += '<tr>' + '<td>' + (num + 1) + '</td>' + '<td>合计</td>';
        for (var n = 0; n < series.length; n++) {
            if (String(sum[n]).indexOf(".") > -1)
                table += '<td>' + (Number(sum[n])).toFixed(2) + '</td>';
            else
                table += '<td>' + Number(sum[n]) + '</td>';
        }
        table += '</tr></tbody></table>';
        return table;
    }

    function getInAndOut(year) {
        // 基于准备好的dom，初始化echarts实例
        var leftYearMonth = echarts.init(document.getElementById('leftYearMonth'));
        //x轴月份
        var months = ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];
        leftYearMonth.showLoading();

        //收入
        var res = [];
        $.ajax({
            url: '/analysis/yearAndMonthIn',
            async:false,
            type: 'post',
            dataType: 'text',
            data:{'year':year},
            success: function (data) {
                var temp = JSON.parse(data);
                res[0] = parseFloat(temp.one);
                res[1] = parseFloat(temp.two);
                res[2] = parseFloat(temp.three);
                res[3] = parseFloat(temp.four);
                res[4] = parseFloat(temp.five);
                res[5] = parseFloat(temp.six);
                res[6] = parseFloat(temp.seven);
                res[7] = parseFloat(temp.eight);
                res[8] = parseFloat(temp.nine);
                res[9] = parseFloat(temp.ten);
                res[10] = parseFloat(temp.eleven);
                res[11] = parseFloat(temp.twelve);

                //支出
                var resOut = [];
                $.ajax({
                    url: '/analysis/yearAndMonthOut',
                    type: 'post',
                    dataType: 'text',
                    data:{'year':year},
                    success: function (data) {
                        var temp = JSON.parse(data);
                        resOut[0] = parseFloat(temp.one);
                        resOut[1] = parseFloat(temp.two);
                        resOut[2] = parseFloat(temp.three);
                        resOut[3] = parseFloat(temp.four);
                        resOut[4] = parseFloat(temp.five);
                        resOut[5] = parseFloat(temp.six);
                        resOut[6] = parseFloat(temp.seven);
                        resOut[7] = parseFloat(temp.eight);
                        resOut[8] = parseFloat(temp.nine);
                        resOut[9] = parseFloat(temp.ten);
                        resOut[10] = parseFloat(temp.eleven);
                        resOut[11] = parseFloat(temp.twelve);

                        var inMoney =  res;
                        //收入数组
                        var outMoney = resOut;

                        //金额数组
                        var colors = ['#FD2446', '#248EFD', '#C916F2', '#6669B1'];//自定义一个颜色数组，多系时会按照顺序使用自己定义的颜色数组，若不定义则使用默认的颜色数组

                        // 指定图表的配置项和数据
                        var option = {
                            color: colors,
                            title: {
                                text: year +'年月支出收入统计与对比',
                                textStyle: {//主标题文本样式{"fontSize": 18,"fontWeight": "bolder","color": "#333"}
                                    fontFamily: 'Arial, Verdana, sans...',
                                    fontSize: 12,
                                    fontStyle: 'normal',
                                    fontWeight: 'normal'
                                },
                                padding: 15
                            },
                            tooltip: {},
                            legend: {
                                data: ['收入','支出']
                            },
                            xAxis: {
                                data: months
                            },
                            yAxis: {},
                            toolbox: {
                                show: true,
                                orient: 'horizontal',
                                showTitle: true,
                                feature: {
                                    magicType: {
                                        type: ['line', 'bar']
                                    },
                                    dataView: {
                                        show: true,
                                        title: '个人支出与收入金额统计',
                                        readOnly: false,
                                        optionToContent: function (opt) {
                                            var colName = "序号";
                                            var typeName = "月份";
                                            var dataview = opt.toolbox[0].feature.dataView;  //获取dataview
                                            var table = '<div style="position:absolute;top: 5px;left: 0px;right: 0px;line-height: 1.4em;text-align:center;font-size:14px;">' + dataview.title + '</div>'
                                            table += getTable(opt, colName, typeName);
                                            return table;
                                        }
                                    },
                                    saveAsImage: {
                                        type: 'png',
                                        show: true,
                                        title: '保存为图片'
                                    },
                                    restore: {show: true}
                                }
                            },
                            series: [{
                                name: '收入',
                                type: 'bar',
                                barMaxWidth: '20%',
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'top'
                                    }
                                },
                                data: inMoney
                            },
                                {
                                    name: '支出',
                                    type: 'bar',
                                    barMaxWidth: '20%',
                                    label: {
                                        normal: {
                                            show: true,
                                            position: 'top'
                                        }
                                    },
                                    data: outMoney
                                }]
                        };



                        // 使用刚指定的配置项和数据显示图表。
                        leftYearMonth.hideLoading();
                        leftYearMonth.setOption(option);
                    },
                    error: function () {
                        alert("失败");
                    }
                });
            },
            error: function () {
                alert("失败");
            }
        });
    }

    function getInAndOutByWeek(week) {


        var rightMonthWeek = echarts.init(document.getElementById('rightMonthWeek'));
        //x轴
        var day = [getWeek(0,week), getWeek(1,week), getWeek(2,week), getWeek(3,week), getWeek(4,week), getWeek(5,week), getWeek(6,week)];

        // var day = [getYearWeek(0,week), getYearWeek(1,week), getYearWeek(2,week), getYearWeek(3,week), getYearWeek(4,week), getYearWeek(5,week), getYearWeek(6,week)];
        day.push(week.split('-')[0]);
        rightMonthWeek.showLoading();

        console.log(day.toString())
        //收入
        var res = [];
        $.ajax({
            url: '/analysis/weekIn',
            async:false,
            type: 'post',
            dataType: 'text',
            data:{'week':day.toString()},
            success: function (data) {
                var temp = JSON.parse(data);
                res[0] = parseFloat(temp.one);
                res[1] = parseFloat(temp.two);
                res[2] = parseFloat(temp.three);
                res[3] = parseFloat(temp.four);
                res[4] = parseFloat(temp.five);
                res[5] = parseFloat(temp.six);
                res[6] = parseFloat(temp.seven);

                //支出
                var resOut = [];
                $.ajax({
                    url: '/analysis/weekOut',
                    type: 'post',
                    dataType: 'text',
                    data:{'week':day.toString()},
                    success: function (data) {
                        var temp = JSON.parse(data);
                        resOut[0] = parseFloat(temp.one);
                        resOut[1] = parseFloat(temp.two);
                        resOut[2] = parseFloat(temp.three);
                        resOut[3] = parseFloat(temp.four);
                        resOut[4] = parseFloat(temp.five);
                        resOut[5] = parseFloat(temp.six);
                        resOut[6] = parseFloat(temp.seven);

                        var inMoney =  res;
                        //收入数组
                        var outMoney = resOut;

                        //金额数组
                        var colors = ['#FD2446', '#248EFD', '#C916F2', '#6669B1'];//自定义一个颜色数组，多系时会按照顺序使用自己定义的颜色数组，若不定义则使用默认的颜色数组

                        // 指定图表的配置项和数据
                        var option = {
                            color: colors,
                            title: {
                                text: week.split('-')[0] +'年'+week.split('-')[1]+'月'+week.split('-')[2]+'日最近一周',
                                textStyle: {//主标题文本样式{"fontSize": 18,"fontWeight": "bolder","color": "#333"}
                                    fontFamily: 'Arial, Verdana, sans...',
                                    fontSize: 12,
                                    fontStyle: 'normal',
                                    fontWeight: 'normal'
                                },
                                padding: 15
                            },
                            tooltip: {},
                            legend: {
                                data: ['收入','支出']
                            },
                            xAxis: {
                                data: day
                            },
                            yAxis: {},
                            toolbox: {
                                show: true,
                                orient: 'horizontal',
                                showTitle: true,
                                feature: {
                                    magicType: {
                                        type: ['line', 'bar']
                                    },
                                    dataView: {
                                        show: true,
                                        title: '个人支出与收入金额统计',
                                        readOnly: false,
                                        optionToContent: function (opt) {
                                            var colName = "序号";
                                            var typeName = "日期";
                                            var dataview = opt.toolbox[0].feature.dataView;  //获取dataview
                                            var table = '<div style="position:absolute;top: 5px;left: 0px;right: 0px;line-height: 1.4em;text-align:center;font-size:14px;">' + dataview.title + '</div>'
                                            table += getTable(opt, colName, typeName);
                                            return table;
                                        }
                                    },
                                    saveAsImage: {
                                        type: 'png',
                                        show: true,
                                        title: '保存为图片'
                                    },
                                    restore: {show: true}
                                }
                            },
                            series: [{
                                name: '收入',
                                type: 'bar',
                                barMaxWidth: '20%',
                                label: {
                                    normal: {
                                        show: true,
                                        position: 'top'
                                    }
                                },
                                data: inMoney
                            },
                                {
                                    name: '支出',
                                    type: 'bar',
                                    barMaxWidth: '20%',
                                    label: {
                                        normal: {
                                            show: true,
                                            position: 'top'
                                        }
                                    },
                                    data: outMoney
                                }]
                        };



                        // 使用刚指定的配置项和数据显示图表。
                        rightMonthWeek.hideLoading();
                        rightMonthWeek.setOption(option);
                    },
                    error: function () {
                        alert("失败");
                    }
                });
            },
            error: function () {
                alert("失败");
            }
        });
    }
    var date = new Date();
    var year = date.getFullYear();

    getInAndOut(year);
    getInAndOutByWeek(date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate());

    function refresh() {
        var select = $('#year').val();
        var yearNew = select.split('-')[0];
        getInAndOut(yearNew);
        getInAndOutByWeek(select)
    }
</script>
