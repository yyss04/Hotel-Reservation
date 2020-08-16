<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<%@ include file="../include/head.jsp"%>
</head>

<c:url var="saveReplyURL" value="/restArticle/saveReply">
</c:url>
<c:url var="updateReplyURL" value="/restArticle/updateReply">
</c:url>
<c:url var="deleteReplyURL" value="/restArticle/deleteReply">
</c:url>
<body>

  <!-- header-start -->
    <%@ include file="../include/header.jsp"%>
    <!-- header-end -->
    
    <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg">
        <h3>방문 후기</h3>
    </div>
    <!-- bradcam_area_end -->

			<!-- Content Header (Page header) -->
 <div class="whole_wrap">
     <div class="container">
  		<div class="section-top-border">
			<h2 class="mb-30">방문 후기</h2>
			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					
						<%--게시글 제목 영역--%>
							<h2>${article.title}</h2>
							<div class="bg-white rounded">
								<div class="board_info_box" style="margin-top : 20px">
									<span class="username"> <a href="#">${article.writer}</a></span>
									<span class="description"><fmt:formatDate
										pattern="yyyy-MM-dd a HH:mm" value="${article.regDate}" /></span>
								</div>
								<div style="margin-top : 20px"></div>
								<div class="board_content shadow-sm" style="height: 300px">
			                        ${fn:replace(fn:replace(fn:escapeXml(article.content), newLine, "<br/>") , " ", "&nbsp;")}
								</div>
							</div>
							<div style="margin-top : 20px">
							
								<%--버튼 영역--%>
								<input type="hidden" name="articleNo" value="${article.articleNo}"> 
								<input type="hidden" name="page" value="${searchCriteria.page}"> 
								<input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}"> 
								<input type="hidden" name="searchType" value="${searchCriteria.searchType}"> 
								<input type="hidden" name="keyword" value="${searchCriteria.keyword}">
								<button type="submit" class="genric-btn info-border medium listBtn">목록</button>
								<c:if test="${login.userId == article.writer}">
							        <div class="pull-right">
							       		 <input type="button" class="genric-btn info-border medium" value="수정" onclick="location.href='modify?articleNo=${article.articleNo }'">
							       		 <input type="button" class="genric-btn info-border medium" value="삭제" onclick="del(${article.articleNo})">
							        </div>
							    </c:if>
							
						
							</div>
							
						<%--댓글 등록 영역--%>
						<!-- Reply Form {s} -->
							<div style="margin-top : 20px">
								 <c:if test="${not empty login}">
									<div class="box-body">
										<form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post">
											<form:hidden path="articleNo" id="articleNo" />
											
											<div class="row">
												<div class="col-sm-10">
													<form:textarea path="content" id="content"
														class="form-control input-sm" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>
												</div>
												<div class="col-sm-2">
													<form:input path="reg_id" class="form-control input-sm" id="reg_id"
	 													value="${login.userId}" readonly="true"></form:input>
													<button type="button" class="btn-sm genric-btn default"
														id="btnReplySave" style="width: 100%; margin-top: 10px"><i class="fa fa-save"></i>
														저 장
													</button>
												</div>
											</div>
										</form:form>
									</div>
								</c:if>
								<c:if test="${empty login}">
						            <a href="${path}/user/login" class="btn btn-default btn-block" role="button">
						                <i class="fa fa-edit"></i> 로그인 한 사용자만 댓글 등록이 가능합니다.
						            </a>
						        </c:if>
							</div>
						</div>	
						<!-- Reply Form {e} -->
				</section>

						<!-- Reply List {s}-->
							<div class="my-3 p-3 bg-white rounded" style="padding-top: 10px">
								<div style="margin-top : 20px">
									<h4 class="border-bottom pb-2 mb-0">댓글 목록</h4>
								</div>	
									<div id="replyList" style="margin-top : 20px"></div>
							</div>
						<!-- Reply List {e}-->
			
			

		</div>	
	</div>				
</div>				
				

    <!-- footer -->
    <%@ include file="../include/footer.jsp"%>
    <!-- footer end -->




    <!-- JS here -->
    <%@ include file="../include/hotel_js.jsp"%>



<script type="text/javascript">




