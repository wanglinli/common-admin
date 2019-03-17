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
                    <a class="btn btn-sm btn-primary" href="/user/exportExcel">导出</a>
                </div>
            </div>
            <div class="box-body">
			<#--<div class="clearfix">-->
			<#--<div class="col-md-3">-->
			<#--<div class="input-group date ">-->
			<#--<div class="input-group-addon">-->
			<#--<i class="fa fa-calendar"></i>-->
			<#--</div>-->
			<#--<input type="text" class="form-control pull-right" id="securityTime" placeholder="选择时间...">-->
			<#--</div>-->
			<#--</div>-->
			<#--<div class="col-md-3">-->
			<#--<div class="input-group">-->
			<#--<span class="input-group-addon"><i class="fa fa-search"></i></span>-->
			<#--<input type="text" class="form-control" id="securityPremise" placeholder="根据账号搜索...">-->
			<#--</div>-->
			<#--</div>-->
			<#--<div class="col-md-3">-->
			<#--<div class="input-group">-->
			<#--<span class="input-group-addon"><i class="fa fa-search"></i></span>-->
			<#--<input type="text" class="form-control" id="roleId" placeholder="根据角色搜索...">-->
			<#--</div>-->
			<#--</div>-->
			<#--<div class="col-md-3">-->
			<#--<button type="submit" onclick="securityReload();" class="btn btn-primary">搜索</button>-->
			<#--</div>-->
			<#--</div>-->

                <table id="bills_intcome_tab" class="table table-bordered table-striped" >
                    <thead>
                    <tr>
                    <tr>
                        <th>序号</th>
                        <th>收入时间</th>
                        <th>创建时间</th>
                        <th>金额</th>
                        <th>交易方式</th>
                        <th>交易说明</th>
                    </tr>
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
        bills_intcome_tab = $('#bills_intcome_tab').DataTable({
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
            ],
            "columnDefs": [
                {
                    targets: 0,
                    data: null,
                    render: function (data) {
                        No = No + 1;
                        return No;
                    }
                }]
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