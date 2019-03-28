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


function getBillType() {
    var type = [];
    $.ajax({
        url: '/analysis/types',
        async:false,
        type: 'post',
        dataType: 'text',
        success: function (data) {
            type = data;
        },
        error: function () {
            alert("失败");
        }
    });
    return type;
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

function getTypeMoney(type,month) {
    var money = [];
    $.ajax({
        url: '/analysis/type/money',
        async:false,
        type: 'post',
        dataType: 'text',
        data: {
            'type':type.toString(),
            'month':month
        },
        success: function (data) {
            money = data;
        },
        error: function () {
            alert("失败");
        }
    });
    return money;
}

function getTypeWeekMoney(type,week) {
    var money = [];
    $.ajax({
        url: '/analysis/type/moneyWeek',
        async:false,
        type: 'post',
        dataType: 'text',
        data: {
            'type':type.toString(),
            'week':week.toString()
        },
        success: function (data) {
            money = data;
        },
        error: function () {
            alert("失败");
        }
    });
    return money;
}

function refresh() {
    var select = $('#year').val();
    var yearNew = select.split('-')[0];
    getMonthInAndOut(yearNew);
    getWeekInAndOut(select);
    getMonthType(select.toString().substr(0,7))
    getWeekType(select)
}