$(document).ready(
		function() {

	var formObj = $("form[role='form']");
	console.log(formObj);

	$(".delBtn").on("click", function() {
		formObj.attr("action", "/article/remove");
		formObj.submit();
	});

	$(".listBtn")
		.on(
			"click", function() {
			self.location = "/article/listSearch?page=${searchCriteria.page}"
								+ "&perPageNum=${searchCriteria.perPageNum}"
								+ "&searchType=${searchCriteria.searchType}"
								+ "&keyword=${searchCriteria.keyword}";
	});
	
});

// 글삭제 알람
function del(articleNo){
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='remove?articleNo='+articleNo;
	}
}



$(document).ready(function(){
	var showReplyList = function (replyArr, target, templateObject) {
		var replyTemplate = Handlebars.compile(templateObject.html());
        var html = replyTemplate(replyArr);
        $(".replyDiv").remove();
        target.html(html);
	}
});


$(document).ready(function(){
	showReplyList();
});


// 댓글 리스트 조회
function showReplyList(){
		var url = "${pageContext.request.contextPath}/restArticle/getReplyList";
		var paramData = {"articleNo" : "${article.articleNo}"};
		var isWriter = "${login.userId}";
		console.log("reg_id : "+this.reg_id);
		console.log("userId : "+'${login.userId}');
		
		
		$.ajax({
            type: 'POST',
            url: url,
            data: paramData,
            dataType: 'json',
            success: function(result) {
               	var htmls = "";
            
            // 댓글 없을때
			if(result.length < 1){
				htmls += '등록된 댓글이 없습니다.';
				
			} else {	
	                    $(result).each(function(){
	                    	htmls += '<div class="post" id="rid' + this.rid + '">';
	                    	htmls += '<div class="user-block">';
	                    	htmls += '<span class="username">';
	                    	htmls += '<a href="#">' + this.reg_id + '</a>';
	                    	
		                   	if(isWriter === this.reg_id){
		                    	htmls += '<a href="javascript:void(0)" class="pull-right btn-box-tool replyDelBtn" onclick="fn_deleteReply(' 
			                    		+ this.rid + 
			                    		')" ><i class="fa fa-times">삭제</i></a>';
		                    	htmls += '<a href="javascript:void(0)" class="pull-right btn-box-tool replyModBtn" onclick="fn_editReply(' 
		                    			+ this.rid + ', \'' + this.reg_id + '\', \'' + this.content 
		                    			+ '\' )" style="padding-right:10px"><i class="fa fa-edit">수정</i></a>';
		                   	}
	                    	
	                    	htmls += '</span>';
	                    	htmls += '</div>';
	                    	htmls += '<div class="oldReplytext">' + this.content + '</div>';
	                    	htmls += '<br/>';
	                    	htmls += '</div>';
	                });	//each end
			}
			$("#replyList").html(htmls);
            
            }	   // Ajax success end
		});	// Ajax end

	}


// 댓글 저장 버튼
$(document).on('click', '#btnReplySave', function(){
		var replyContent = $('#content').val();
		var replyReg_id = $('#reg_id').val();
		var paramData = JSON.stringify({
				"content": replyContent
				, "reg_id": replyReg_id
				, "articleNo":'${article.articleNo}'
		});

		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/restArticle/saveReply"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
				
				$('#content').val('');
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	});


// 댓글 수정 폼화면
function fn_editReply(rid, reg_id, content){
		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="rid' + rid + '">';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + reg_id + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rid + ', \'' + reg_id + '\')" style="padding-right:5px">수정</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';	
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += content;
		htmls += '</textarea>';
	

		htmls += '</p>';
		htmls += '</div>';
		
		$('#rid' + rid).replaceWith(htmls);
		$('#rid' + rid + ' #editContent').focus();
	}


// 댓글 수정
function fn_updateReply(rid, reg_id){
		var replyEditContent = $('#editContent').val();
		var paramData = JSON.stringify({"content": replyEditContent
				, "rid": rid
		});

		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
	
		$.ajax({
			url: "${updateReplyURL}"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
                                console.log(result);
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
	
// 댓글 삭제
function fn_deleteReply(rid){
		var paramData = {"rid": rid};
		
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				url: "${deleteReplyURL}"
				, data : paramData
				, type : 'POST'
				, dataType : 'text'
				, success: function(result){
					
					showReplyList();
				}
				, error: function(error){
					console.log("에러 : " + error);
				}
			});
		}
		
		
		
	}

</script>

</body>
</html>