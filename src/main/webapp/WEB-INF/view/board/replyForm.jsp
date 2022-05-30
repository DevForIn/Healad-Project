<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 쓰기</title>
</head>
<body>
<hr>
	<div class="container">
	<form name="f" action="reply"   method="post">
	<%-- 원글의 정보
	
	   1. 파라미터 값을 Board 객체에 저장하기 
	       원글정보 : num, grp, grplevel, grpstep
	       답글정보 : writer, pass, subject, content => 등록정보
	   2. 같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가 하기.
	      void BoardDao.grpStepAdd(grp,grpstep)
	   3. Board 객체를 db에 insert 하기.
	      num : maxnum + 1
	      grp : 원글과 동일.
	      grplevel: 원글 + 1
	      grpstep : 원글 + 1
	   4. 등록 성공시 :"답변등록 완료"메시지 출력 후,  list로 페이지 이동
	         등록 실패시:"답변등록시 오류발생"메시지 출력 후, replyForm로 페이지 이동하기 

	 --%>
	<input type="hidden"   name="num" value="${b.num }">
	<input type="hidden"   name="grp" value="${b.grp }">
	<input type="hidden"   name="grplevel" value="${b.grplevel }">
	<input type="hidden"   name="grpstep" value="${b.grpstep }">
		<h2 id="center">게시판 답글 </h2>
		<div class="form-group">
			<label >작성자:</label> 
			<input type="text" class="form-control"  name="writer"> 
			<label >비밀번호:</label> 
			<input type="password" class="form-control" name="pass">
			 <label	>제목:</label> 
			 <input type="text" class="form-control" name="subject"  value="re:${b.subject }"> 
		</div>
		<div class="form-group">
		<label	>내용</label> 
		<textarea class="form-control"  rows="10" cols="50"  name="content"></textarea>
		</div>
		<div id="center" style="padding: 3px;">
			<button type="submit" class="btn btn-dark">입 력</button>
		</div>
		</form>
	</div>
</body>
</html>