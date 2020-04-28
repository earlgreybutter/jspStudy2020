<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	데이터 전송하기
	<br />
	<form method="post" action="receive.jsp">
		name<input type="text" name="name"><br /> 
		age<input type="text" name="age"><br /> 
		address<input type="text" name="address"><br />
		phone<input type="text" name="phone"><br />
		hobby : <br/>
		책보기<input name="hobby" type="checkbox" value="book"><br/>
		영화보기<input name="hobby" type="checkbox" value="movie"><br/>
		음악듣기<input name="hobby" type="checkbox" value="music"><br/>
		
		성별 : <br/>
		여자<input name="gender" type="radio" value="woman"><br/>
		남자<input name="gender" type="radio" value="man"><br/>
		<input type="submit" value="눌러">

	</form>
</body>
</html>