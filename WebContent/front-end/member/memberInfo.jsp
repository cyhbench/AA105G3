
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.frd_list.model.*"%>

<% 		

	
%>

<jsp:useBean id="chefSvc" scope="page" class="com.chef.model.ChefService" />
<jsp:useBean id="frd_listSvc" scope="page" class="com.frd_list.model.Frd_listService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="recipeSvc" scope="page" class="com.recipe.model.RecipeService" />
<jsp:useBean id="collectionSvc" scope="page" class="com.collection.model.CollectionService" />
<jsp:useBean id="memberVO" scope="request" class="com.member.model.MemberVO" />



<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>個人首頁</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel ="stylesheet" href="css/frontpageCSS.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.2.9/sweetalert2.min.css">
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

		<style type="text/css" media="screen">
			.header-style{
				padding-top: 40px;
				margin-bottom:50px;
			}
			.search-style{
				padding-bottom: 50px;
			}
			.member-style{
				padding-top: 20px;
				padding-bottom: 20px;
				background: white;
			}
			.count-style{
				padding-top: 10px;
				padding-bottom: 15px;
			}
			.content-style{
				background: white;
				margin-top: 25px;
			}
			#href-style{
				color: red;
				border-bottom: 3px red solid;
			}
			
			html,body{
				background: #efede8;
				/* padding-top: 50px; */
				height : 100%;
				/* position : relative; */
				
				
			}
			.page{
				min-height:100%;
				   position: relative;
				   padding-top:50px;
				   padding-bottom:50px;
			}
			
			.recipe-search-wrapper{
				margin-bottom:20px;
			}
			.recipe-search{

				text-align: right;
			}

			.recipe-select{
				height: 50px;
			}
			.recipe-text{
				height: 50px;
				width:375px !important;
			}
			
			.recipe-btn{
				height: 50px;
				color:#D9230F;
				width: 50px;
			}
			.recipe-header-right{
				text-align: right;
				padding-right: 0px;
			}
			.write-recipe{
				height: 50px;
				font-weight: bold;
			}
					
			
			.page-top-title-wrapper{
				background: #fff;
				margin-bottom: 5px;
				border:1px solid #d3d0c9;
			}
			.recipe-row-wrapper{
				margin-bottom: 10px;
			}
			.recipe-row-wrapper img{
				width:230px;
				height:200px;
			}
			.recipe-item-wrapper{
				background: #fff;
				padding: 15px;
				border:1px solid #d3d0c9;
				height:230px;
			}
			.recipe-item-wrapper-right{
				padding: 15px 15px 15px 15px;
				background: #fff;
				border:1px solid #d3d0c9;
				height:230px;
			}
			/*.recipe-item-wrapper h3{
				margin:0px 0px 5px 0px;	
			}
			.recipe-item-wrapper-right h3{
				margin:0px 0px 5px 0px;
			}*/
			.recipe-intro{
				color:#706864;
				height:60px;
				word-break:break-all;
			}
			.recipe-food-mater{
				color:#b6b0a5;
				word-break:break-all;
				height:40px;
			}
			#page-content{
				min-height:700px;
			}
			
			.recipe-wrapper{
				padding:15px 0px 5px 0px;
				margin-bottom: 10px;
				border-bottom: 1px solid #d3d0c9;

			}
			.recipe-wrapper h3{
				margin:5px 0px;
			}
			.recipe-content p a{
				/*font-size: 16px;*/
			}
			.recipe-intro{
				color:#706864;
				height:60px;
				word-break:break-all;
			}
			.recipe-food-mater{
				color:#b6b0a5;
				word-break:break-all;
				height:40px;
			}
			.mem-email{
				padding-left: 17px;
				margin-bottom: 10px;
				
			}
			.recipe-img-wrapper img{
				width: 230px;
				height: 200px;
			}
			#memImg{
				width:150px;
				height:150px;
			}
			#theFooter{
				position : absolute;
				bottom : 0px;
				width : 100%;
				
				background: #222222;
				color:#fff ;
				font-size: 26px;
				font-family: Reklame;
				text-align: center;
			}
			.mem_chef_name{
				font-size:16px;
			}
			.goChef{
				padding:5px 0px;
			}
		</style>

	</head>
	
	
	<body>
	<div class="page">
		<c:import url="/front-end/frontNavbar.jsp" ></c:import>
		<header class="header-style">
			<c:import url="/front-end/recipe/RecipeSearchBar.jsp" ></c:import>
		</header>
		<%//判斷是不是自己 %>
		 		<c:set var="self" value="false" />
				 <c:if test="${memberVO.mem_ac == null}">
				 	<c:set var="self" value="true" />
				</c:if>
				 <c:if test="${memberVO.mem_ac == sessionScope.mem_ac}">
				 	<c:set var="self" value="true" />
				</c:if>
				
				<c:if test="${sessionScope.mem_ac==null}">
				 	<c:set var="self" value="false" />
				</c:if>
		
		
	
		<div class="container">
	    	<div class="row">
						<div class="col-xs-12 col-sm-8">
			   				
				   				<div role="tabpanel">
									<nav class="nav navbar-default">
								        <div class="container-fluid">
								            <ul class="nav navbar-nav">
								            	<c:if test="${self}">
								                	<li><a  href="<%=request.getContextPath()%>/member/member.do?action=getMemberInfo&mem_no=${sessionScope.mem_no}" id="href-style" >食譜</a></li>
								                </c:if>
								                <c:if test="${!self}">
								                	<li><a href="<%=request.getContextPath()%>/member/member.do?action=getMemberInfo&mem_no=${memberVO.mem_no}" id="href-style" >食譜</a></li>
								                </c:if>
								                <c:if test="${self}">
								                <li><a href="<%=request.getContextPath()%>/front-end/collection/myCollection.jsp">收藏</a></li>
								                <li><a href="<%=request.getContextPath()%>/front-end/frd_list/memberFriend.jsp">好友</a></li>

								                <li><a href="<%=request.getContextPath()%>/front-end/product_order/ListProductOrder.jsp">商品訂單

								                	<i class="glyphicon glyphicon-new-window"></i></a></li>
									                <li><a href="/AA105G3/front-end/chef_order_list/chefOrderListOfMem.jsp">我的私廚訂單
									                	<i class="glyphicon glyphicon-new-window"></i></a></li>
									                <c:if test="${chefSvc.getOneChefByMem_no(sessionScope.mem_no).chef_name!=null}">
									                <li><a href="/AA105G3/front-end/chef_order_list/ChefOrderListOfChef2.jsp">我的會員訂單
									                	<i class="glyphicon glyphicon-new-window"></i></a></li>
									                </c:if>
								                </c:if>
								                	
								                
								            </ul>
								        </div>
								    </nav>
								    
								    <div class="col-xs-12 col-sm-12 content-style">
										<div role="tabpanel">
									    <!-- 標籤面板：標籤區 -->
									    <c:if test="${!self}">
										    <c:forEach var="recipeVO" items="${recipeSvc.findByMem_no(memberVO.mem_no)}" >
										    	<div class="row recipe-wrapper">
													<div class="col-xs-12 col-sm-4 recipe-img-wrapper">
													<a href="<%=request.getContextPath()%>/recipe/recipe.do?action=getOne_For_Display&recipe_no=${recipeVO.recipe_no}">
														<img src="<%=request.getContextPath()%>/recipe/showRecipe_pic.do?recipe_no=${recipeVO.recipe_no}">
													</a>
													</div>
													<div class="col-xs-12 col-sm-8 recipe-content">
															<a href="<%=request.getContextPath()%>/recipe/recipe.do?action=getOne_For_Display&recipe_no=${recipeVO.recipe_no}">
															<h3>${recipeVO.recipe_name }</h3>
															</a>
															<p>by <a href="<%=request.getContextPath()%>/member/member.do?action=getMemberInfo&mem_no=${recipeVO.mem_no}">${memberVO.mem_name}</a></p>
															<p class="recipe-intro">${recipeVO.recipe_intro}</p>
															<p class="recipe-food-mater">食材：${recipeVO.food_mater}</p>
															<p>
																<i class="glyphicon glyphicon-eye-open">${recipeVO.recipe_total_views}</i>
																<i class="glyphicon glyphicon-heart">${recipeVO.recipe_like + collectionSvc.getCollectionSize(recipeVO.recipe_no)}</i>
															</p>												
													</div>
												</div>
											</c:forEach>
										</c:if>
										
										<c:if test="${self}">
										    <c:forEach var="recipeVO" items="${recipeSvc.findByMem_no(sessionScope.mem_no)}" >
										    	<div class="row recipe-wrapper">
													<div class="col-xs-12 col-sm-4 recipe-img-wrapper">
													<a href="<%=request.getContextPath()%>/recipe/recipe.do?action=getOne_For_Display&recipe_no=${recipeVO.recipe_no}">
														<img src="<%=request.getContextPath()%>/recipe/showRecipe_pic.do?recipe_no=${recipeVO.recipe_no}">
													</a>
													</div>
													<div class="col-xs-12 col-sm-8 recipe-content">
															<a href="<%=request.getContextPath()%>/recipe/recipe.do?action=getOne_For_Display&recipe_no=${recipeVO.recipe_no}">
															<h3>${recipeVO.recipe_name }</h3>
															</a>
															<p>by <a href="<%=request.getContextPath()%>/member/member.do?action=getMemberInfo&mem_no=${recipeVO.mem_no}">${memberSvc.getOneMember(sessionScope.mem_no).mem_name}</a></p>
															<p class="recipe-intro">${recipeVO.recipe_intro}</p>
															<p class="recipe-food-mater">食材：${recipeVO.food_mater}</p>
															<p>
																<i class="glyphicon glyphicon-eye-open">${recipeVO.recipe_total_views}</i>
																<i class="glyphicon glyphicon-heart">${recipeVO.recipe_like + collectionSvc.getCollectionSize(recipeVO.recipe_no)}</i>
															</p>												
													</div>
												</div>
											</c:forEach>
										</c:if>
										</div>
									</div>		    
								</div>	

			    		</div>
			    		
			    		<div class="col-xs-12 col-sm-3 col-sm-push-1 text-center member-style">
			    		<%//其他會員 %>
			    		<c:if test="${!self}">
					    	<img id="memImg" src="<%=request.getContextPath()%>/MemberDBGifReader.do?name=${memberVO.mem_no}">
	    					<h3>${memberSvc.getOneMember(memberVO.mem_no).mem_name}</h3>
	    					<c:set var="aChef" value="${chefSvc.getOneChefByMem_no(memberVO.mem_no)}" />
	    					<c:if test="${aChef.chef_name !=null}">
	    					<div class="mem_chef_name">(${chefSvc.getOneChefByMem_no(memberVO.mem_no).chef_name})</div>
							</c:if>
							<div class="col-xs-12 col-sm-6 count-style">
						    	<div>食譜數：${recipeSvc.findByMem_no(memberVO.mem_no).size()}</div>
						    </div>
						    <div class="col-xs-12 col-sm-6 count-style">
						    	<div >追隨數：<span id="count">${collectionSvc.getCollectionSize(memberVO.mem_no) > 0?collectionSvc.getCollectionSize(memberVO.mem_no):0}</span></div>
						    </div>
						    <div class="col-xs-12 col-sm-12 text-left">
						    	<div class="mem-email">${memberVO.mem_email.toLowerCase()}</div>
						    	<c:if test="${aChef.chef_name !=null}">
									<div class="text-center goChef">
										<a href="<%=request.getContextPath()%>/chef/chef.do?action=getOne_For_Display&chef_no=${aChef.chef_no}" class="btn btn-info btn-xs">
										前往私廚頁面
										</a>
									</div>
								</c:if>
						    </div>
						 </c:if>
						 
						 <%//自己 %>
						 
						<c:if test="${self}">
					    	<img id="memImg" src="<%=request.getContextPath()%>/MemberDBGifReader.do?name=${sessionScope.mem_no}">
					    	<%//得到自己的資料 避免一直開資料庫連線 %>
					    	<c:set var="ME" value="${memberSvc.getOneMember(sessionScope.mem_no)}" />
	    					<h3>${ME.mem_name}</h3>
	    					<c:set var="aChef" value="${chefSvc.getOneChefByMem_no(ME.mem_no)}" />
	    					<c:if test="${aChef.chef_name !=null}">
							<div class="mem_chef_name">(${aChef.chef_name})</div>
							</c:if>
							<div class="col-xs-12 col-sm-6 count-style">
						    	<div>食譜數：${recipeSvc.findByMem_no(ME.mem_no).size()}</div>
						    </div>
						    <div class="col-xs-12 col-sm-6 count-style">
						    	<div >追隨數：<span id="count">${collectionSvc.getCollectionSize(ME.mem_no) > 0?collectionSvc.getCollectionSize(sessionScope.mem_no):0}</span></div>
						    </div>
						    <div class="col-xs-12 col-sm-12 text-left">
						    	<div class="mem-email">${ME.mem_email.toLowerCase()}</div>
							    <c:if test="${aChef.chef_name !=null}">
									<div class="text-center goChef">
										<a href="<%=request.getContextPath()%>/chef/chef.do?action=getOne_For_Display&chef_no=${aChef.chef_no}" class="btn btn-info btn-xs">
										前往私廚頁面
										</a>
									</div>
								</c:if>
						    </div>
						 </c:if>
					
					

						 <c:if test="${!self}">
						     <c:if test="${memberVO.mem_no != sessionScope.mem_no}">
						     
						     <c:set var="authorFlag" value="false" />
						     <c:set var="coll_no" value="0" />
						     <c:forEach var="aCollection" items="${collectionSvc.getMyAuthorCollection(sessionScope.mem_no)}" >
						     	<c:if test="${aCollection.all_no == memberVO.mem_no}">
						    		<c:set var="authorFlag" value="true" />
						    		<c:set var="coll_no" value="${aCollection.coll_no}" />
						    	</c:if>
						     </c:forEach>
						     
							    <c:if test="${!authorFlag}">
								    <div class="col-xs-12 col-sm-6">
								    	<button id ="addCollection" class="btn btn-primary" value="${memberVO.mem_no}">加入追隨</button>
								    </div>
							    </c:if>
							    <c:if test="${authorFlag}">
								    <div class="col-xs-12 col-sm-6">
								    	<button id="cancelCollection" class="btn btn-default" value="${memberVO.mem_no}">取消追隨</button>
								    </div>
							    </c:if>
						    
						    <c:set var="flag" value="false" />
						    <c:forEach var="aFriend" items="${frd_listSvc.getFriendsByMem_no(sessionScope.mem_no)}" >
						    	<c:if test="${aFriend.friend_no == memberVO.mem_no}">
						    		<c:set var="flag" value="true" />
						    	</c:if>
						    </c:forEach>
							      <c:if test="${!flag}">
							    	<div class="col-xs-12 col-sm-6">
							    		<button id="addFriend" class="btn btn-primary" value="${memberVO.mem_no}">加入好友</button>
							   		 </div>
							     </c:if>
							     <c:if test="${flag}">
							    	<div class="col-xs-12 col-sm-6">
							    		<button class="btn btn-default" disabled="disabled" value="${memberVO.mem_no}">已加入好友</button>
							   		 </div>
							     </c:if>
							     <input type="hidden" id="addNo" value="${memberVO.mem_no}">
							     <input type="hidden" id="cancelNo" value="${coll_no}">
							</c:if>
					    </c:if>
					    </div>
					</div>
				
	    	</div>
	<footer id="theFooter">
		Copyright &copy; 2017 Java Team 3 
	</footer>
