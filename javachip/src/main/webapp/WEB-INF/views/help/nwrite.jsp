<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>글 쓰기</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">Home</a>
                            <a href="#">공지사항</a>
                            <span>글 쓰기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section class="board-box spad">
	    <div class="container">
	    	<div class="write-form">
                <form action="#">
                	<div class="d-flex flex-column bd-highlight mb-3">
					  <div class="p-2 bd-highlight">
					  	<p>제목<p>
						<input type="text" class="form-control" name="nTitle" id="nTitle" aria-label="subject" placeholder="제목을 입력하세요.">
					  </div>
					  <div class="p-2 bd-highlight">
					  	<textarea class="form-control" name="nContents" id="board-textarea" rows="10"></textarea>
					  </div>
					  <div class="p-2 bd-highlight" align="center">
					  	<button type="button" class="btn btn-outline-secondary" style="margin-right:20px;">취소하기</button>
					  	<button type="submit" class="btn btn-dark">작성하기</button>
					  </div>
					</div>
               	</form>
           	</div>
	    </div>
	</section>
<%@ include file="../include/footer.jsp" %>