<div class="row">
	<div class="col-md-12">
		<form id="typeAddForm">
				<div class="modal-body">
					<div class="form-group">
						<label id="typeLabel">类型</label>
						<input type="text" class="form-control" name="type" id="type" placeholder="输入类型...">
					</div>
					<div class="form-group">
						<label id="noteLabel">备注说明</label>
						<input type="text" class="form-control" name="note" id="note" placeholder="输入备注说明...">
					</div>
					<div class="form-group">
						<label id="noteLabel">收入Or支出</label>
						<select name="inOrOut" class="form-control select2" style="width: 100%;">
							<option value="0">收入</option>
							<option value="1">支出</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<div class="pull-right">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-close"></i>取消</button>
						<button type="button" class="btn btn-primary btn-sm" onclick="typeAdd();"><i class="fa fa-save"></i>保存</button>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
function typeAdd(){
	$("span").remove(".errorClass");
	$("br").remove(".errorClass");
	var status = 1;
	if($("#type").val()==""){
		$("#typeLabel").prepend('<span class="errorClass" style="color:red">*类型不能为空</span><br class="errorClass"/>');
		status = 0;
	}
	if($("#note").val()==""){
		$("#noteLabel").prepend('<span class="errorClass" style="color:red">*备注不能为空</span><br class="errorClass"/>');
		status = 0;
	}
	if(status == 0){
		return false;
	}else{
		$.ajax({
			url: '/type/save',
	        type: 'post',
	        dataType: 'text',
	        data: $("#typeAddForm").serialize(),
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