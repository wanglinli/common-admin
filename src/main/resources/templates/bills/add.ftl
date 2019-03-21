<div class="row">
	<div class="col-md-12">
		<form id="securityAddForm">
			<div class="modal-body">
                <div class="form-group">
                    <label id="billTimeLabel">交易时间</label>
                    <input type="text" class="form-control" name="billTime" id="billTime"  placeholder="输入交易时间,格式为: yyyy-MM-dd HH:mm:ss" >
                </div>

                <div class="form-group">
                    <label id="billMoneyLabel">交易金额</label>
                    <input type="text" class="form-control" name="billMoney" id="billMoney" placeholder="输入交易金额...">
                </div>
                <div class="form-group">
                    <label id="billTypeLabel">交易方式</label>
                    <input type="text" class="form-control" name="billType" id="billType" placeholder="输入交易方式...">
                </div>
                <div class="form-group">
                    <input hidden="hidden" value="${inOrOut}" id="billFlag" name="billFlag">
                </div>
                <div class="form-group">
                    <label for="billNote" id="billNote">交易说明</label>
                    <select type="text" class="form-control" name="billNote" id="billNote">
                        <#list type as obj>
                            <option>
								${obj.type}
                            </option>
						</#list>
                    </select>
                </div>
			</div>
			<div class="modal-footer">
				<div class="pull-right">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
					<button type="button" class="btn btn-primary btn-sm" onclick="securitySave();"><i class="fa fa-save"></i>保存</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">



function securitySave(){
	$("span").remove(".errorClass");
	$("br").remove(".errorClass");
	var status = 1;

    if ($("#billTime").val()==""){
        $("#billTimeLabel").prepend('<span class="errorClass" style="color:red">*交易时间不能为空</span><br class="errorClass"/>');
        status=0;
    }

    if ($("#billMoney").val()==""){
        $("#billMoneyLabel").prepend('<span class="errorClass" style="color:red">*交易金额不能为空</span><br class="errorClass"/>');
        status=0;
    }

    if ($("#billType").val()==""){
        $("#billTypeLabel").prepend('<span class="errorClass" style="color:red">*交易方式不能为空</span><br class="errorClass"/>');
        status=0;
    }

	if($("#username").val()==""){
		$("#userNoLabel").prepend('<span class="errorClass" style="color:red">*账号不能为空</span><br class="errorClass"/>');
		status = 0;
	}
	if($("#password").val()==""){
		$("#passwordLabel").prepend('<span class="errorClass" style="color:red">*密码不能为空</span><br class="errorClass"/>');
		status = 0;
	}
	if(status == 0){
		return false;
	}else{
		$.ajax({
			url: '/bills/save',
	        type: 'post',
	        dataType: 'text',
	        data: $("#securityAddForm").serialize(),
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
		});
	}
}
</script>