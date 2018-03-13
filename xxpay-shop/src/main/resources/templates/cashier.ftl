<#assign base=request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<title>我的订单</title>
<style>
#error{height: 80px; line-height: 80px; text-align: center; color: #f00; font-size: 30px; font-weight: bold;}
        #error{font-size: 20px;}
</style>
<link rel="stylesheet" href="${base}/css/style-base.css">
<link rel="stylesheet" href="${base}/css/style-common.css">
<link rel="stylesheet" href="${base}/css/style-home.css">
<link rel="stylesheet" href="${base}/css/merchant.css">
<link rel="stylesheet" href="${base}/css/common.css">
</head>
<body>
	<header>
		<div class="headerContainer">
			<div class="headerContainer_left left">
				<span class="backIcon" onclick="history.back(-1)"></span>
			</div>
			<div class="headerContainer_center">
				<span>收银台</span>
			</div>
			<div class="headerContainer_right right"></div>
		</div>
	</header>


	<#if (client== 'wx')>
	<div class="container" id="pay">
		<div class="merchant-content">
			<div class="order-status clearfix">
				<span class="order-no left">请选择支付方式</span> <span
					class="status right">支付金额：￥0.01</span>
			</div>
			<div class="merchant-content-top clearfix" id="wxpay">
				<div class="content content-logo">
					<img src="${base}/images/weipay.png">
				</div>
				<div class="content content-des">
					<div class="content-detail">
						<span class="des-title">微信支付</span>
					</div>
					<div class="content-detail">
						<div class="order-detail">
							<span class="order-title">微信安全支付 </span>
						</div>

					</div>

				</div>
				<div class="content content-arrow">
					<a href="order_confirm.html"><span class="arrowRight "></span></a>
				</div>
			</div>
			<div class="protocol right">
				<!-- 		<span class="icon"> <img src="${base}/images/unchecked.png"></span> -->
				<span class="checkedIcon uncheckedIcon"></span> <span
					class="icon-des">我已阅读并同意《支付协议》</span>
			</div>
		</div>
	</div>
	<#else>
	<div class="container" id="pay">
		<div class="merchant-content">
			<div class="order-status clearfix">
				<span class="order-no left">请选择支付方式</span> <span
					class="status right">支付金额：￥0.01</span>
			</div>
			<div class="merchant-content-top clearfix" id="alicasher">
				<div class="content content-logo">
					<img src="${base}/images/pay.png" id="alipay">
				</div>
				<div class="content content-des">
					<div class="content-detail">
						<span class="des-title">支付宝支付</span>
					</div>
					<div class="content-detail">
						<div class="order-detail">
							<span class="order-title">支付宝安全支付 </span>
						</div>
					</div>
				</div>
				<div class="content content-arrow">
					<a href="order_confirm.html"><span class="arrowRight "></span></a>
				</div>
			</div>
			<div class="merchant-content-top clearfix" id="wxpay">
				<div class="content content-logo">
					<img src="${base}/images/weipay.png">
				</div>
				<div class="content content-des">
					<div class="content-detail">
						<span class="des-title">微信支付</span>
					</div>
					<div class="content-detail">
						<div class="order-detail">
							<span class="order-title">微信安全支付 </span>
						</div>

					</div>

				</div>
				<div class="content content-arrow">
					<a href="order_confirm.html"><span class="arrowRight "></span></a>
				</div>
			</div>

			<div class="protocol right">
				<!-- 		<span class="icon"> <img src="${base}/images/unchecked.png"></span> -->
				<span class="checkedIcon uncheckedIcon"></span> <span
					class="icon-des">我已阅读并同意《支付协议》</span>
			</div>
		</div>
	</div>
	</#if>
 
</form>
	<script type="text/javascript" src="${base}/js/lib/zepto.min.js"></script>
	<script type="text/javascript" src="${base}/js/merchant.js"></script>
	<script type="text/javascript" src="${base}/js/jquery-3.3.1.min.js"></script>
	
	<script>
		$("#alicasher").click(function(){
			 
		 	$.ajax({ type: "post",
            url: "toAliPay.html",
            data: {"amount":1,"channelId":"ALIPAY_WAP"},
            success:function(data){
            	
            	$("#alipay").html(data);//跳转支付宝付款
            }
				 
		});
		});
		$("#wxpay").click(function(){
			 
		 	$.ajax({ type: "post",
            url: "toWxPay.html",
            data: {"amount":1,"channelId":"WX_JSAPI","goodId":"GOOD_0001","goodsName":"测试商品","userId":"test_001"},//微信公众号
            success:function(data){
            	 
            	
            }
				 
		});
		});

	</script>
</body>
</html>