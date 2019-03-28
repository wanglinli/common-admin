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
        <div id="leftMonth" style="width: 500px;height:400px;"></div>
    </div>
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div class="col-md-6">
        <div id="rightMonthCompare" style="width: 500px;height:400px;"></div>
    </div>

</div>

<div class="row" style="margin-top: 10px">
    <div class="col-md-6">
        <div id="leftWeek" style="width: 500px;height:400px;"></div>
    </div>
    <div class="col-md-6">
        <div id="rightWeekCompare" style="width: 500px;height:400px;"></div>
    </div>
</div>


<script type="text/javascript">
    $('#year').datepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        autoclose: true,
        todayHighlight: true
    });
    var date = new Date();
    var year = date.getFullYear();

    console.log(year+"-" + (date.getMonth() + 1))
    getMonthInAndOut(year,'leftMonth');
    var month = Number(date.getMonth()) + 1;
    if (month < 10){
        month = "-0"+month
    }
    getMonthType(year+month,'rightMonthCompare');

    getWeekInAndOut(date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate());
    getWeekType(date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate())
</script>
