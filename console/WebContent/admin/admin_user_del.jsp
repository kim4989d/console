<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
echo ("<script>location.href='user_list.php';parent.alert(\"사용자를 삭제 할수없습니다. 담당서비스를 삭제하십시요.\")</script>");
		}
echo ("<script>alert(\"작업중 에러가 발생했습니다.모든 작업을 취소합니다.\");history.back()</script>");

		$mysqli->close();
		echo ("<script>");
		echo ("window.parent[\"leftFrame\"].location.reload() ;");
		echo ("location.href ='user_list.php';");
		echo ("</script>")	;
</body>
</html>