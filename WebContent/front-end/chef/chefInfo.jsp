<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.chef.model.*"%>
<%@ page import="com.member.model.*"%>
<%ChefVO chefVO=(ChefVO)request.getAttribute("chefVO"); %>
<%MemberVO memberVO=(MemberVO)request.getAttribute("memberVO"); %>


<jsp:useBean id="collectionSvc" scope="page" class="com.collection.model.CollectionService" />
<jsp:useBean id="memberSvc" scope="page" class="com.member.model.MemberService" />
<jsp:useBean id="chefSvc" scope="page" class="com.chef.model.ChefService" />

<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>frontpage-chef</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/AA105G3/css/frontpageCSS.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.2.9/sweetalert2.min.css">
    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    <style type="text/css" media="screen">
    .first-col {
        padding-top: 25px;
        padding-bottom: 50px;
    }
    
    .first-col img {
        width: 350px;
        height: 250px;
    }
    
    .next-col {
        padding-bottom: 50px;
    }
    
    .next-col img {
        width: 350px;
        height: 250px;
    }
    
    #top-img {
        background-image: url(/AA105G3/images/chef/chef_title.jpg);
        height: 500px;
        /* background-size: cover; */
        background-position: center;
    }
    
    .front-style {
        background: #f5deb3;
        width: 175px;
    }
    
    .btn-style {
        background: #f5deb3;
        width: 175px;
        text-align: center;
        padding-top: 18px;
        padding-bottom: 18px;
    }
	.shopping-cart{
		position: absolute;
		position: fixed;
		top: 60%;
		right: 200px;
		width: 550px;
		list-style: none;
		margin: 0;
		padding: 0;
		font-size: 30px;
/* 		background:steelblue;  */
	}
	.shopping-cart li{
		padding-bottom: 15px;
		width:450px;
		height:100px;
	}
	#theFooter{

		
		
		width : 100%;
		
		background: #222222;
		color:#fff ;
		font-size: 26px;
		font-family: Reklame;
		text-align: center;
	}
	body{
		background: #efede8;
		padding-top: 50px;
		
		height : 100%;
		
	}
	.chef_zone img{
    		height : 500px;
    		width:300px;
    }
    #img_zone img{
    width:100%;
    height:100%;
	}
	#img_zone div{
    padding: 1px;
	}
	#chef_act_date{
		height:60px;	
	}
	#chef_act_time{
		height:60px;
	}
	#img_zone{
		margin-bottom:50px;
	}
	.title-style{
		padding-top : 20px;
		padding-bottom : 30px;
	}
	.info-img-style{
		padding-top : 20px;
		padding-bottom : 0px;
	}
	.info-message-style{
		margin-top : 100px;
	}
	.info-style{
		padding-bottom : 50px;
	}
	.row-style{
		padding-top : 10px;
		padding-bottom : 10px;
	}
	.img-title-style{
		padding-top : 50px;
		padding-bottom : 10px;
	}
	.icon-style{
		color : black;
		padding-bottom : 0px;
	}
    </style>
</head>

