<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/LoveDiary/resources/css/adminPage.css">
<link rel="stylesheet" href="/LoveDiary/resources/css/adminPageBoard.css">
<link rel="stylesheet" href="/LoveDiary/resources/css/adminPageInsert.css">

<script>
	<c:if test="${not empty alertMsg}">
		alert("${alertMsg}");
		<% session.removeAttribute("alertMsg"); %>
	</c:if>
</script>
