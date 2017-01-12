<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.chef.model.*"%>
<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>frontpage-chef</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/AA105G3/css/frontpageCSS.css">
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
    </style>
</head>

<body>
    <!--START SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#">
        <i class="fa fa-angle-up"></i>
        <span>Top</span>
    </a>
    <!-- END SCROLL TOP BUTTON -->
    <div class="navbar navbar-default navbar-fixed-top navbar-inverse mu-main-navbar">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#home" class="foodtime"><img alt="FoodTime" src="/AA105G3/images/Logo.png">分享食光</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-ex-collapse">
                <ul class="nav navbar-nav navbar-right mu-main-nav">
                    <li>
                        <a href="#home">首頁</a>
                    </li>
                    <li>
                        <a href="#mu-recipe">食譜</a>
                    </li>
                    <li>
                        <a href="#mu-video">影音</a>
                    </li>
                    <li>
                        <a href="#mu-chef">私廚</a>
                    </li>
                    <li>
                        <a href="#mu-stream">實況</a>
                    </li>
                    <li>
                        <a href="#mu-market">市集</a>
                    </li>
                    <li>
                        <a href="#mu-contact">聯絡我們</a>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">UserID<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">編輯個人資訊</a></li>
                            <li><a href="#">個人頁面</a></li>
                            <li><a href="#">我的最愛</a></li>
                            <li><a href="#">登出</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">註冊</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <section id="top-img">
        <div class="col-xs-12 col-sm-12">
            <div class="top-img"></div>
            <!-- <img src="/AA105G3/images/title.jpg" height="500px" width="100%"> -->
        </div>
    </section>
    
    <div class="container" id="mainpage">
        <div class="row">
            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/chef/chef.do" name="form1" enctype="multipart/form-data">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 text-center">
                            <h2>填寫私廚基本資訊</h2>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty errorMsgs}">
					<font color='red'>請修正以下錯誤:
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</font>
				</c:if>
                <div class="col-xs-12 col-sm-6 col-sm-offset-3">
                    <div class="form-group">
                        <h4>私廚照片</h4>
                        <input type="File" name="chef_image" size="45" value="" />
                    </div>
                    <div class="form-group">
                        <h4>私廚證照</h4>
                        <input type="File" name="chef_lic" size="45" value="" />
                    </div>
                    <div class="form-group form-inline">
                        <h4>真實姓名</h4>
                        <input type="text" name="chef_name" id="" value="史提芬" class="form-control">
                    </div>
                    <div class="form-group form-inline">
                        <h4>身分證字號</h4>
                        <input type="text" name="chef_id" id="" value="M152357923" class="form-control" maxlength="10" minlength="10">
                    </div>
                    <div class="form-group form-inline">
                        <h4>匯款帳戶銀行代碼</h4>
                        <input type="text" name="chef_bnk" id="" value="700" class="form-control" maxlength="5" minlength="5">
                    </div>
                    <div class="form-group form-inline">
                        <h4>匯款帳號</h4>
                        <input type="text" name="chef_bnk_ac" id="" value="753951467418622" class="form-control">
                    </div>
                    <div class="form-group">
                        <h4>服務地區</h4>
                        <textarea name="chef_area" id="" value="" class="form-control">台北市</textarea>
                    </div>
                    <div class="form-group">
                        <h4>擅長料理風格</h4>
                        <textarea name="chef_skill" id="" value="" class="form-control">黑暗料理</textarea>
                    </div>
                    <div class="form-group">
                        <h4>私廚簡介</h4>
                        <textarea name="chef_intr" id="" value="" class="form-control">無可奉告</textarea>
                    </div>
                    <div class="form-group">
                        <h4>參考菜單</h4>
                        <textarea name="chef_menu" id="" value="" class="form-control">無菜單料理</textarea>
                    </div>
                    <div class="form-group">
                        <h4>參考菜單圖片一</h4>
                        <input type="File" name="chef_reci_image1" size="45" value="" />
                    </div>
                    <div class="form-group">
                        <h4>參考菜單圖片二</h4>
                        <input type="File" name="chef_reci_image2" size="45" value="" />
                    </div>
                    <div class="form-group">
                        <h4>參考菜單圖片三</h4>
                        <input type="File" name="chef_reci_image3" size="45" value="" />
                    </div>
                    <div class="form-group">
                        <h4>參考菜單圖片四</h4>
                        <input type="File" name="chef_reci_image4" size="45" value="" />
                    </div>
                    <div class="form-group">
                        <h4>參考菜單圖片五</h4>
                        <input type="File" name="chef_reci_image5" size="45" value="" />
                    </div>
                      <div class="form-group">
                        <h4>上傳DEMO影片一</h4>
                        <input type="File" name="chef_movie1" size="45" value="" />
                    </div>
                    <div class="form-group">
                        <h4>上傳DEMO影片二</h4>
                        <input type="File" name="chef_movie2" size="45" value="" />
                    </div>
                    <br>
                    <input type="hidden" name="mem_no" value="M00000006">    
                    <input type="hidden" name="action" value="insert">                                                                                                                 
                    <input type="submit" value="送出申請">
                </div>
            </FORM>
        </div>
    </div>
    <footer>
        Copyright &copy; 2016 Java Team 3
    </footer>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

</html>
