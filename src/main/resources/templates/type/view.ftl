<div class="row">
	<div class="box-body  no-padding">
		<table class="table table-striped">
			<tr>
				<td>类型：</td>
				<td style="width: 90%">${bean.type!}</td>
			</tr>
			<tr>
				<td>备注说明：</td>
				<td>${bean.note!}</td>
			</tr>
			<tr>
				<td>收入or支出:</td>
				<td>
					<#if bean.inOrOut == 0>收入</#if>
				</td>
			</tr>
			<tr>
				<td>更新时间：</td>
				<td>${bean.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
			</tr>

		</table>
		<div class="box-footer">
			<div class="pull-right">
				<button type="button" class="btn btn-default btn-sm" id="close" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
			</div>
      	</div>
	</div>
</div>