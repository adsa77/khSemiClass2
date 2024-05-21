<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header id="header">
	<div>빈칸</div>
	<div>로고</div>
	<div>
		<c:if test="${sessionScope.loginAdminVo.nick != null}">
			${sessionScope.loginAdminVo.nick}
			<br>
			<button onclick="location.href = '/LoveDiary/admin/adminLogout'">로그아웃</button>
		</c:if>
		<c:if test="${sessionScope.loginAdminVo.nick == null}">

			로그인이 필요합니다.

		</c:if>
	</div>
</header>