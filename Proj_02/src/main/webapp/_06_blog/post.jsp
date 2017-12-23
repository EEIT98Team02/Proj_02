<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增文章</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <style>
        body{
            font-family:Microsoft JhengHei;
        }
    </style>
</head>
<body>
<jsp:include page="/commons/header.jsp"></jsp:include>
    <section>
        <div class="container p-5">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header" style="background-color:	#97CBFF">
                            <h4>新增文章</h4>
                        </div>
                        <div class="card-body">
                            <form name="form" action="<c:url value='/blog.controller' />" method="post">
                                <div class="form-group">
                                    <label for="title">文章標題</label>
                                    <input type="text" class="form-control" name="articlename" id="articlename" value="" />
                                </div>
                                <div class="form-group">
                                    <label for="title">文章類型</label>
                                    <select class="form-control" name="articletype" id="articletype">
                                        <option value="表演萬象">表演萬象</option>
                                        <option value="展覽廣場">展覽廣場</option>
                                        <option value="音樂現場">音樂現場</option>
                                        <option value="講座研習">講座研習</option>
                                        <option value="電影瞭望">電影瞭望</option>
                                        <option value="城市萬花筒">城市萬花筒</option>
                                        <option value="親子活動">親子活動</option>
                                        <option value="戶外行腳">戶外行腳</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="file">封面照片</label>
                                    <img /><!--上傳後的照片顯示在這裡-->
                                    <input type="file" class="form-control-file" />
                                    <small class="form-text text-muted">Max Size QQ</small>
                                </div>
                                <div class="form-group">
                                    <label for="body">文章內容</label>
                                    <textarea class="form-control" name="articlecontent" id="editor" ></textarea>
                                </div>
                                <div>
                                    <input type="radio" name="pravicy" id="setting1"/><label for="setting1">公開</label>
                                    <input type="radio" name="pravicy" id="setting2" /><label for="setting2">私人</label>
                                </div>
                                <div>
                                    <input type="submit" class="btn btn-primary" value="送出"/>
                                    <span>${message.scuess}</span>
                                    
<!-- start here -->
							<input type="button" class="btn btn-sm btn-secondary" value="送出"
								id="buttonPost" data-toggle="modal" data-target="#myModal" />
							<div class="modal" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div id="show" class="modal-header">
											<h5 class='modal-title'>新增成功</h5>										
											<button class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">太棒了！</div>
										<div class="modal-footer">
<!-- 											<button class="btn btn-secondary" data-dismiss="modal">關閉視窗</button> -->
											<button class="btn btn-warning"><a href="${pageContext.request.contextPath}/_06_blog/dashboard.jsp">回到部落格首頁</a></button>
										</div>
									</div>
								</div>
							</div>

<!-- end here -->
                                    
                                </div>
                            </form><!-- form end here-->
                        </div><!-- card-body end here-->
                    </div><!-- card end here-->
                </div><!-- col end here-->
            </div><!-- row end here-->
        </div><!-- container end here-->
    </section>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/1.0.0-alpha.2/classic/ckeditor.js"></script>
    <script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
    </script>
    
    	<script>

		$('#buttonPost').click(function(){
			$.post("${pageContext.request.contextPath}/_06_blog/blog.controller",
					{"articlename": $('#articlename').val(), "articletype": $('#articletype').val(),
				"articlecontent": $('#editor').val(), "parvicy": $('#setting1').val(), "parvicy": $('#setting2').val()},function(bean){
// 						if(bean==null){
// 							$('#show').html("<h5 class='modal-title'>註冊失敗</h5>");
// 							console.log("註冊失敗");
// 						}else{
// 							$('#show').html("<h5 class='modal-title'>註冊成功</h5>");
// 							console.log("註冊成功");
// 						}
					})			
		});

	</script>
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>