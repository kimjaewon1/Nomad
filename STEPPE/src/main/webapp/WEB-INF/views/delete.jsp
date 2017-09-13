<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Steppe</title>
</head>
<body>
	<form action="deleteMemberMake" id="deleteMemberForm" name="deleteMemberForm" method="post" onsubmit="return check()">
		${m_id}
		<input type="hidden" value='${m_id}' id="m_id" name="m_id"/>
		<br/>
		<br/>
		<input type="password" id="password" name="password"/>
		<br/>
		${Check}
		<br/>
		<input type="submit" id="submit" value="회원 탈퇴"/>
	</form>
</body>
</html>