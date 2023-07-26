<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="<%= request.getContextPath() %>/resources/img/breadcrumb.jpg">
		<div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Q&A</h2>
                        <div class="breadcrumb__option">
                            <a href="<%= request.getContextPath() %>/">Home</a>
                            <a href="#">고객센터</a>
                            <span>Q&A</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section class="board-box spad">
	    <div class="container">
	    	<div class="board-wButton" style="margin-bottom:20px;">
		    	<button type="button" class="btn btn-outline-secondary" style="margin-right:20px;" onclick="location.href='<%= request.getContextPath() %>/help/qnaWrite.do'">글 쓰기</button>
		    </div>
		    <table class ="table table-hover">
		        <tr>
		            <td scope="col" style="width:8%">번호</td>
		            <td scope="col" style="width:54%">제목</td>
		            <td scope="col" style="width:15%">이름</td>
		            <td scope="col" style="width:15%">날짜</td>
		            <td scope="col" style="width:8%">조회수</td>
		        </tr>
		        <tr>
		            <td scope="row">10</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김개똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">9</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김소똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">8</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김말똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">7</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김범똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">6</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김닭똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">5</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김매똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">4</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김왕똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">3</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김설사</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">2</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김새똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">1</td>
		            <td><a href="qnaView.do">이거 어떻게 하나요?</a></td>
		            <td>김킹똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		    </table>
	    <div style="text-align:center;">
	        ◀ 1 2 3 4 5 6 7 8 9 10 ▶
	    </div><br>
	    <div class="board-search" style="width:40%; margin:0 auto;">
		    <form class="d-flex justify-content-center">
 		        <div class="input-group mb-4">
		          <select>
		            <option value="title">제목</option>
		            <option value="content">내용</option>
		            <option value="tnc">제목+내용</option>
		            <option value="writer">작성자</option>
		          </select>
				  <input type="text" class="form-control" placeholder="내용을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
				  <div class="input-group-append">
				  <button type="submit" class="btn btn-secondary mb-4">검색하기</button>
				  </div>
				</div>
		    </form>
	    </div>
	    </div>
	</section>
<%@ include file="../include/footer.jsp" %>