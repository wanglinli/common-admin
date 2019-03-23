<div class="row">
	<div class="box-body  no-padding">
		<table class="table table-striped">
			<tr>
				<td>借入借出时间：</td>
				<td style="width: 90%">${bean.borrowLendTime?string('yyyy-MM-dd HH:mm:ss')}</td>
			</tr>
			<tr>
				<td>借贷备注：</td>
				<td>${bean.note!}</td>
			</tr>
			<tr>
				<td>状态:</td>
				<td>
					<#if bean.status == 0>未还</#if>
					<#if bean.status == 1>已还</#if>
				</td>
			</tr>
			<tr>
				<td>借出人：</td>
				<td>${bean.lendUser}</td>
			</tr>
			<tr>
				<td>借款人：</td>
				<td>${bean.borrowUser}</td>
			</tr>

		</table>
		<div class="box-footer">
			<div class="pull-right">
				<button type="button" class="btn btn-default btn-sm" id="close" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
			</div>
      	</div>
	</div>
</div>