<div class="row">
	<div class="col-md-12">
		<form id="borrowEditForm">
			<div class="box-body">
				<div class="form-group">
					<label id="dateLabel">借入借出日期</label>
					<input type="text" class="form-control pull-right" id="borrowLendTime" value="${borrow.borrowLendTime?string('yyyy-MM-dd HH:mm:ss')}" name="borrowLendTime">
				</div>
				<div class="form-group">
					<label id="money_totalLabel">金额</label>
					<input type="text" class="form-control" name="money" id="money_total" value="${borrow.money}">
				</div>
				<div class="form-group">
					<label id="noteLabel">备注</label>
					<input type="text" class="form-control" name="note" id="note"value="${borrow.note}">
				</div>
				<div class="form-group">
					<label id="noteValueLabel">还款状态</label>
					<select name="status" class="form-control select2" style="width: 100%;">
						<option <#if borrow.status==0> selected="selected"</#if> value="0">待还</option>
						<option <#if borrow.status==1> selected="selected"</#if>  value="1">已还</option>
					</select>
				</div>
				<div class="form-group">
					<label id="borrowUserLabel">借款人</label>
					<input type="text" class="form-control" name="borrowUser" id="borrowUser" value="${borrow.borrowUser}">
				</div>
				<div class="form-group">
					<label id="lendUserLabel">借出人</label>
					<input type="text" class="form-control" name="lendUser" id="lendUser"value="${borrow.lendUser}">
				</div>

				<div class="form-group" style="display: none">
					<label id="borrowIDLabel">ID</label>
					<input type="text" class="form-control" name="id" id="id" value="${borrow.id}">
				</div>

			</div>
			<div class="box-footer">
				<div class="pull-right">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
					<button onclick="borrowUpdate();" type="button" class="btn btn-primary btn-sm"><i class="fa fa-paste"></i>更新</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	function borrowUpdate(){
		$("span").remove(".errorClass");
		$("br").remove(".errorClass");
		var status = 1;
		if ($("#borrowLendTime").val() == "") {
			$("#dateLabel").prepend('<span class="errorClass" style="color:red">*日期不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if ($("#money_total").val() == "") {
			$("#money_totalLabel").prepend('<span class="errorClass" style="color:red">*金额不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if (!checkMoney($("#money_total").val())) {
			$("#money_totalLabel").prepend('<span class="errorClass" style="color:red">*金额格式错误!</span><br class="errorClass"/>');
			status = 0;
		}
		if ($("#note").val() == "") {
			$("#noteLabel").prepend('<span class="errorClass" style="color:red">*不能为空</span><br class="errorClass"/>');
			status = 0;
		}


		if ($("#borrowUser").val() == "") {
			$("#borrowUserLabel").prepend('<span class="errorClass" style="color:red">*不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if ($("#lendUser").val() == "") {
			$("#lendUserLabel").prepend('<span class="errorClass" style="color:red">*不能为空</span><br class="errorClass"/>');
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
			url: '/plan/borrow/update',
			type: 'post',
			dataType: 'text',
			data: $("#borrowEditForm").serialize(),
			success: function (data) {
				var json = JSON.parse(data);
				if (json.status){
					$("#lgModal").modal('hide');
					alertMsg("更新成功","success");
					borrowReload(list_ajax,"#roleTime","#rolePremise");
				}else{
					alertMsg("更新失败:"+json.msg,"success");
				}
			}
		};
		$.ajax(options);
	}
</script>