<div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">收入列表</h3>

                <div class="box-tools pull-left">
                <@shiro.hasPermission name="user/add">
                    <a onclick="securityToListAjax();" class="btn btn-sm btn-primary" target="modal" modal="lg"
                       href="/user/add">添加</a>
				</@shiro.hasPermission>
                <@shiro.hasPermission name="bills/exportExcel">
                    <a class="btn btn-sm btn-primary" href="/bills/exportExcel">导出</a>
                </@shiro.hasPermission>
                </div>
            </div>
            <div class="box-body">

                <table id="bills_income_tab" class="table table-bordered table-striped" >
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>收入时间</th>
                            <th>创建时间</th>
                            <th>金额</th>
                            <th>交易方式</th>
                            <th>交易说明</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var bills_intcome_tab;
    $(function () {
        //初始化时间选择器
        $('#securityTime').datepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayHighlight: true
        });
        //初始化表格

        var No = 0;
        bills_intcome_tab = $('#bills_income_tab').DataTable({
            "dom": 'itflp',
            "processing": true,
            "searching": false,
            "serverSide": true, //启用服务器端分页
            "bInfo": false,
            "language": {"url": "adminlte/plugins/datatables/language.json"},
            "ajax": {
                "url": "/bills/page",
                "type": "post",
                "data": function(d) {
                    //自定义查询参数
                    d.roleId = $("#roleId").val();
                }
            },
            "columns": [
                {"data": null},
                {"data": "incomeTime"},
                {"data": "createTime"},
                {"data": "incomeMoney"},
                {"data": "incomeType"},
                {"data": "incomeNote"},
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
                },
                {
                    "targets": -1,
                    "data": null,
                    "render": function (data) {
                        var btn = '<a class="btn btn-xs btn-primary" target="modal" modal="lg" href="/type/view/' + data.id + '">查看</a> &nbsp;';
                        if (data.roleValue != 'super') {
                            btn = btn + '<@shiro.hasPermission name="type/edit">'
                                + '<a class="btn btn-xs btn-info" onclick="typeToListAjax();" data-title="修改" target="modal" modal="lg" href="/type/edit/' + data.id + '">修改</a> &nbsp;'
                                + '</@shiro.hasPermission>'
                                + '<@shiro.hasPermission name="type/delete">'
                                + '<a class="btn btn-xs btn-default" callback="typeReload();" data-body="确认要删除吗？" target="ajaxTodo" href="/type/delete/' + data.id + '">删除</a>  &nbsp;'
                                + '</@shiro.hasPermission>'
                        }
                        return btn;
                    }
                }
            ]
        }).on('preXhr.dt', function (e, settings, data) {
            No = 0;
        });

        $("#securitySeek").on("click", function () {
            securityReload();
        });
    });

    function securityReload() {
        reloadTable(bills_intcome_tab);
    }

    function securityToListAjax() {
        list_ajax = bills_intcome_tab;
        console.log(list_ajax);
    }
    function isNull(data) {
        return (data == "" || data == undefined || data == null) ? true : false;
    }
</script>