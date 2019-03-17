<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">提醒管理</h3>
				<div class="box-tools pull-right">
					<@shiro.hasPermission name="plan/remind/add">
						<a onclick="remindToListAjax();" class="btn btn-sm btn-primary" target="modal" modal="lg" href="plan/remind/add">添加</a>
					</@shiro.hasPermission>
				</div>
			</div>
			<div class="box-body">
				<table id="remind_tab" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>序号</th>
							<th>时间</th>
							<th>内容</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var remind_tab;
$(function() {

	//初始化表格
	var No=0;
	remind_tab = $('#remind_tab').DataTable({
		"dom":'itflp',
		"processing":true,
		"searching":false,
		"serverSide":true, //启用服务器端分页
		"bInfo":false,
		"language":{"url":"adminlte/plugins/datatables/language.json"},
		"ajax":{"url":"/plan/remind/page","type":"post"},
		"columns":[ 
		    {"data":null}, 
			{"data":"time"},
			{"data":"content"},
			{"data":"status"},
			{"data":null}],
		"columnDefs" : [
			{
			    targets: 0,
			    data: null,
			    render: function (data) {
			    	No=No+1;
			        return No;
			    }
			},
			{
			    targets: 3,
			    data: null,
			    render: function (data) {
			    	if(data === 0 || data === '0'){
			    		return "完成";
			    	}
			    	if(data === 1 || data === '1'){
			    		return "待做";
			    	}
			    	return "未知状态";
			    }
			},
            {
				"targets" : -1,
				"data" : null,
				"render" : function(data) {
					var btn = '<a class="btn btn-xs btn-primary" target="modal" modal="lg" href="plan/remind/view/'+ data.id+ '">查看</a> &nbsp;';
						if(data.roleValue != 'super'){
							btn = btn+'<@shiro.hasPermission name="plan/remind/edit">'
							+'<a class="btn btn-xs btn-info" onclick="remindToListAjax();" target="modal" modal="lg" href="plan/remind/edit/'+ data.id+'">修改</a> &nbsp;'
							+'</@shiro.hasPermission>'
							+'<@shiro.hasPermission name="plan/remind/delete">'
							+'<a class="btn btn-xs btn-default" callback="roleReload();" data-body="确认要删除吗？" target="ajaxTodo" href="plan/remind/delete/'+ data.id + '">删除</a>  &nbsp;'
							+'</@shiro.hasPermission>'
						}
				return btn;
			}
		} ]
	}).on('preXhr.dt', function ( e, settings, data ) {
		No=0;
    } );
});

function roleReload(){
	reloadTable(remind_tab,"#roleTime","#rolePremise");
}

function remindToListAjax(){
	list_ajax = remind_tab;
}
</script>