<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="../include/head.jsp"%>
</head>
<body>
<!-- header-start -->
<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="/se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- header-end -->

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg">
    <h3>게시판</h3>
</div>
<!-- bradcam_area_end -->


  <!-- Content Wrapper. Contains page content -->
<div class="whole_wrap">
     <div class="container">
  		<div class="section-top-border">
			<h2 class="mb-30">게시판</h2>

    <!-- Main content -->
    <section class="content container-fluid">

      <div class="col-lg-12">
    <form role="form" id="writeForm" method="post" action="${path}/article/write">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">게시글 작성</h3>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="title">제목</label>
                    <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
                </div>
                
                    <label for="content">내용</label>
               		<div class="jsx-2303464893 editor"> 
	               		<div class="fr-box fr-basic fr-top" role="application"> 
		               		<div class="fr-wrapper show-placeholder" dir="auto"> 
		               			<textarea name="content" id="content" style="width: 100%; height: 412px;"></textarea> 
	               			</div> 
               			</div> 
               		</div>
                
                <div class="form-group">
                    <label for="writer">작성자</label>
                    <input class="form-control" id="writer" name="writer" value="${login.userId}" readonly>
                </div>
            </div>
            <div class="box-footer">
                <button type="button" class="genric-btn info-border medium listBtn">목록</button>
                <div class="pull-right">
                    <button id="savebutton" type="submit" class="genric-btn info-border medium">저장</button>
                </div>
            </div>
        </div>
    </form>
</div>

    </section>
  </div>
</div>
</div>

<!-- ./wrapper -->
<!-- footer -->
<%@ include file="../include/footer.jsp"%>
<!-- footer end -->



<!-- JS here -->
<%@ include file="../include/hotel_js.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {

		$(".listBtn").on("click", function() {
			self.location = "/article/listSearch"
		});

	});
</script>
<script type="text/javascript">
	var oEditors = []; 
		nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors, 
		elPlaceHolder : "content", //저는 textarea의 id
		sSkinURI : "/se2/SmartEditor2Skin.html", //경로
		fCreator : "createSEditor2", 
		htParams : { 
			bUseToolbar : true, 
			bUseVerticalResizer : false, 
			bUseModeChanger : false 
		} 
	});
    
	$(function(){
		$("#savebutton").click(function(){
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			var title = $("#title").val();
			var content = document.getElementById("content").value;
			
			if (title == null || title == "") { 
				alert("제목을 입력해주세요."); 
				$("#title").focus(); 
				return false; 
			}
			
			if(content == "" || content == null || content == '&nbsp;' 
				|| content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){ 
				alert("내용을 입력해주세요."); 
				oEditors.getById["content"].exec("FOCUS"); 
				return false; 
			} 
			var result = confirm("등록 하시겠습니까?"); 
			if(result){ 
				alert("등록 되었습니다."); 
				$("#writeForm").submit();
				
				}else{ 
					return false; 
				}
		 });
	})
       

</script>
</body>
</html>
