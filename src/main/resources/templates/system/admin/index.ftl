<!DOCTYPE html>
<html>
<head>
  <#include "../macro/base.ftl"/>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台</title>
  <@style/>
  <style>
		table {
			cellspacing: 0;
			*border-collapse: collapse; /* IE7 and lower */
			border-spacing: 0;
			width: 100%;
		}

		.bordered tr:hover {
			background: #fbf8e9;
			-o-transition: all 0.1s ease-in-out;
			-webkit-transition: all 0.1s ease-in-out;
			-moz-transition: all 0.1s ease-in-out;
			-ms-transition: all 0.1s ease-in-out;
			transition: all 0.1s ease-in-out;
		}

		.bordered th {
			padding: 7px;
			text-align: center;
			cellspacing: 0;
		}

		.bordered td {
			padding: 7px;
			text-align: center;
			cellspacing: 0;
		}


		.bordered th {

			background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
			background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
			background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
			background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
			background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
			background-image: linear-gradient(top, #ebf3fc, #dce9f9);
		}

		.bordered td:first-child, .bordered th:first-child {
			border-left: none;
		}


		.bordered tr:nth-of-type(2n) {
			background: #FFFFFF;
			cursor: pointer;
		}

		.bordered tr:nth-of-type(2n+1) {
			background: #F7FAFC;
			cursor: pointer;
		}

		.bordered tbody tr:hover {
			background: #fbf8e9;
			-o-transition: all 0.1s ease-in-out;
			-webkit-transition: all 0.1s ease-in-out;
			-moz-transition: all 0.1s ease-in-out;
			-ms-transition: all 0.1s ease-in-out;
			transition: all 0.1s ease-in-out;
		}
	</style>
</head>
<body class="sidebar-mini ajax-template skin-blue fixed">
	<div class="wrapper">
		<@header/>
		<@menu/>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header-navtabs">
			<div class="tabs-page">
				<ul class="tabs-list clearfix" id="navTabs">
					<li class="active"><span>我的主页</span></li>
				</ul>
				<a href="javascript:void(0);" class="prev fa fa-step-backward"></a>
				<a href="javascript:void(0);" class="next fa fa-step-forward"></a> 
			</div>
			<!--邮件按钮-->
			<div class="context-menu" id="contextMenu">
				<ul class="ct-nav">
					<li rel="reload">刷新标签页</li>
					<li rel="closeCurrent">关闭标签页</li>
					<li rel="closeOther">关闭其他标签页</li>
					<li rel="closeAll">关闭全部标签页</li>
				</ul>
			</div>
		</section>
		<!-- Main content -->
		<section class="content" id="content">
			<div class="tabs-panel">
				<h3>欢迎使用财务管理系统</h3>
				<h4 style="text-align: center">今年支出与收入数据统计与对比</h4>

				<div class="row">

				</div>

				<div class="row" style="margin-top: 10px">
					<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
					<div class="col-md-6">
						<div id="leftIndexMonth" style="width: 500px;height:400px;"></div>
					</div>
					<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
					<div class="col-md-6">
						<div id="rightIndexMonthCompare" style="width: 500px;height:400px;"></div>
					</div>
				</div>

			</div>
		</section>
		</div>
		<@footer/>
		<@setting/>
	</div>
	<@jsFile/>
	<script type="text/javascript">
		$('#year').datepicker({
			language: 'zh-CN',
			format: 'yyyy-mm-dd',
			autoclose: true,
			todayHighlight: true
		});
		var date = new Date();
		var year = date.getFullYear();

		getMonthInAndOut(year,'leftIndexMonth');
		getMonthType(year,'rightIndexMonthCompare');
	</script>
</body>
</html>
