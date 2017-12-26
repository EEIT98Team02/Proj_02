<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <script src="../js/cookie.js"></script>

    <style>
        body {
            font-family: Microsoft JhengHei;
        }
    </style>
</head>
<body>
<jsp:include page="/commons/header.jsp"></jsp:include>
    <section id="posts">
        <div class="container p-5">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header" style="background-color:	#97CBFF">
                            <h4>文章列表</h4>
                            <a href="${pageContext.request.contextPath}/_06_blog/post.jsp" class="btn btn-warning">新增文章</a>
                        </div>
                        <table class="table table-striped">
                            <thead class="thead-inverse">
                                <tr>
                                    <th>#</th>
                                    <th>標題</th>
                                    <th>類型</th>
                                    <th>新增時間</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
<!--                                 <tr> -->
<!--                                     <td>#</td> -->
<%--                                     <td>${param.articlename}</td> --%>
<%--                                     <td>${param.articletype}</td> --%>
<%--                                     <td>${param.posttime}</td> --%>
<!--                                     <td><a href="" class="btn btn-secondary">>>更多</a></td> -->
<!--                                 </tr> -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    

    <script src="../js/jquery-1.12.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
            integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
            crossorigin="anonymous"></script>
    <script>
    $(function(){
    	var memberemail=Cookies.get('user');
    	console.log(memberemail);
    });
    
    $.get("show.controller",{ "memberemail": "memberemail"})
    </script>       


    
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>