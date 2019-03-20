<div class="row">
	<div class="col-md-12">
		<form id="typeEditForm">
			<div class="box-body">
				<div class="form-group" style="display: none">
					<label id="remindIDLabel">ID</label>
					<input type="text" class="form-control" name="id" id="id" value="${toLoan.id}" placeholder="ID...">
				</div>
				<div class="form-group">
					<label id="timeLabel">借贷时间</label>
					<input type="text" class="form-control" name="startTime" id="startTime" value="${toLoan.startTime?string('yyyy-MM-dd HH:mm:ss')}" placeholder="时间...">
				</div>
				<div class="form-group">
					<label id="contentLabel">借贷项目</label>
					<input type="text" class="form-control" name="toLoan" id="toLoan" value="${toLoan.toLoan}">
				</div>
				<div class="form-group">
					<label id="contentLabel">金额(元)</label>
					<input type="text" class="form-control" name="money" id="money" value="${toLoan.money}">
				</div>
				<div class="form-group">
					<label id="contentLabel">利息(元)</label>
					<input type="text" class="form-control" name="interest" id="interest" value="${toLoan.interest}">
				</div>
				<div class="form-group">
					<label id="contentLabel">年限(年)</label>
					<input type="text" class="form-control" name="life" id="life" value="${toLoan.life}">
				</div>
				<div class="form-group">
					<label id="contentLabel">已还(元)</label>
					<input type="text" class="form-control" name="alreadyRepaid" id="alreadyRepaid" value="${toLoan.alreadyRepaid}">
				</div>
				<div class="form-group" style="display:none;">
					<label id="contentLabel">user</label>
					<input type="text" class="form-control" name="user" id="user" value="${toLoan.user}" placeholder="用户...">
				</div>

			</div>
			<div class="box-footer">
				<div class="pull-right">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
					<button onclick="remindUpdate();" type="button" class="btn btn-primary btn-sm"><i class="fa fa-paste"></i>更新</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	function remindUpdate(){
		$("span").remove(".errorClass");
		$("br").remove(".errorClass");
		var status = 1;
		if($("#startTime").val()===''){
			$("#timeLabel").prepend('<span class="errorClass" style="color:red">*时间不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if($("#toLoan").val()===''){
			$("#contentLabel").prepend('<span class="errorClass" style="color:red">*内容不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if(status == 0){
			return false;
		}else{
			ajaxPost();
		}
	}

	function ajaxPost() {
		var options = {
			url: '/plan/toloan/update',
			type: 'post',
			dataType: 'text',
			data: $("#typeEditForm").serialize(),
			success: function (data) {
				var json = JSON.parse(data);
				if (json.status){
					$("#lgModal").modal('hide');
					alertMsg("更新成功","success");
					reloadTable(list_ajax,"#roleTime","#rolePremise");
				}else{
					alertMsg("更新失败:"+json.msg,"success");
				}
			}
		};
		$.ajax(options);
	}
</script>