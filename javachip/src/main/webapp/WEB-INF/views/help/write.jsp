<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>글 쓰기</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">Home</a>
                            <a href="#">고객센터</a>
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
						<p>구분<p>
	                    <select class="board-type">
		                    <option value="qna">Q&amp;A</option>
		                    <option value="notice">공지사항</option>
	                    </select>
					  </div>
					  <div class="p-2 bd-highlight">
					  	<p>제목<p>
						<input type="text" class="form-control" aria-label="subject" placeholder="제목을 입력하세요.">
					  </div>
					  <div class="p-2 bd-highlight">
					  	<textarea class="form-control" id="board-textarea" rows="10"></textarea>
					  </div>
					  <div class="p-2 bd-highlight">
						  <div class="input-group mb-1">
							  <div class="custom-file">
							    <input type="file" class="custom-file-input" id="inputGroupFile02">
							    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Choose file</label>
							  </div>
						  </div>
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