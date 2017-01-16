<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.chef_order_list.model.*"%>
<%@ page import="com.chef.model.*"%>
<%@ page import="com.member.model.*"%>
<%
Chef_order_listVO chef_order_listVO = (Chef_order_listVO) request.getAttribute("chef_order_listVO");
ChefVO chefVO = (ChefVO) request.getAttribute("chefVO");
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
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
	body{
		background: #efede8;
		padding-top: 50px;
		position : relative;
		height : 100%;
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
            <!-- <img src="images/title.jpg" height="500px" width="100%"> -->
        </div>
    </section>
    <ol class="breadcrumb">
        <li>
            <a href="#">成為私廚</a>
        </li>
        <li>
            <a href="#">私廚清單</a>
        </li>
    </ol>
    <%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/chef_order_list/chef_order_list.do" name="form1">
    <div class="container">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 text-center">
                        <h2>填寫私廚訂單</h2>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <div>
            	
            </div>
            <div class="row" style="border-bottom: 2px solid #d3d4d5">
            	<div class="col-xs-12 col-sm-8 col-sm-offset-2">                
                    <div class="form-group form-inline">
                        <b>私廚 : </b>
                        <b>${chefVO.chef_name}</b>
                    </div>
                </div>
            </div>
            <br>
            <br>        
            <div class="row" style="border-bottom: 2px solid #d3d4d5">
                <div class="col-xs-12 col-sm-8 col-sm-offset-2">                
                    <div class="form-group form-inline">
                        <b>預約日期 : </b>
                        <input type="text" name="act_date" id="chef_act_date" class="form-control" readonly value="${param.act_date}">
                    </div>
                </div>
            </div>
            <br>
            <br>
            <div class="row" style="border-bottom: 2px solid #d3d4d5">
                <div class="col-xs-12 col-sm-8 col-sm-offset-2">
                    <div class="form-group form-inline">
						<b>預約時段 : </b>
<%--                         <input type="text" name="act_time" id="chef_act_time" class="form-control" readonly value="${param.act_time}"> --%>
						<c:if test="${param.act_time == '10:00'}">
                        	<input type="text" name="" id="" class="form-control" readonly value="10:00~14:00">
                        	<input type="hidden" name="act_time" id="chef_act_time" value="${param.act_time}">
                    	</c:if>
                    	<c:if test="${param.act_time == '16:00'}">
                        	<input type="text" name="" id="" class="form-control" readonly value="16:00~20:00">
                        	<input type="hidden" name="act_time" id="chef_act_time" value="${param.act_time}">
                    	</c:if>

<!--                         <select class="form-control" name="act_time" id="chef_act_time"> -->
<!--                             <option value="10:00">10:00~14:00</option> -->
<!--                             <option value="16:00">16:00~20:00</option> -->
<!--                         </select> -->
                    </div>
                </div>
            </div>
            
            <br>
            <br>
<!-- 			<div class="row" style="border-bottom: 2px solid #d3d4d5"> -->
<!--                 <div class="col-xs-12 col-sm-8 col-sm-offset-2"> -->
<!--                     <div class="form-group form-inline"> -->
<!-- 						<b>金額 : </b> -->
<!--                         <input type="text" name="chef_ord_cost" id="chef_ord_cost" class="form-control" placeholder="請填入約定之金額"> -->
<!-- 					</div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <br> -->
<!--             <br> -->
            <div class="row" style="border-bottom: 2px solid #d3d4d5">
                <div class="col-xs-12 col-sm-8 col-sm-offset-2">
                    <div class="form-group">
                        <b>約定地點：</b>
                        <input type="text" name="chef_ord_place" id="chef_ord_place" class="form-control" placeholder="請填入約定地點">
                        <!-- <textarea id="" class="form-control"></textarea> -->
                    </div>
                </div>
            </div>
            <br>
            <br>
            <div class="row" style="border-bottom: 2px solid #d3d4d5">
                <div class="col-xs-12 col-sm-8 col-sm-offset-2">
                    <div class="form-group">
                        <b>約定內容：</b>
                        <textarea name="chef_ord_cnt" id="chef_ord_cnt" class="form-control" rows="5"></textarea>
                    </div>
                </div>
            </div>
            <br>
            <br>            
        </div>
    </div>
    <div class="text-center">
    <input type="hidden" name="action" value="insert">
    <input type="hidden" name="mem_no" value="${mem_no}">
    <input type="hidden" name="chef_no" value="${chefVO.chef_no}">
	<input type="submit" value="送出新增" class="btn btn-success">
	</div>
	</FORM>
	<br>
	<br>
	<c:import url="/front-end/chat/inviteChat.jsp" ></c:import>
    <footer id="theFooter">
		Copyright &copy; 2016 Java Team 3 
	</footer>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!--     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script> -->
    <script type="text/javascript">
//     $('#chef_act_date').datepicker({
//         format: "yyyy/mm/dd",
//         startDate: '+3d',
//         endDate: '+1m +3d',
//         maxViewMode: 0,
//         todayBtn: "linked",
//         clearBtn: true,
//         //daysOfWeekDisabled: "0,6",
//         orientation: "bottom right"

//     });
    </script>
    
</body>

</html>
