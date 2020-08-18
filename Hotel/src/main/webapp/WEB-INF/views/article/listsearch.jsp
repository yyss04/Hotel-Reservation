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
    
    <!-- 게시글 영역 -->
    <div class="whole_wrap">
        <div class="container box_1170">
			<div class="section-top-border">
				<h2 class="mb-30">방문 후기</h2>
				<div class="form-group row pull-right">
			    <div class="w100" style="padding-right:10px">
			        <select class="form-control" name="searchType" id="searchType">
			            <option value="n" <c:out value="${searchCriteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
			            <option value="title" <c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			            <option value="content" <c:out value="${searchCriteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			            <option value="writer" <c:out value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
			            <option value="title_content" <c:out value="${searchCriteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
			        </select>
			    </div>
			    <div class="w1000" style="padding-right:10px">
			       <input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCriteria.keyword}" placeholder="검색어">
			    </div>
			    <div>
		           <button type="button" class="genric-btn info-border medium" id="searchBtn">
		            <i class="fa fa-search"></i> 검색
		           </button>
				</div>
			</div>	
			<div class="box-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th style="width: 30px">NO</th>
							<th>제목</th>
							<th style="width: 100px">작성자</th>
							<th style="width: 150px">작성일</th>
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
										pattern="yyyy-MM-dd" /></td>
								<td><span class="badge bg-red">${article.viewCnt}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="genric-btn info-border medium pull-right" id="writeBtn">
			            글쓰기
			    </button>
			</div>
			
			
			<div class="text-center">
				<nav class="blog-pagination justify-content-center d-flex">
			        <ul class="pagination">
			        	
			        	<!-- 이전 -->
			             <c:if test="${pageMaker.prev}">
                             <li>
                                 <a href="${path}/article/listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
                             </li>
                         </c:if>
			            <!-- 페이징숫자 -->
			            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                            <li <c:out value="${pageMaker.criteria.page == idx? 'class=active':''}"/>>
                                <a href="${path}/article/listSearch${pageMaker.makeSearch(idx)}">${idx}</a>
                            </li>
                        </c:forEach>
			            <!-- 다음 -->
			             <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                             <li>
                                 <a href="${path}/article/listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
                             </li>
                         </c:if>
                         
			        </ul>
			      </nav>
			    </div>


			</div>
			
  		 </div>
    </div>
    
    <!-- footer -->
    <%@ include file="../include/footer.jsp"%>
    <!-- footer end -->


  <!-- form itself end-->
    <%@ include file="../include/form_itself.jsp"%>    
    <!-- form itself end -->


    <!-- JS here -->
    <%@ include file="../include/hotel_js.jsp"%>
    

    <script type="text/javascript">
		var result = "${msg}";
		if (result == "regSuccess") {
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