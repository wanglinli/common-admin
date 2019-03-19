<div class="row">
    <div class="col-md-12">
        <form id="securityEditForm">
            <input type="hidden" id="id" name="id" value="${bean.id}">
            <div class="box-body">
                <div class="form-group">
                    <label id="billTime">收款时间</label>
                    <input type="text" class="form-control" name="billTime" id="billTime" value="${bean.billTime?datetime}"
                            placeholder="输入收款时间...">
                </div>

                <div class="form-group">
                    <label id="billMoney">收入金额</label>
                    <input type="text" class="form-control" name="billMoney" id="billMoney" value="${bean.billMoney!}"
                           placeholder="输入金额...">
                </div>
                <div class="form-group">
                    <label id="billType">收款方式</label>
                    <input type="text" class="form-control" name="billType" id="billType" value="${bean.billType!}"
                           placeholder="输入收款方式...">
                </div>
                <div class="form-group">
                    <label for="billNote" id="billNote">交易说明</label>
                    <select type="text" class="form-control" name="billNote" id="billNote">
                        <#list type as obj>
                            <#assign flag="">
                            <#if obj.inOrOut == 0>
                                <option <#if bean.billNote == obj.type> selected </#if>>
                                    <#--只展示收入类型-->
                                    <#assign flag="yes">
                                    ${obj.type}
                                </option>
                            </#if>
                            <#if obj.inOrOut == 1>
                                <#if flag="yes">
                                    <option <#if bean.billNote == obj.type> selected </#if>>
                                        <#--只展示支出类型-->
                                        ${obj.type}
                                    </option>
                                </#if>
                            </#if>
                        </#list>
                    </select>
                </div>
            </div>
            <div class="box-footer">
                <div class="pull-right">
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><i
                            class="fa fa-close"></i>关闭
                    </button>
                    <button onclick="securityUpdateUser();" type="button" class="btn btn-primary btn-sm"><i
                            class="fa fa-paste"></i>更新
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">


    function securityUpdateUser() {
//        debugger;
        $.ajax({
            url: '/bills/update',
            type: 'post',
            dataType: 'text',
            data: $("#securityEditForm").serialize(),
            success: function (data) {
                var json = JSON.parse(data);
                if (json.status) {
                    $("#lgModal").modal('hide');
                    alertMsg("更新成功", "success");
                    reloadTable(list_ajax);
                } else {
                    alertMsg("更新失败:" + json.msg, "success");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        });
    }

</script>