<body>
    
    <header>
    	<c:import url="/front-end/frontNavbar.jsp"></c:import>
    </header>
    
    <section id="top-img">
        <div class="col-xs-12 col-sm-12">
            <div class="top-img"></div>

        </div>
    </section>

    <div class="container chef_zone">
        <div class="row">
            <div class="container">
                <div class="row">

                    <div class="col-xs-12 col-sm-12 text-center">
                        <h1 class="title-style">
                        	私廚個人資訊
                        	<a href="#" class="glyphicon glyphicon-cog icon-style" style="text-decoration:none;"></a>
                        </h1>
                        
                        <c:set var="chefFlag" value="false" />
                        <c:if test="${chefVO.mem_no != sessionScope.mem_no}">
                        
                        <c:forEach var="aCollection" items="${collectionSvc.getMyChefCollection(sessionScope.mem_no)}" >
						     <c:if test="${aCollection.all_no == chefVO.chef_no}">
						    		<c:set var="chefFlag" value="true" />
						    </c:if>
						</c:forEach>
                        
                        </c:if>
                        
                        

                         <c:if test="${chefVO.mem_no != sessionScope.mem_no}">
                        	<c:if test="${!chefFlag}">
                        	<button id ="addCollection" class="btn btn-primary" value="${chefVO.chef_no}">追隨此私廚</button>
                      	 	</c:if> 
                        	 <c:if test="${chefFlag}">
                        	<button id="cancelCollection" class="btn btn-default" value="${chefVO.chef_no}">取消追隨</button>
                       		 </c:if>
                        </c:if>
                        
                        <!-- <a href="/AA105G3/front-end/chef/becomeChef.jsp" class="btn btn-primary">成為私廚</a> -->

                    </div>
                </div>
            </div>
            <br>
            
     		<div class="col-xs-12 col-sm-12">
            
            <div class="col-xs-12 col-sm-12 text-center">
                <div class="row  info-style" style="border-bottom: 2px solid #d3d4d5">
                    <div class="col-xs-12 col-sm-4 col-sm-push-2 info-img-style">
                            <img src="<%=request.getContextPath()%>/chef/chefImage.do?chef_no=${chefVO.chef_no}&chef_image=123" class="img-circle" style="width:250px;height:250px">
                    </div>
                    <div class="col-xs-12 col-sm-6 col-sm-push-1 info-message-style">
                        <div align="center"><font size="+5">${chefVO.chef_name}</font></div>
                        <p></p>
                    </div>
<!--                     <div class="col-xs-12 col-sm-5"> -->
<!--                         <div class="thumbnail"> -->
<%--                             <img src="<%=request.getContextPath()%>/chef/chefImage.do?chef_no=${chefVO.chef_no}&chef_lic=123" class="img-responsive" style="width:100%;height:100%"> --%>
<!--                             <div class="caption"> -->
<!--                                 <h3 align="center">私廚證照</h3> -->
<!--                                 <p></p> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
                <br>
