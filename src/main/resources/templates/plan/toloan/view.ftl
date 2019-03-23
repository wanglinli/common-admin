<div class="row">
	<div class="box-body  no-padding">
		<table class="table table-striped">
			<tr>
				<td>开始时间：</td>
				<td>
					<span style="width: 100px">${bean.startTime?string('yyyy-MM-dd HH:mm:ss')} </span>
					<span style="margin-left: 50px">记录时间: ${bean.createTime?string('yyyy-MM-dd HH:mm:ss')}</span>
					<span style="margin-left: 50px">借贷项目: ${bean.toLoan!}</span>
					<span style="margin-left: 50px">用户: ${bean.user!}</span>
				</td>
			</tr>
			<tr>
				<td>借贷利息：</td>
				<td>
					<span style="width: 100px">${bean.interest!}元 </span>
				</td>
			</tr>
			<tr>
				<td>借贷年限：</td>
				<td>
					<span style="width: 100px">${bean.life!}</span>
				</td>
			</tr>
			<tr>
				<td>已还金额：</td>
				<td>
					<span style="width: 100px">${bean.alreadyRepaid!}元 </span>
				</td>
			</tr>
			<tr>
				<td>剩余待还：</td>
				<td>
					<span style="width: 100px">${bean.surplus!} 元</span>
				</td>
			</tr>

			<#list historyResult as record>
				<tr>
					<td>还款记录：</td>
					<td>
						时间：${record.createTime?string('yyyy-MM-dd HH:mm:ss')}
						金额：${record.returnMoney!}
					</td>
				</tr>
			</#list>


		</table>
		<div class="box-footer">
			<div class="pull-right">
				<button type="button" class="btn btn-default btn-sm" id="close" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
			</div>
      	</div>
	</div>
</div>