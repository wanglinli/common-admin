<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">借贷管理</h3>
				<div class="box-tools pull-right">
					<@shiro.hasPermission name="plan/toloan/add">
						<a onclick="roleToListAjax();" class="btn btn-sm btn-primary" target="modal" modal="lg" href="plan/toloan/add">添加</a>
					</@shiro.hasPermission>
				</div>
			</div>
			<div class="box-body">
				<table id="toloan_tab" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>序号</th>
							<th width="85px">借贷项目</th>
							<th>金额</th>
							<th>利息</th>
							<th>年限</th>
							<th>已还</th>
							<th>剩余</th>
							<th>借贷人</th>
							<th>借贷时间</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var role_tab;
$(function() {

	//初始化表格
	var No=0;
	role_tab = $('#toloan_tab').DataTable({
		"dom":'itflp',
		"processing":true,
		"searching":false,
		"serverSide":true, //启用服务器端分页
		"bInfo":false,
		"language":{"url":"adminlte/plugins/datatables/language.json"},
		"ajax":{"url":"/plan/toloan/page","type":"post"},
		"columns":[ 
		    {"data":null}, 
			{"data":"toLoan"},
			{"data":"money"},
			{"data":"interest"},
			{"data":"life"},
			{"data":"alreadyRepaid"},
			{"data":"surplus"},
			{"data":"user"},
			{"data":"startTime"},
			{"data":"createTime"},
			{"data":null}
			],
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
				"targets" : -1,
				"data" : null,
				"render" : function(data) {
					var btn = '<a class="btn btn-xs btn-primary" target="modal" modal="lg" href="plan/toloan/view/'+ data.id+ '">查看</a> &nbsp;';
					btn = btn+'<@shiro.hasPermission name="plan/toloan/edit">'
							+'<a class="btn btn-xs btn-info" onclick="roleToListAjax();" target="modal" modal="lg" href="plan/toloan/edit/'+ data.id+'">修改</a> &nbsp;'
							+'</@shiro.hasPermission>'
							+'<@shiro.hasPermission name="plan/toloan/delete">'
							+'<a class="btn btn-xs btn-default" callback="roleReload();" data-body="确认要删除吗？" target="ajaxTodo" href="plan/toloan/delete/'+ data.id + '">删除</a>  &nbsp;'
							+'</@shiro.hasPermission>'
				return btn;
			}
		} ]
	}).on('preXhr.dt', function ( e, settings, data ) {
	console.log(data,settings)
		No=0;
    } );
});

function roleReload(){
	reloadTable(role_tab,"#roleTime","#rolePremise");
}

function roleToListAjax(){
	list_ajax = role_tab;
}
</script>