<!--                 <div class="row"> -->
<!--                     <div class="col-xs-12 col-sm-12"> -->
<!--                         <h3>基本資料</h3> -->
<!--                     </div> -->
<!--                     <div class="col-xs-12 col-sm-12"> -->
<!--                         <ul id="infoText"> -->
<%--                             <li>審核狀態:${chefVO.chef_chk_cond}</li> --%>
<%--                             <li>姓名:${chefVO.chef_name}</li> --%>
<%--                             <li>匯款帳戶銀行代碼:${chefVO.chef_bnk}</li> --%>
<%--                             <li>匯款帳號:${chefVO.chef_bnk_ac}</li> --%>
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <br> -->
                <div class="row row-style" style="border-bottom: 2px solid #d3d4d5;">
                    <div class="col-xs-12 col-sm-6 col-sm-push-1">
                        <h3 style="margin-top:0px"><b>服務地區</b></h3>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-sm-pull-1">
                        <h3 style="margin-top:0px">${chefVO.chef_area}</h3>                    
                    </div>
                </div>
                <br>
                <div class="row row-style" style="border-bottom: 2px solid #d3d4d5">
                    <div class="col-xs-12 col-sm-6 col-sm-push-1">
                        <h3 style="margin-top:0px"><b>擅長料理風格</b></h3>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-sm-pull-1">
                        <h3 style="margin-top:0px">${chefVO.chef_skill}</h3>                 
                    </div>
                </div>
                <br>
                <div class="row row-style" style="border-bottom: 2px solid #d3d4d5">
                    <div class="col-xs-12 col-sm-6 col-sm-push-1">
                        <h3 style="margin-top:0px"><b>私廚簡介</b></h3>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-sm-pull-1">
                        <h3 style="margin-top:0px">${chefVO.chef_intr}</h3>                    
                    </div>
                </div>
                <br>
                <div class="row row-style" style="border-bottom: 2px solid #d3d4d5">
                    <div class="col-xs-12 col-sm-6 col-sm-push-1">
                        <h3 style="margin-top:0px"><b>參考菜單(建議標上價格)</b></h3>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-sm-pull-1">
                        <h3 style="margin-top:0px">${chefVO.chef_menu}</h3>
                    </div>
                </div>
            </div>
            <br>
            <div class="col-xs-12 col-sm-12 text-center img-title-style">
                <h2>參考圖片</h2>
            </div>
            <br>
            <div class="row" id="img_zone">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                    <div class="col-xs-12 col-sm-6" style="padding:1px">
                        <img src="<%=request.getContextPath()%>/chef/chefImage.do?chef_no=${chefVO.chef_no}&chef_reci_image1=123" class="img-responsive" style="width:472px;height:315px">
                    </div>
                    <div class="col-xs-12 col-sm-6" style="padding:1px">
                        <img src="<%=request.getContextPath()%>/chef/chefImage.do?chef_no=${chefVO.chef_no}&chef_reci_image2=123" class="img-responsive" style="width:472px;height:315px">
                    </div>
                </div>
                <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                    <div class="col-xs-12 col-sm-4" style="padding:1px">
                        <img src="<%=request.getContextPath()%>/chef/chefImage.do?chef_no=${chefVO.chef_no}&chef_reci_image3=123" class="img-responsive" style="width:310px;height:206px" >
                    </div>
                    <div class="col-xs-12 col-sm-4" style="padding:1px">
                        <img src="<%=request.getContextPath()%>/chef/chefImage.do?chef_no=${chefVO.chef_no}&chef_reci_image4=123" class="img-responsive" style="width:310px;height:206px">
                    </div>
                    <div class="col-xs-12 col-sm-4" style="padding:1px">
                        <img src="<%=request.getContextPath()%>/chef/chefImage.do?chef_no=${chefVO.chef_no}&chef_reci_image5=123" class="img-responsive" style="width:310px;height:206px">
                    </div>
                </div>
            </div>
            
            </div>
            <c:if test="${chefVO.mem_no != sessionScope.mem_no}">
              <div class="" style="padding:1px">
                <div id="sidebar-wrapper" >
					<ul class="shopping-cart list-group" style="width:180px">	
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/chef_order_list/chef_order_list.do">
						<li class="list-group-item">	
							<div class="form-group form-inline">							
                        		<b>預約日期 : </b>
                        		<input type="text" name="act_date" id="chef_act_date" class="form-control" placeholder="請點擊後選取日期" readonly>                        	
                    		</div>
                    	</li>	
                    	<li class="list-group-item">
   							<div class="form-group form-inline">
								<b>預約時段 : </b>
                        		<select class="form-control" name="act_time" id="chef_act_time">
                            		<option value="">請選擇時段</option>
                            		<option value="10:00">10:00~14:00</option>
                            		<option value="16:00">16:00~20:00</option>                       
                        		</select>
                    		</div>
                    	</li>
                    	<li class="list-group-item">	
                    		<div class="form-group form-inline">				
			     				<input type="submit" value="下訂私廚">
			     				<input type="hidden" name="chef_no" value="${chefVO.chef_no}">
			     				<input type="hidden" name="mem_no" value="${sessionScope.mem_no}">
			     				<input type="hidden" name="action"	value="getChefNo_For_addChefOrd">
							</div>
						</li>	
						</FORM>	
					</ul>
				</div>
			</div>
          </c:if>  
            
<!-- 			<div class="col-xs-12 col-sm-12 text-center">				 -->
<%-- 				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/chef_order_list/chef_order_list.do"> --%>
<!-- 			     <input type="submit" value="下訂私廚"> -->
<%-- 			     <input type="hidden" name="chef_no" value="${chefVO.chef_no}"> --%>
<!-- 			     <input type="hidden" name="mem_no" value="M00000001"> -->
<!-- 			     <input type="hidden" name="action"	value="getChefNo_For_addChefOrd"></FORM> -->
<!-- 			</div> -->

        </div>
    </div>
    <c:import url="/front-end/chat/inviteChat.jsp" ></c:import>
    <footer id="theFooter">
		Copyright &copy; 2016 Java Team 3 
	</footer>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.2.9/sweetalert2.min.js"></script>
    <script type="text/javascript">
    
    $().ready(function(){
    	//註冊datepicker
    	$('#chef_act_date').datepicker({
            format: "yyyy/mm/dd",
            startDate: '+3d',
            endDate: '+1m +3d',
            maxViewMode: 0,
            todayBtn: "linked",
            clearBtn: true,
//             daysOfWeekDisabled: "0,6",
            orientation: "bottom right"

        });
    	
    	
    	
    	//收藏區塊
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
					 $('#cancelCollection').text('追隨私廚')
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
    	
    	
    })
    
    
    
    
    
    
    </script>
</body>

</html>
