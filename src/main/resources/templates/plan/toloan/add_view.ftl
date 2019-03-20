<div class="row">
	<div class="col-md-12">
		<form id="toLoanAddForm">
				<div class="modal-body">
					<div class="form-group">
						<div class="col-sm-6">
							<label id="dateLabel">借贷日期</label>
							<div class="input-group date ">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right" id="securityDate" placeholder="选择日期...">
							</div>
						</div>
						<label id="timeLabel">时间</label>
						<div class="input-group time ">
							<div class="input-group-addon">
								<i class="fa fa-clock-o"></i>
							</div>
							<input type="text" class="form-control pull-right" id="securityTime" placeholder="选择时间...">
						</div>
					</div>
					<div class="form-group" style="display: none">
						<label id="contentLabel">date</label>
						<input type="text" class="form-control" name="startTime" id="time" value="">
					</div>

					<div class="form-group">
						<label id="toLoanLabel">借贷项目</label>
						<input type="text" class="form-control" name="toLoan" id="toLoan" placeholder="输入借贷项目...">
					</div>


					<div class="form-group">
						<label id="moneyLabel">金额(元)</label>
						<input type="text" class="form-control" name="money" id="money" placeholder="eg:10000">
					</div>
					<div class="form-group">
						<label id="interestLabel">利息(元)</label>
						<input type="text" class="form-control" name="interest" id="interest" placeholder="eg:2000...">
					</div>
					<div class="form-group">
						<label id="lifeLabel">年限(年)</label>
						<input type="text" class="form-control" name="life" id="life" placeholder="eg:1...">
					</div>
					<div class="form-group" style="display:none;">
						<label id=""></label>
						<input type="text" class="form-control" name="alreadyRepaid" value="0">
						<input type="text" class="form-control" name="surplus" value="0">
					</div>

				</div>
				<div class="modal-footer">
					<div class="pull-right">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-close"></i>取消</button>
						<button type="button" class="btn btn-primary btn-sm" onclick="toLoanAdd();"><i class="fa fa-save"></i>保存</button>
					</div>
				</div>

			</div>
		</form>
	</div>
</div>
<script>

</script>
<script type="text/javascript">
	//初始化时间选择器
	$('#securityDate').datepicker({
		language: 'zh-CN',
		format: 'yyyy-mm-dd',
		autoclose: true,
		todayHighlight: true
	});
	var myDate = new Date();
	var mytime = myDate.toLocaleTimeString('chinese', {hour12: false});
	$('#securityTime').val(mytime);

	function toLoanAdd() {
		$("span").remove(".errorClass");
		$("br").remove(".errorClass");
		var status = 1;
		if ($("#securityDate").val() == "") {
			$("#dateLabel").prepend('<span class="errorClass" style="color:red">*日期不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if ($("#securityTime").val() == "") {
			$("#timeLabel").prepend('<span class="errorClass" style="color:red">*时间不能为空</span><br class="errorClass"/>');
			status = 0;

		}
		if ($("#toLoan").val() == "") {
			$("#toLoanLabel").prepend('<span class="errorClass" style="color:red">*内容不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if ($("#money").val() == "") {
			$("#moneyLabel").prepend('<span class="errorClass" style="color:red">*借贷金额不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if ($("#interest").val() == "") {
			$("#interestLabel").prepend('<span class="errorClass" style="color:red">*利息不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if ($("#life").val() == "") {
			$("#lifeLabel").prepend('<span class="errorClass" style="color:red">*年限不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		$('#time').val($('#securityDate').val() + " " + $('#securityTime').val());
		if (status == 0) {
			return false;
		} else {
			$.ajax({
				url: '/plan/toloan/save',
				type: 'post',
				dataType: 'text',
				data: $("#toLoanAddForm").serialize(),
				success: function (data) {
					var json = JSON.parse(data);
					if (json.status) {
						$("#lgModal").modal('hide');
						alertMsg("添加成功", "success");
						reloadTable(list_ajax, "#roleTime", "#rolePremise");
					} else {
						alertMsg("添加失败:" + json.msg, "success");
					}
				}
			})
		}
	}
</script>