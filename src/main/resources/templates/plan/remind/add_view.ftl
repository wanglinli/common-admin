<div class="row">
	<div class="col-md-12">
		<form id="remindAddForm">
				<div class="modal-body">
					<div class="form-group">
						<label id="timeLabel">时间</label>
						<div class="input-group date ">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" class="form-control pull-right" name="time" id="securityTime" placeholder="选择时间...">
						</div>
					</div>
					<div class="form-group">
						<label id="contentLabel">内容</label>
						<input type="text" class="form-control" name="content" id="remindContent" placeholder="输入内容...">
					</div>
					<div class="form-group">
						<label id="statusLabel">状态</label>
						<select name="status" class="form-control select2" style="width: 100%;">
							<option value="1">待做</option>
							<option value="0">完成</option>
						</select>
					</div>
					<div class="form-group" style="display:none;">
						<label id="userLabel">用户</label>
						<input type="text" class="form-control" name="user" id="user" value="${user.username}">
					</div>
				</div>
				<div class="modal-footer">
					<div class="pull-right">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-close"></i>取消</button>
						<button type="button" class="btn btn-primary btn-sm" onclick="remindeAdd();"><i class="fa fa-save"></i>保存</button>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	//初始化时间选择器
	$('#securityTime').datepicker({
		language: 'zh-CN',
		format: 'yyyymmdd',
		autoclose: true,
		todayHighlight: true
	});

	function remindeAdd(){
	$("span").remove(".errorClass");
	$("br").remove(".errorClass");
	var status = 1;
	if($("#securityTime").val()==""){
		$("#timeLabel").prepend('<span class="errorClass" style="color:red">*时间不能为空</span><br class="errorClass"/>');
		status = 0;
	}
	if($("#remindContent").val()==""){
		$("#contentLabel").prepend('<span class="errorClass" style="color:red">*内容不能为空</span><br class="errorClass"/>');
		status = 0;
	}
	if(status == 0){
		return false;
	}else{
		$.ajax({
			url: '/plan/remind/save',
	        type: 'post',
	        dataType: 'text',
	        data: $("#remindAddForm").serialize(),
	        success: function (data) {
				var json = JSON.parse(data);
				if (json.status){
                    $("#lgModal").modal('hide');
                    alertMsg("添加成功","success");
                    reloadTable(list_ajax,"#roleTime","#rolePremise");
				}else{
                    alertMsg("添加失败:"+json.msg,"success");
				}
	        }
		})
	}
}
</script>