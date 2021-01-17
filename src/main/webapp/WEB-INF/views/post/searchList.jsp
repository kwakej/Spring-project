<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>TA_IN 검색결과</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/searchList.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js">
	
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/2409d81413.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="searchList_con">
		<div id="list_big_con">
			<c:if test="${not empty searchResult }">
				<c:forEach var="vo" items="${searchResult }" varStatus="s">
					<div class="eachPost" onclick="location.href='${vo.b_id}'">${vo.hashtag } ${vo.b_img }</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</body>

</html>