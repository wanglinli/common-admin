<div class="row">
	<div class="col-md-12">
		<form id="typeEditForm">
			<div class="box-body">
				<div class="form-group" style="display: none">
					<label id="remindIDLabel">ID</label>
					<input type="text" class="form-control" name="id" id="id" value="${remind.id}" placeholder="ID...">
				</div>
				<div class="form-group">
					<label id="timeLabel">时间</label>
					<input type="text" class="form-control" name="time" id="time" value="${remind.time?string('yyyy-MM-dd HH:mm:ss')}" placeholder="时间...">
				</div>
				<div class="form-group">
					<label id="contentLabel">提醒内容</label>
					<input type="text" class="form-control" name="content" id="remindContent" value="${remind.content}" placeholder="提醒内容...">
				</div>
				<div class="form-group" style="display:none;">
					<label id="contentLabel">user</label>
					<input type="text" class="form-control" name="user" id="user" value="${remind.user}" placeholder="用户...">
				</div>
				<div class="form-group">
					<label id="noteValueLabel">当前状态</label>
					<select name="status" class="form-control select2" style="width: 100%;">
						<option <#if remind.status==0> selected="selected"</#if> value="0">完成</option>
						<option <#if remind.status==1> selected="selected"</#if>  value="1">待做</option>
					</select>
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
		if($("#time").val()===''){
			$("#timeLabel").prepend('<span class="errorClass" style="color:red">*时间不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if($("#remindContent").val()===''){
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
			url: '/plan/remind/update',
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