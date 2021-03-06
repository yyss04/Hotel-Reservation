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
        <h3>공지사항</h3>
    </div>
    <!-- bradcam_area_end -->
    
    <!-- 게시글 영역 -->
    <div class="whole_wrap">
        <div class="container box_1170">
			<div class="section-top-border">
				<h2 class="mb-30">공지사항</h2>
			<div class="box-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th style="width: 30px">NO</th>
							<th>제목</th>
							<th style="width: 100px">작성자</th>
							<th style="width: 150px">작성시간</th>
							<th style="width: 60px">조회</th>
						</tr>
						<c:forEach items="${articles}" var="article">
							<tr>
								<td>${article.articleNo}</td>
								<td>
								  <a href="${path}/article/read${pageMaker.makeSearch(pageMaker.criteria.page)}&articleNo=${article.articleNo}">
								    ${article.title}
								  </a>
								</td>
								<td>${article.writer}</td>
								<td><fmt:formatDate value="${article.regDate}"
										pattern="yyyy-MM-dd a HH:mm" /></td>
								<td><span class="badge bg-red">${article.viewCnt}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="box-footer">
			<div class="text-center">
				<nav class="blog-pagination justify-content-center d-flex">
			        <ul class="pagination">
			        	
			        	<!-- 이전 -->
			            <c:if test="${pageMaker.prev}">
			                <li class="page-item"><a href="${path}/article/listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}"
			                	class="page-link"><i class="ti-angle-left"></i>이전</a></li>
			            </c:if>
			            
			            <!-- 페이징숫자 -->
			            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			                <li class="page-item" <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
			                    <a href="${path}/article/listSearch${pageMaker.makeSearch(idx)}" class="page-link">${idx}</a>
			                </li>
			            </c:forEach>
			            
			            <!-- 다음 -->
			            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			                <li class="page-item"><a href="${path}/article/listSearch?${pageMaker.makeSearch(pageMaker.endPage + 1)}"
			                	class="page-link"><i class="ti-angle-right"></i>다음</a></li>
			            </c:if>
			        </ul>
			      </nav>
			    </div>
			</div>
			
			<div class="box-footer">
			    <div class="form-group col-sm-2">
			        <select class="form-control" name="searchType" id="searchType">
			            <option value="n" <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
			            <option value="title" <c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			            <option value="content" <c:out value="${searchCriteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			            <option value="writer" <c:out value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
			            <option value="title_content" <c:out value="${searchCriteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
			        </select>
			    </div>
			    <div class="form-group col-sm-10">
			        <div class="input-group mb-3">
			            <input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCriteria.keyword}" placeholder="검색어">
			            <span class="col-sm-10">
			                <button type="button" class="genric-btn info" id="searchBtn">
			                    <i class="fa fa-search"></i> 검색
			                </button>
			            </span>
			        </div>
			    </div>
			    <div class="pull-right">
			        <button type="button" class="genric-btn success" id="writeBtn">
			            <i class="fa fa-pencil"></i> 글쓰기
			        </button>
			        
			  
			        
			    </div>
			</div>
		</div>
				
   			
  		 </div>
    </div>
    
    <!-- footer -->
    <%@ include file="../include/footer.jsp"%>
    <!-- footer end -->


    <!-- JS here -->
    <%@ include file="../include/hotel_js.jsp"%>
    

    <script type="text/javascript">
		var result = "${msg}";
		if (result == "regSuccess") {
			alert("게시글 등록이 완료되었습니다.");
		} else if (result == "modSuccess") {
			alert("게시글 수정이 완료되었습니다.");
		} else if (result == "delSuccess") {
			alert("게시글 삭제가 완료되었습니다.");
		}
		
		// 글작성 버튼
		$(document).ready(function() {

			$("#writeBtn").on("click", function(event) {

				self.location = "${path}/article/write";

			})
		});
		
		// 검색 버튼
		$(document).ready(function () {

		    $("#searchBtn").on("click", function (event) {
		        self.location =
		            "/article/listSearch${pageMaker.makeQuery(1)}"
		            + "&searchType=" + $("select option:selected").val()
		            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
		    });
		});
	</script>
</body>
</html>