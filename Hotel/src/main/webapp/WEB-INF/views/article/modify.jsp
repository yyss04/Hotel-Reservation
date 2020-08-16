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
    <!-- header-end -->
    
    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg">
        <h3>방문 후기</h3>
    </div>
    <!-- bradcam_area_end -->

		<!-- Content Wrapper. Contains page content -->
<div class="whole_wrap">
     <div class="container">
  		<div class="section-top-border">
			<h2 class="mb-30">방문 후기</h2>

			<!-- Main content -->
			<section class="content container-fluid">
				<div class="col-lg-12">
					<form role="form" id="writeForm" method="post"
						action="${path}/article/modify">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">게시글 작성</h3>
							</div>
							<div class="box-body">
							    <input type="hidden" name="articleNo" value="${article.articleNo}">
							    <input type="hidden" name="page" value="${searchCriteria.page}">
							    <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
							    <input type="hidden" name="searchType" value="${searchCriteria.searchType}">
							    <input type="hidden" name="keyword" value="${searchCriteria.keyword}">
							    <div class="form-group">
							        <label for="title">제목</label>
							        <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" value="${article.title}">
							    </div>
							    <div class="form-group">
							        <label for="content">내용</label>
							        <textarea class="form-control" id="content" name="content" rows="30"
							                  placeholder="내용을 입력해주세요" style="height: 300px">${article.content}</textarea>
							    </div>
							    <div class="form-group">
							        <label for="writer">작성자</label>
							        <input class="form-control" id="writer" name="writer" value="${login.userId}" readonly>
							    </div>
							</div>
							<div class="box-footer">
								<button type="button" class="genric-btn info-border medium listBtn">
									목록
								</button>
								<div class="pull-right">
									<button type="button" class="genric-btn info-border medium cancelBtn">
										취소
									</button>
									<button type="submit" class="genric-btn info-border medium modBtn">
										수정 저장
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>

			</section>
			<!-- /.content -->
		</div>
</div>
</div>
		


    <!-- footer -->
    <%@ include file="../include/footer.jsp"%>
    <!-- footer end -->


    <!-- JS here -->
    <%@ include file="../include/hotel_js.jsp"%>


<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form[role='form']");
		console.log(formObj);

		$(".modBtn").on("click", function() {
			formObj.submit();
		});

		$(".cancelBtn").on("click", function() {
			history.go(-1);
		});

		$(".listBtn").on("click", function() {
			self.location = "/article/listSearch?page=${searchCriteria.page}"
				+ "&perPageNum=${searchCriteria.perPageNum}"
	            + "&searchType=${searchCriteria.searchType}"
	            + "&keyword=${searchCriteria.keyword}";
		});

	});
</script>
</body>
</html>