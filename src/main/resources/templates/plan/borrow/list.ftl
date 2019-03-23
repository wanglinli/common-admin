<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">借入借出管理</h3>
				<div class="box-tools pull-right">
					<@shiro.hasPermission name="plan/borrow/add">
						<a onclick="borrowToListAjax();" class="btn btn-sm btn-primary" target="modal" modal="lg" href="plan/borrow/add">添加</a>
					</@shiro.hasPermission>
				</div>
			</div>
			<div class="box-body">
				<table id="borrow_tab" class="table table-bordered table-striped">
					<thead>
							<tr>
								<th>序号</th>
								<th>借入或借出时间</th>
								<th>金额</th>
								<th>备注</th>
								<th>借款人</th>
								<th>借出人</th>
								<th>状态</th>
								<th>记录时间</th>
								<th>操作</th>
							</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var borrow_tab;
$(function() {

	//初始化表格
	var No=0;
	borrow_tab = $('#borrow_tab').DataTable({
		"dom":'itflp',
		"processing":true,
		"searching":false,
		"serverSide":true, //启用服务器端分页
		"bInfo":false,
		"language":{"url":"adminlte/plugins/datatables/language.json"},
		"ajax":{"url":"/plan/borrow/page","type":"post"},
		"columns":[ 
		    {"data":null}, 
			{"data":"borrowLendTime"},
			{"data":"money"},
			{"data":"note"},
			{"data":"borrowUser"},
			{"data":"lendUser"},
			{"data":null},
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
			    targets: 6,
			    data: null,
			    render: function (data) {
			    	if(data.status === 0){
			    		return "未还";
			    	}
			    	if(data.status === 1){
			    		return "已还";
			    	}
			    	return "未知状态";
			    }
			},
            {
				"targets" : -1,
				"data" : null,
				"render" : function(data) {
					var btn = '<a class="btn btn-xs btn-primary" target="modal" modal="lg" href="plan/borrow/view/'+ data.id+ '">查看</a> &nbsp;';
					btn = btn+'<@shiro.hasPermission name="plan/borrow/edit">'
							+'<a class="btn btn-xs btn-info" onclick="borrowToListAjax();" target="modal" modal="lg" href="plan/borrow/edit/'+ data.id+'">修改</a> &nbsp;'
							+'</@shiro.hasPermission>'
							+'<@shiro.hasPermission name="plan/borrow/delete">'
							+'<a class="btn btn-xs btn-default" callback="borrowReload();" data-body="确认要删除吗？" target="ajaxTodo" href="plan/borrow/delete/'+ data.id + '">删除</a>  &nbsp;'
							+'</@shiro.hasPermission>'
				return btn;
			}
		} ]
	}).on('preXhr.dt', function ( e, settings, data ) {
		No=0;
    } );
});

function borrowReload(){
	reloadTable(borrow_tab,"#roleTime","#rolePremise");
}

function borrowToListAjax(){
	list_ajax = borrow_tab;
}
</script>