<div class="row">
	<div class="box-body  no-padding">
		<table class="table table-striped">
			<tr>
				<td>时间：</td>
				<td style="width: 90%">${bean.time?string('yyyy-MM-dd HH:mm:ss')}</td>
			</tr>
			<tr>
				<td>提醒内容：</td>
				<td>${bean.content!}</td>
			</tr>
			<tr>
				<td>当前状态:</td>
				<td>
					<#if bean.status == 0>完成</#if>
					<#if bean.status == 1>待做</#if>
				</td>
			</tr>
			<tr>
				<td>用户：</td>
				<td>${bean.user}</td>
			</tr>

		</table>
		<div class="box-footer">
			<div class="pull-right">
				<button type="button" class="btn btn-default btn-sm" id="close" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
			</div>
      	</div>
	</div>
</div>