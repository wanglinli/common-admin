<div class="row">
	<div class="box-body  no-padding">
		<table class="table table-striped">
			<tr>
				<td>开始时间：</td>
				<td style="width: 90%">${bean.startTime?string('yyyy-MM-dd HH:mm:ss')}</td>
			</tr>
			<tr>
				<td>借贷项目：</td>
				<td>${bean.toLoan!}</td>
			</tr>
			<tr>
				<td>借贷利息:</td>
				<td>
					${bean.interest!} 元
				</td>
			</tr>
			<tr>
				<td>借贷年限：</td>
				<td>${bean.life!}</td>
			</tr>
			<tr>
				<td>已还金额：</td>
				<td>${bean.alreadyRepaid!} 元</td>
			</tr>
			<tr>
				<td>剩余待还金额：</td>
				<td>${bean.surplus!} 元</td>
			</tr>
			<tr>
				<td>用户：</td>
				<td>${bean.user}</td>
			</tr>
			<tr>
				<td>记录时间：</td>
				<td style="width: 90%">${bean.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
			</tr>

		</table>
		<div class="box-footer">
			<div class="pull-right">
				<button type="button" class="btn btn-default btn-sm" id="close" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
			</div>
      	</div>
	</div>
</div>