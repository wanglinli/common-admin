<div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">历史列表</h3>
                <div class="row" style="margin-top: 10px">
                    <div class="col-md-4">
                        <label for="datepickerStart2">开始日期:</label>
                        <input type="text" id="datepickerStart2">
                    </div>
                    <div class="col-md-4">
                        <label for="datepickerEnd2">结束日期:</label>
                        <input type="text" id="datepickerEnd2">
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-sm btn-primary"  onclick="queryByDate()">查询</button>
                        <@shiro.hasPermission name="bills/exportExcel">
                        <button class="btn btn-sm btn-primary" onclick="exportByDate()">导出</button>
                        </@shiro.hasPermission>
                    </div>
                </div>
            </div>
            <div class="box-body">
                <table id="bills_history_tab" class="table table-bordered table-striped" >
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>交易时间</th>
                        <th>创建时间</th>
                        <th>金额</th>
                        <th>交易方式</th>
                        <th>交易说明</th>
                        <th>支出or收入</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var bills_history_tab;
    $(function () {
        $("input[id^='datepicker']").datepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayHighlight: true
        });

        //初始化表格
        bills_history_tab = getData();
    })

    function getData() {
        var No = 0;
        $('#bills_history_tab').DataTable({
            destroy:true,
            "dom": 'itflp',
            "processing": true,
            "searching": false,
            "serverSide": true, //启用服务器端分页
            "bInfo": false,
            "language": {"url": "adminlte/plugins/datatables/language.json"},
            "ajax": {
                "url": "/bills/page",
                "type": "post",
                "data": {
                    "billFlag": 2,
                    "startDate": $('#datepickerStart2').val(),
                    "endDate": $('#datepickerEnd2').val()
                }
            },
            "columns": [
                {"data": null},
                {"data": "billTime"},
                {"data": "createTime"},
                {"data": "billMoney"},
                {"data": "billType"},
                {"data": "billNote"},
                {"data": null},
                {"data": null}
            ],
            "columnDefs": [
                {
                    targets: 0,
                    data: null,
                    render: function (data) {
                        No = No + 1;
                        return No;
                    }
                }, {
                    targets: -2,
                    data: null,
                    render: function (data) {
                        if (data.billFlag == 0) {
                            return "支出记录";
                        } else if (data.billFlag == 1) {
                            return "收入记录";
                        } else {
                            return "未知";
                        }
                    }
                }, {
                    "targets": -1,
                    "data": null,
                    "render": function (data) {
                        var btn = "";
                        btn = '<a class="btn btn-xs btn-primary" target="modal" modal="lg" href="/bills/view/' + data.id + '">查看</a> &nbsp;';
                        return btn;
                    }
                }]
        }).on('preXhr.dt', function (e, settings, data) {
            No = 0;
        })  ;
    }


    function queryByDate() {
        var r = new RegExp("^[1-2]\\d{3}-(0?[1-9]||1[0-2])-(0?[1-9]||[1-2][1-9]||3[0-1])$");
        if(("" === $('#datepickerStart2').val() && "" === $('#datepickerEnd2').val()) ||(r.test($('#datepickerStart2').val()) && r.test($('#datepickerEnd2').val()))) {
            bills_history_tab = getData();
        }else alertMsg("开始日期或结束日期格式错误，请输入yyyy-mm-dd格式的日期,！","error");
    }
    
    function exportByDate() {

        var r = new RegExp("^[1-2]\\d{3}-(0?[1-9]||1[0-2])-(0?[1-9]||[1-2][1-9]||3[0-1])$");
            if(("" === $('#datepickerStart2').val() && "" === $('#datepickerEnd2').val()) ||(r.test($('#datepickerStart2').val()) && r.test($('#datepickerEnd2').val()))){

                alertMsg("正在下载...请稍等!","success");
                var exportDate = 2 + "_" + $('#datepickerStart2').val() + "_" + $('#datepickerEnd2').val();
                window.location.href = "/bills/exportExcel/" + exportDate;
            }else alertMsg("开始日期或结束日期格式错误，请输入yyyy-mm-dd格式的日期,！","error");
    }

</script>