<div class="row">
    <div class="col-md-12">
        <form id="borrowAddForm">
            <div class="modal-body">
                <div class="form-group">
                    <label id="dateLabel">借入借出日期</label>
                    <input type="text" class="form-control pull-right" id="borrowLendTime" onclick="showDate()" name="borrowLendTime"
                           placeholder="选择日期...">
                </div>
                <div class="form-group">
                    <label id="money_totalLabel">金额</label>
                    <input type="text" class="form-control" name="money" id="money_total" placeholder="输入金额...">
                </div>
                <div class="form-group">
                    <label id="noteLabel">备注</label>
                    <input type="text" class="form-control" name="note" id="note" placeholder="输入备注...">
                </div>
                <div class="form-group">
                    <label id="statusLabel">状态</label>
                    <select name="status" class="form-control select2" style="width: 100%;">
                        <option value="1">已还</option>
                        <option value="0" selected>待还</option>
                    </select>
                </div>
                <div class="form-group">
                    <label id="borrowUserLabel">借款人</label>
                    <input type="text" class="form-control" name="borrowUser" id="borrowUser" placeholder="输入借款人">
                </div>
                <div class="form-group">
                    <label id="lendUserLabel">借出人</label>
                    <input type="text" class="form-control" name="lendUser" id="lendUser" placeholder="输入借出人">
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i
                                class="fa fa-close"></i>取消
                    </button>
                    <button type="button" class="btn btn-primary btn-sm" onclick="borrowAdd();"><i
                                class="fa fa-save"></i>保存
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">

    function showDate(){
        //初始化时间选择器
        $('#borrowLendTime').datepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayHighlight: true
        });
    }
    showDate();

    function borrowAdd() {
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
        if (status == 0) {
            return false;
        } else {
            $.ajax({
                url: '/plan/borrow/save',
                type: 'post',
                dataType: 'text',
                data: $("#borrowAddForm").serialize(),
                success: function (data) {
                    var json = JSON.parse(data);
                    if (json.status) {
                        $("#lgModal").modal('hide');
                        alertMsg("添加成功", "success");
                        borrowReload(list_ajax, "#roleTime", "#rolePremise");
                    } else {
                        alertMsg("添加失败:" + json.msg, "success");
                    }
                }
            })
        }
    }
</script>