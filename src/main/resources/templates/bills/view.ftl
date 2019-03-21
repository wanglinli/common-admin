<div class="row">
	<div class="box-body  no-padding">
		<table class="table table-striped">
            <tr>
                <td>id：</td>
                <td style="width: 90%">${bean.id}</td>
            </tr>
			<tr>
				<td>收款时间：</td>
				<td>${bean.billTime?datetime}</td>
			</tr>
			<tr>
				<td>收入金额：</td>
				<td>${bean.billMoney}</td>
			</tr>
			<tr>
				<td>收款方式:</td>
				<td>${bean.billType!}</td>
			</tr>
			<tr>
				<td>交易说明：</td>
				<td>${bean.billNote!}</td>
			</tr>
            <tr>
                <td>创建时间：</td>
                <td>${bean.createTime?datetime}</td>
            </tr>

		</table>
		<div class="box-footer">
			<div class="pull-right">
				<button type="button" class="btn btn-default btn-sm" id="close" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
			</div>
      	</div>
	</div>
</div>