<jsp:directive.page contentType="text/html; charset=UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Script Tag Example</h1>
<jsp:declaration>
public int max(int i, int j){
	return(i>j)?i:j;
}
</jsp:declaration>
<jsp:scriptlet>
int i=22;
int j=23;
</jsp:scriptlet>
i=<jsp:expression>i</jsp:expression>
j=<jsp:expression>j</jsp:expression> 중에 더 큰 숫자는?
<b><jsp:expression>max(i,j)</jsp:expression></b>
</body>
</html>