</div>
<c:import url="/front-end/chat/inviteChat.jsp" ></c:import>

		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.2.9/sweetalert2.min.js"></script>
		<script type="text/javascript">

			//init
			$().ready(function(){

				//判斷是哪個tab
				var tabId ="" ; 
				if(tabId!=""){
					$("#tab1").removeClass('active');
					$("#"+tabId).addClass('active');
					$(".tab1").removeClass('active');
					$("."+tabId).addClass('active');
				}


				//好友區塊
				var addFriend = $("#addFriend").click(function(){
					var onlineMem_no = '${sessionScope.mem_no}';
					var friend_no = $(this).val();
					if(onlineMem_no!=''){
					$.ajax({
						 type:"POST",
						 url:"/AA105G3/frd_list/frd_listJsonRes.do",
						 data:{"action":"addFriend","friend_no":friend_no},
						 dataType:"json",
						 success:function (data){

							 swal({
							   title: '已向'+ data.friendName +'送出好友申請!',
							    type:'success'
							  })
							 $('#addFriend').text('已加入好友')
							 $('#addFriend').attr("disabled", true);
							 $('#addFriend').removeClass('btn-primary');
							 $('#addFriend').addClass('btn-default');
					     },
			             error:function(){alert('not found')}
			         })
					}else{
						swal({
							 title: '請先登入',
							 text: "很抱歉，好友功能必須先登入!",
							 type:'warning'
							})
						
					}
				})
				
				//收藏區塊
				//得到收藏的兩個號碼 一個刪除用 一個加入用
				
				var addCollection = function(){
					var onlineMem_no = '${sessionScope.mem_no}';
					var all_no = $(this).val();
					if(onlineMem_no!=''){
					 $.ajax({
						 type:"POST",
						 url:"/AA105G3/collection/collectionJsonRes.do",
						 data:{"action":"addCollection","all_no":all_no},
						 dataType:"json",
						 success:function (data){

							 swal({
							   title: data.msg,
							    type:'success'
							  })
							 $('#addCollection').text('取消追隨')
							 $('#addCollection').attr("id","cancelCollection")
							 $('#cancelCollection').removeClass('btn-primary');
							 $('#cancelCollection').addClass('btn-default');
							 $('#cancelCollection').unbind( "click",addCollection);
							 $('#cancelCollection').click(cancelCollection);
							 var text = $('#count').text() 
							 var count = parseInt(text)+1;
							 $('#count').text(count);
					     },
			             error:function(){alert('not found')}
			         }) 
					}else{
						swal({
							 title: '請先登入',
							 text: "很抱歉，追隨功能必須先登入!",
							 type:'warning'
							})
						
					}
				}
				//註冊方法
				$("#addCollection").on("click",addCollection);
				
				var cancelCollection = function(){
					var all_no = $(this).val();
					 $.ajax({
						 type:"POST",
						 url:"/AA105G3/collection/collectionJsonRes.do",
						 data:{"action":"delete","all_no":all_no},
						 dataType:"json",
						 success:function (data){

							 swal({
							   title:'已取消追隨',
							    type:'success'
							  })
							 $('#cancelCollection').text('加入追隨')
							 $('#cancelCollection').attr("id","addCollection")
							 $('#addCollection').removeClass('btn-default');
							 $('#addCollection').addClass('btn-primary');
							 $('#addCollection').unbind( "click",cancelCollection);
							 $('#addCollection').click(addCollection);
							 var text = $('#count').text() 
							 var count = parseInt(text)-1;
							 $('#count').text(count);
					     },
			             error:function(){alert('not found')}
			         }) 
				}
				//註冊方法
				$("#cancelCollection").on("click",cancelCollection);
				
				/* $('body').on('click',"#addCollection",addCollection);
				$('body').on('click',"#cancelCollection",cancelCollection); */
			})
			
			
			
		</script>
	</body>

</html>
