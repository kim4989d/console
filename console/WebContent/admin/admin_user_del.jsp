<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
echo ("<script>location.href='user_list.php';parent.alert(\"����ڸ� ���� �Ҽ������ϴ�. ��缭�񽺸� �����Ͻʽÿ�.\")</script>");
		}
echo ("<script>alert(\"�۾��� ������ �߻��߽��ϴ�.��� �۾��� ����մϴ�.\");history.back()</script>");

		$mysqli->close();
		echo ("<script>");
		echo ("window.parent[\"leftFrame\"].location.reload() ;");
		echo ("location.href ='user_list.php';");
		echo ("</script>")	;
</body>
</html>