<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Title Page</title>
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			#menu_zone{
				background: #f5deb3;
			}
			#accordion2{
				margin-top: 15px;
			}
			#accordion2 div{
				background: #fee4cd;
			}
			#menu_zone a{
				color:#000;
			}
			#menu_zone a:hover,#menu_zone a:link{
				color:#000;
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<div class="col-xs-12 col-sm-2" id="menu_zone">
			<div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
				  	<!-- 區塊1 -->
				  	<div class="panel panel-default">
				    	<div class="panel-heading" role="tab" id="panel1">	
				    	<a href="#aaa" data-parent="#accordion2" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="aaa">				      
				    		<h4 class="panel-title">
					      		<i class=" glyphicon glyphicon-user"></i>
					          	會員管理
					    	</h4>
					    	</a>
						</div>
					    <div id="aaa" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel1">
					      	<div class="list-group">
					      		<a href="#" class="list-group-item">私廚資格審核</a>
					      		<a href="#" class="list-group-item">私廚資料管理</a>
					      	</div>
					    </div>
					</div>
					<!-- 區塊2 -->
					<div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="panel2">
					    <a href="#bbb" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="bbb">
					      	<h4 class="panel-title">
					      		<i class=" glyphicon glyphicon-pawn"></i>
					          	員工管理
					      	</h4>
					      	</a>
					    </div>
					    <div id="bbb" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel2">
					      	<div class="list-group">
					      		<a href="#" class="list-group-item">員工資料管理</a>  
					      	</div>
					    </div>
					</div>
					
					<div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="panel4">
					    <a href="#ddd" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="ddd">
					      	<h4 class="panel-title">
					      		<i class=" glyphicon glyphicon-book"></i>
					          	食譜管理
					      	</h4>
					      	</a>
					    </div>
					    <div id="ddd" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel4">
					      	<div class="list-group">
					        	<a href="#" class="list-group-item">食譜類別管理</a>
					      		<a href="#" class="list-group-item">未分類食譜管理</a>
					      	</div>
					    </div>
					</div>
					<!-- 區塊5 -->
					<div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="panel5">
					    <a href="#eee" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="eee">
					      	<h4 class="panel-title">
					      		<i class=" glyphicon glyphicon-paste"></i>
					          	廣告管理
					      	</h4>
					      	</a>
					    </div>
					    <div id="eee" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel5">
					      	<div class="list-group">
					        	<a href="#" class="list-group-item">廣告資料管理</a>
					      	</div>
					   </div>
					</div>
					<!-- 區塊6 -->
					<div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="panel6">
					    <a href="#fff" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="fff">
					      	<h4 class="panel-title">
								<i class=" glyphicon glyphicon-equalizer"></i>
					          	市集管理
					      	</h4>
					      	</a>
					    </div>
					    <div id="fff" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel6">
					      	<div class="list-group">
					        	<a href="#" class="list-group-item">商品上下架</a>
					      	</div>
					    </div>
					</div>
					<!-- 區塊7 -->
					<div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="panel7">
					    <a href="#ggg" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="ggg">
					      	<h4 class="panel-title">
					      		<i class=" glyphicon glyphicon-list-alt"></i>
					          	商品訂單管理
					      	</h4>
					      	</a>
					    </div>
					    <div id="ggg" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel7">
					      	<div class="list-group">
					        	<a href="#" class="list-group-item">商品訂單查詢</a>				      
					      	</div>
					    </div>
					</div>
                    <!-- 區塊8 -->
					<div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="panel8">
					    <a href="#hhh" data-parent="#accordion2" data-toggle="collapse" role="button" class="collapsed" aria-expanded="false" aria-controls="hhh">
					      	<h4 class="panel-title">
					      		<i class=" glyphicon glyphicon-cutlery"></i>
					          	私廚平台管理
					      	</h4>
					      	</a>
					    </div>
					    <div id="hhh" class="panel-collapse collapse" role="tabpanel" aria-labelledby="panel8">
					      	<div class="list-group">
					        	<a href="#" class="list-group-item">私廚訂單查詢</a>
					      	</div>
					    </div>
					</div>
				</div>
		</div>
		
	</body>
</html>