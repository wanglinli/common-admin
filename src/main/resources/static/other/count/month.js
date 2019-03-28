function getMonthInAndOut(month,id) {
    // 基于准备好的dom，初始化echarts实例
    var leftYearMonth = echarts.init(document.getElementById(id));
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
        data:{'year':month},
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
                data:{'year':month},
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
                            text: month +'年月支出与收入',
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
                                    title: month+'年个人支出与收入金额统计',
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
                            type: 'line',
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
                                type: 'line',
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



function getMonthType(month,id) {
    var dom = document.getElementById(id);
    var myChart = echarts.init(dom);
    var data = genData(month);
    option = {
        title : {
            text: month+' 交易类型统计',
            subtext: '来源个人财务系统',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            type: 'scroll',
            orient: 'vertical',
            right: 10,
            top: 20,
            bottom: 20,
            data: data.legendData,

            selected: data.selected
        },
        series : [
            {
                name: '类型',
                type: 'pie',
                radius : '55%',
                center: ['40%', '50%'],
                data: data.seriesData,
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };


    function genData(month) {
        var temp = getBillType();
        var tempValue = getTypeMoney(temp,month);
        var type;
        var showValue;
        type = JSON.parse(temp);
        showValue = JSON.parse(tempValue);
        var legendData = [];
        var seriesData = [];
        var selected = {};
        for (var i = 0; i < type.length; i++) {
           var name = type[i];
            legendData.push(name);
            seriesData.push({
                name: name,
                value: showValue[i]
            });
            selected[name] = i < 6;
        }

        return {
            legendData: legendData,
            seriesData: seriesData,
            selected: selected
        };

        // function makeWord(max, min) {
        //     var nameLen = Math.ceil(Math.random() * max + min);
        //     var name = [];
        //     for (var i = 0; i < nameLen; i++) {
        //         name.push(nameList[Math.round(Math.random() * nameList.length - 1)]);
        //     }
        //     return name.join('');
        // }
    }

    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
}