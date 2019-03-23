<div class="row">
	<div class="col-md-12">
		<form id="typeEditForm">
			<div class="box-body">
				<div class="form-group" style="display: none">
					<label id="typeIDLabel">ID</label>
					<input type="text" class="form-control" name="id" id="id" value=${type.id} placeholder="ID...">
				</div>
				<div class="form-group">
					<label id="typeNameLabel">类型</label>
					<input type="text" class="form-control" name="type" id="type" value=${type.type} placeholder="类型...">
				</div>
				<div class="form-group">
					<label id="noteValueLabel">备注说明</label>
					<input type="text" class="form-control" name="note" id="note" value=${type.note} placeholder="备注...">
				</div>
				<div class="form-group">
					<label id="noteValueLabel">支出or收入</label>
					<select name="inOrOut" class="form-control select2" style="width: 100%;">
						<option <#if type.inOrOut==0> selected="selected"</#if> value="0">收入</option>
						<option <#if type.inOrOut==1> selected="selected"</#if>  value="1">支出</option>
					</select>
				</div>
			</div>
			<div class="box-footer">
				<div class="pull-right">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
					<button onclick="typeUpdate();" type="button" class="btn btn-primary btn-sm"><i class="fa fa-paste"></i>更新</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	function typeUpdate(){
		$("span").remove(".errorClass");
		$("br").remove(".errorClass");
		var status = 1;
		if($("#type").val()==""){
			$("#typeNameLabel").prepend('<span class="errorClass" style="color:red">*类型不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if($("#note").val()==""){
			$("#noteValueLabel").prepend('<span class="errorClass" style="color:red">*备注不能为空</span><br class="errorClass"/>');
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
			url: '/type/update',
			type: 'post',
			dataType: 'text',
			data: $("#typeEditForm").serialize(),
			success: function (data) {
				var json = JSON.parse(data);
				if (json.status){
					$("#lgModal").modal('hide');
					alertMsg("更新成功","success");
					typeReload(list_ajax,"#roleTime","#rolePremise");
				}else{
					alertMsg("更新失败:"+json.msg,"success");
				}
			}
		};
		$.ajax(options);
	}
</script>