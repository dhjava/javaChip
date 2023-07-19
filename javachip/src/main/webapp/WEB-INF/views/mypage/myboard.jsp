<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%@ include file="./include/nav.jsp" %>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>내 작성글</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <a href="#">마이페이지</a>
                            <span>내 작성글</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- QnA -->
	<section class="board-box spad">
	    <div class="container">
	    	<h4>나의 QnA</h4><br>
		    <table class ="table table-hover">
		        <tr>
		            <td scope="col" style="width:8%">번호</td>
		            <td scope="col" style="width:54%">제목</td>
		            <td scope="col" style="width:15%">이름</td>
		            <td scope="col" style="width:15%">날짜</td>
		            <td scope="col" style="width:8%">조회수</td>
		        </tr>
		        <tr>	
		            <td scope="row">5</td>
		            <td><a href="help-qview.jsp">이거 어떻게 하나요?</td>
		            <td>김매똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">4</td>
		            <td><a href="help-qview.jsp">이거 어떻게 하나요?</td>
		            <td>김왕똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">3</td>
		            <td><a href="help-qview.jsp">이거 어떻게 하나요?</td>
		            <td>김설사</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">2</td>
		            <td><a href="help-qview.jsp">이거 어떻게 하나요?</td>
		            <td>김새똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">1</td>
		            <td><a href="help-qview.jsp">이거 어떻게 하나요?</td>
		            <td>김킹똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		    </table>
		    <div style="text-align:center;">
		        <button>작성한 QnA 더보기</button>
		    </div><br>
	    </div>
	</section>
	<!-- 후기 -->
	<section class="board-box spad">
	    <div class="container">
	    	<h4>나의 후기</h4><br>
		    <table class ="table table-hover">
		        <tr>
		            <td scope="col" style="width:8%">번호</td>
		            <td scope="col" style="width:54%">제목</td>
		            <td scope="col" style="width:15%">이름</td>
		            <td scope="col" style="width:15%">날짜</td>
		            <td scope="col" style="width:8%">조회수</td>
		        </tr>
		        <tr>	
		            <td scope="row">5</td>
		            <td><a href="shop-details.jsp">이거 어떻게 하나요?</td>
		            <td>김매똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">4</td>
		            <td><a href="shop-details.jsp">이거 어떻게 하나요?</td>
		            <td>김왕똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">3</td>
		            <td><a href="shop-details.jsp">이거 어떻게 하나요?</td>
		            <td>김설사</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">2</td>
		            <td><a href="shop-details.jsp">이거 어떻게 하나요?</td>
		            <td>김새똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		        <tr>
		            <td scope="row">1</td>
		            <td><a href="shop-details.jsp">이거 어떻게 하나요?</td>
		            <td>김킹똥</td>
		            <td>2023.07.11</td>
		            <td>1</td>
		        </tr>
		    </table>
		    <div style="text-align:center;">
		        <button>작성한 후기 더보기</button>
		    </div><br>
	    </div>
	</section>
<%@ include file="./include/footer.jsp" %>