<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">支出项目</h3>
				<div class="box-tools pull-right">
					<@shiro.hasPermission name="type/add">
						<a onclick="typeToListAjax();" class="btn btn-sm btn-primary" target="modal" modal="lg" href="/type/add">添加</a>
					</@shiro.hasPermission>
				</div>
			</div>
			<div class="box-body">
				<table id="type_out_tab" class="table table-bordered table-striped">
					<thead>
						<tr>
							<tr>
								<th>序号</th>
								<th>类型</th>
								<th>备注</th>
								<th>创建时间</th>
								<th>操作</th>
							</tr>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var type_tab;
$(function() {

	//初始化表格
	var No=0;
	type_tab = $('#type_out_tab').DataTable({
		"dom":'itflp',
		"processing":true,
		"searching":false,
		"serverSide":true, //启用服务器端分页
		"bInfo":false,
		"language":{"url":"adminlte/plugins/datatables/language.json"},
		"ajax":{"url":"/type/page","type":"post","data":{"inOrOut":1}},
		"columns":[ 
		    {"data":null}, 
			{"data":"type"},
			{"data":"note"},
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
					var btn = '<a class="btn btn-xs btn-primary" target="modal" modal="lg" href="/type/view/'+ data.id+ '">查看</a> &nbsp;';
						if(data.roleValue != 'super'){
							btn = btn+'<@shiro.hasPermission name="type/edit">'
							+'<a class="btn btn-xs btn-info" onclick="typeToListAjax();" data-title="修改" target="modal" modal="lg" href="/type/edit/'+ data.id+'">修改</a> &nbsp;'
							+'</@shiro.hasPermission>'
							+'<@shiro.hasPermission name="type/delete">'
							+'<a class="btn btn-xs btn-default" callback="typeReload();" data-body="确认要删除吗？" target="ajaxTodo" href="/type/delete/'+ data.id + '">删除</a>  &nbsp;'
							+'</@shiro.hasPermission>'
						}
				return btn;
			}
		} ]
	}).on('preXhr.dt', function ( e, settings, data ) {
		No=0;
    } );
});

function typeReload(){
	reloadTable(type_tab,"#roleTime","#rolePremise");
}

function typeToListAjax(){
	list_ajax = type_tab;
}
</script>