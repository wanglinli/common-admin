<div class="row">
	<div class="col-md-12">
		<form id="typeEditForm">
			<div class="box-body">
				<#--<div class="form-group" style="display: none">-->
					<#--<label id="remindIDLabel">ID</label>-->
					<#--<input type="text" class="form-control" name="id" id="id" value="${toLoan.id}" placeholder="ID...">-->
				<#--</div>-->
				<div class="form-group" style="display: none">
					<label id="remindIDLabel">借贷项目ID</label>
					<input type="text" class="form-control" name="toLoan" id="toLoan" value="${toLoan.id}" placeholder="ID...">
				</div>
				<div class="form-group">
					<label id="contentLabel">借贷项目</label>
					<input type="text" class="form-control" readonly="readonly" value="${toLoan.toLoan}">
				</div>
				<div class="form-group">
					<label id="monenyLabel">还款金额(元)</label>
					<input type="text" class="form-control" name="returnMoney" id="returnMoney" placeholder="请输入还款金额...">
				</div>
				<div class="form-group">
					<label id="dateLabel">还款日期</label>
					<div class="input-group date ">
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<input type="text" class="form-control pull-right" name="returnTime" id="returnTime" placeholder="选择日期...">
					</div>
				</div>


			</div>
			<div class="box-footer">
				<div class="pull-right">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
					<button onclick="remindUpdate();" type="button" class="btn btn-primary btn-sm"><i class="fa fa-paste"></i>添加还款记录</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">

	//初始化时间选择器
	$('#returnTime').datepicker({
		language: 'zh-CN',
		format: 'yyyy-mm-dd',
		autoclose: true,
		todayHighlight: true
	});


	function remindUpdate(){
		$("span").remove(".errorClass");
		$("br").remove(".errorClass");
		var status = 1;
		if($("#returnTime").val()===''){
			$("#dateLabel").prepend('<span class="errorClass" style="color:red">*日期不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if($("#returnMoney").val()===''){
			$("#monenyLabel").prepend('<span class="errorClass" style="color:red">*金额不能为空</span><br class="errorClass"/>');
			status = 0;
		}
		if(!checkMoney($("#returnMoney").val())){
			$("#monenyLabel").prepend('<span class="errorClass" style="color:red">*金额格式错误!</span><br class="errorClass"/>');
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
			url: '/plan/toloan/repayment/save',
			type: 'post',
			dataType: 'text',
			data: $("#typeEditForm").serialize(),
			success: function (data) {
				var json = JSON.parse(data);
				if (json.status){
					$("#lgModal").modal('hide');
					alertMsg("添加成功","success");
					reloadTable(list_ajax,"#roleTime","#rolePremise");
				}else{
					alertMsg("添加成功:"+json.msg,"success");
				}
			}
		};
		$.ajax(options);
	}
</script>