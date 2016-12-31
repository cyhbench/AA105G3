<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.recipe.model.*"%>
<%@ page import="com.recipe_cont.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<% session.setAttribute("mem_no", "M00000005"); %>


<jsp:useBean id="recipe_cont_set" scope="request" type="java.util.Set" />
<jsp:useBean id="recipeSvc" scope="page" class="com.recipe.model.RecipeService" />
<jsp:useBean id="recipe_contSvc" scope="page" class="com.recipe_cont.model.Recipe_contService" />
<jsp:useBean id="recipeVO" scope="request" class="com.recipe.model.RecipeVO"/>
<jsp:useBean id="ingredients" scope="request" class="java.util.ArrayList"/>
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="quantity" scope="request" class="java.util.ArrayList"/>



<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>${recipeVO.recipe_name}</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			body{
				background: #efede8;
				padding-top:50px;
			}
			.recipe-search{
		
				text-align: center;
			}
		
			.recipe-search-select{
				height: 50px;
			}
			.recipe-search-text{
				height: 50px;
				width:375px !important;
			}
			
			.recipe-search-btn{
				height: 50px;
				color:#D9230F;
				width: 50px;
			}
			.write-recipe{
				height: 50px;
				font-weight: bold;
			}
			.recipe-header-right{
				padding-left: 25px;
			}
			
			
			
			.display-recipe-wrapper{
				border:1px solid #e2e0db;
				margin:20px 0px;
				background: #fff;

			}
			.display-recipe-title{
				padding:0px;
			}
			.recipe-top-title-wrapper{
				padding:0px;
				border-bottom: 1px solid #e2e0db;
			}
			.display-recipe-title>div{
				font-size: 30px;
				font-weight: bold;
				padding:10px 0px;
				 
			}
			.display-recipe-update{
				padding:10px 0px 0px 0px;
				text-align: right;
			}
			.display-recipe-update>.btn{
				border:1px solid ;
				font-size:20px;
			}
			.display-recipe-update a{
				color:#000;
			}
			.display-recipe-update a:hover{
				text-decoration: none;
			}
			.glyphicon-cog{
				font-size:19px;
			}
			.dispaly-recipe-upload-date{
				font-size: 16px;
				color: #9b9491;
				padding:5px 0px;
				
			}
			.recipe-left-wrapper{
				padding: 0px;
				margin: 0px 0px 10px 0px;
				/*width: 460px;*/
			}
			.display-recipe-right{
				
			}
			#display-recipe-image{
				width: 480px;
				height: 350px;
			}
			.views-wrapper{
				margin: 0px;
				padding: 5px;
			}
			.display-recipe-views{
				font-size: 16px;
				padding:20px 0px 0px 0px;
				margin: 0px;
			}
			.reciep-collect{
				padding: 8px 20px;
				background: #77716e;
				border-radius: 20px;
				color:#fff;
				font-size: 15px;
				margin-top: 10px;

			}
			.glyphicon-heart-empty{
				font-size: 16px;
			}
			.reciep-collect span{
				margin-left:5px;
			}
			.recipe-collect-left{
				width: 180px;
			}
			.recipe-collect-right{
				width:300px;
				text-align: right;
			}
			.reciep-collect:hover{
				color: #fff;
				background: #9b9693;
			}
			.display-recipe-intro{
				width: 480px;
				margin: 15px 0px;
				font-size: 16px;
				word-break:break-all;
			}
			.recipe-right-wrapper{
				padding: 0px;
				
			}
			.display-foodMater-tittle{
				font-size: 18px;
				padding-bottom: 5px; 
				border-bottom: 1px solid ;
			}
			.display-foodMater{
				padding: 10px 0px;
				border-bottom: 1px solid #e2e0db;
			}
			.ingredients,.quantity{
				padding: 0px;
			}
			.display-recipeCont-wrapper{
				border-top: 1px solid;
				padding:15px 0px;
				margin-bottom: 10px; 
			}
			
			.display-step-image-wrapper,.display-step-cont{
				padding: 15px 0px;
				border-bottom: 1px solid;
				vertical-align: top;
			}
			#cont-table{
				width:100%;
			}
			.display-step-cont{
				width:100%;
			}
			.display-step-image{
				width: 220px;
				height: 170px;
			}
			td.display-step-image-wrapper{
				width:15%;	
			}
			.display-step{
				margin: 0px 0px 10px 0px;
			}
			.display-step-cont p{
				font-size: 18px;
				
			}
			.recipe-type-wraaper{
				padding:15px 0px;
			}
			.display-type-title{
				font-size: 18px;
				border-bottom: 1px solid;
				padding: 0px 0px 15px 0px;
			}
			.type-cont{
				padding-top: 15px;
			}
			.type-cont a{
				text-decoration: underline;
				color:#000;
			}
			.recipe-author{
				border:1px solid #e2e0db;
				margin:20px 0px;
				padding:10px 10px;
				background:#fff;
			}
			.author-image{
				width: 70px;	
				height: 70px;	
			}
			.author-info{
				padding:0px 5px; 
			}
			.author-info h4{
				margin:0px 0px 5px 0px;
				font-size: 20px;
				color: #000;
				word-break:break-all;
			}
			.display-recipe-newest{
				border:1px solid #e2e0db;
				padding:5px;
				background:#fff; 
			}
			.more-newest-title-wrapper{
				border-bottom: 1px solid red;
			}
			.display-more-newest-title{
				padding:10px 0px;
				margin:0px;
			}
			.dispaly-more-newest{
				margin-top: 10px;
				padding:0px;
			}
			.display-newest-recipe-content{
				border-top: 1px solid #e2e0db;
				padding:10px 0px;
				word-break:break-all;
			}
			.recipe-newest-image{
				width: 80px;
				height: 65px;
			}
			.display-recipe-newest-box{
				padding:0px 10px;
			}
		</style>
	</head>
	<body>
		
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-8 ">
					<div class="recipe-search">
						<form class="form-inline text-center" action="<%=request.getContextPath()%>/recipe/recipe.do" method="POST">
						    <select class="form-control recipe-search-select" name="searchCondition">
						        <option value="recipe_name">找食譜名</option>
						        <option value="food_mater">找食材</option>
						    </select>
						   <div class="input-group recipe-search-form">
						    <input type="text" class="form-control recipe-search-text" placeholder="Search Recipe" name="searchInput">
						        <span class="input-group-btn">
						            <button class="btn btn-default recipe-search-btn" type="submit" name="action" value="search"><i class="glyphicon glyphicon-search"></i></button>
						        </span>
						    </div>
						</form>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 recipe-header-right">
					<a href="<%=request.getContextPath()%>/front-end/recipe/addRecipe.jsp">
						<button class="btn btn-default write-recipe">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						寫食譜</button></a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12">
				<div class="row">
					<div class="col-xs-12 col-sm-8 display-recipe-wrapper">
						<div class="recipe-top-title-wrapper col-xs-12 col-sm-12">
						<div class="col-xs-12 col-sm-6 display-recipe-title">
							<div>${recipeVO.recipe_name}</div>
						</div>
						<div class="col-xs-12 col-sm-6 display-recipe-update">
							<c:if test="${recipeVO.mem_no == mem_no}">
							<div class=" btn btn-default">
								<a href="<%=request.getContextPath()%>/recipe/recipe.do?action=getOne_For_Update&recipe_no=${recipeVO.recipe_no}">
								<i class="glyphicon glyphicon-cog"></i><span>修改</span>
								</a>
							</div>
							</c:if>
						</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 dispaly-recipe-upload-date">
							<fmt:formatDate value="${recipeVO.recipe_time}" var="formattedDate" 
               				 type="date" pattern="yyyy-MM-dd" />
							${formattedDate} 發表
						</div>
						<div class="col-xs-12 col-sm-8 recipe-left-wrapper">
							<div class="display-recipe-left">
								<div class="display-recipe-image">
								<img id="display-recipe-image" src="<%=request.getContextPath()%>/recipe/showRecipe_pic.do?recipe_no=${recipeVO.recipe_no}">
								</div>
					
								<table >
									<tr >
										<td class="recipe-collect-left">
										<div class="display-recipe-views">
										<i class="glyphicon glyphicon-eye-open">${recipeVO.recipe_total_views}</i>
										<i class="glyphicon glyphicon-heart">${recipeVO.recipe_like}</i>
									</div>
										</td>
										<td class="recipe-collect-right">
										<c:if test="${recipeVO.mem_no != mem_no}">
											<div class="reciep-collect btn">
											<i class="glyphicon glyphicon-heart-empty"></i><span>收藏</span>
											</div>
										</c:if>
										</td>
									</tr>
								</table>
								<p class="display-recipe-intro">
									${recipeVO.recipe_intro}
								</p>
							</div>
						</div>
						<div class="col-xs-12 col-sm-4 recipe-right-wrapper">
							<div class="display-foodMater-tittle">
								食材
							</div>
							<c:forEach var="ingredient" items="${ingredients}" varStatus="s">
							<div class="display-foodMater">
								<div class="col-xs-12 col-sm-6 ingredients">${ingredient}</div>
								<div class="col-xs-12 col-sm-6 quantity text-right">${quantity[s.index]}</div>
								<div style="clear:both;"></div>
							</div>
							</c:forEach>
						</div>
						<div class="col-xs-12 col-sm-12 display-recipeCont-wrapper">
							<table id="cont-table">
							<c:forEach var="recipe_contVO" items="${recipe_cont_set}">
								<tr>
								<c:if test="${recipe_contVO.step_pic != null}">
									<td class="display-step-image-wrapper">
										<img class="display-step-image" src="<%=request.getContextPath()%>/recipe_cont/showRecipe_cont_pic.do?recipe_no=${param.recipe_no}&step=${recipe_contVO.step}">
									</td>
								</c:if>
									<td class="display-step-cont" colspan="2">
										<h2 class="display-step">${recipe_contVO.step}</h2>
										<p>${recipe_contVO.step_cont}</p>
									</td>
								</tr>
							</c:forEach>	
							</table>
						</div>
						<div class="col-xs-12 col-sm-12 recipe-type-wraaper">
							<div class="display-type-title">
									更多食譜相關份類
							</div>
							<div class="type-cont">
								<i class="glyphicon glyphicon-triangle-right"></i><a href="#">全部分類</a>
								<i class="glyphicon glyphicon-chevron-right"></i><a href="#">點心烘焙</a>
								<i class="glyphicon glyphicon-chevron-right"></i><a href="#">手工餅乾</a>
							</div>
						</div>
						

					</div>



					<div class="col-xs-12 col-sm-3 other-info">
						<div class="col-xs-12 col-sm-12">
							<div class="recipe-author">
							<table>
								<tr>
									<td class="author-image-wrapper">
										<a href="#"><img id="author-image" src="/<%=request.getContextPath()%>/MemberDBGifReader.do?name=${recipeVO.mem_no}"></a>
									</td>
									<td class="author-info">
										<a href="#"><h4>${memberSvc.getOneMember(recipeVO.mem_no).mem_name}</h4></a>
										<a href="#"><p>${recipeSvc.findByMem_no(recipeVO.mem_no).size()} 食譜</p></a>
									</td>
								</tr>
							</table>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12">
							<div class="display-recipe-newest">
								<div class="more-newest-title-wrapper">
									<div class="col-xs-12 col-sm-6" style="padding:0px;">
										<h4 class="display-more-newest-title">最新食譜</h4>			
									</div>
									<div class="col-xs-12 col-sm-6 text-right dispaly-more-newest">
										<a href="<%=request.getContextPath()%>/front-end/recipe/RecipeNewest.jsp" class="">更多</a>
									</div>
									<div style="clear:both;"></div>
								</div>
								<div class="display-newest-recipe-content">
									<table>
									<c:forEach var="recipeVO" items="${recipeSvc.all}" begin="0" end="4">
									<tr>
										<td class="recipe-newest-image-wrapper">
											<a href="<%=request.getContextPath()%>/recipe/recipe.do?action=getOne_For_Display&recipe_no=${recipeVO.recipe_no}">
											<img class="recipe-newest-image" src="<%=request.getContextPath()%>/recipe/showRecipe_pic.do?recipe_no=${recipeVO.recipe_no}" title="${recipeVO.recipe_name }">
											</a>
										</td>
										<td class="display-recipe-newest-box">
											<a href="<%=request.getContextPath()%>/recipe/recipe.do?action=getOne_For_Display&recipe_no=${recipeVO.recipe_no}">
											<h4>${recipeVO.recipe_name }</h4></a>
											<p>by <a href="#">${memberSvc.getOneMember(recipeVO.mem_no).mem_name}</a></p>
										</td>
									</tr>
									</c:forEach>
									</table>
								</div>
							</div>
						</div>
				</div>	
				</div>
				
				
					
			</div>
				
				
				
			</div>

		</div>
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>
