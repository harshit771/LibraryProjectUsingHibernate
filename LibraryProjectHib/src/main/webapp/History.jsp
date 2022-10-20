<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Menu.jsp"/><br/>
<jsp:useBean id="bean" class="infinite.libraryprojecthib.LibraryDAO" />
<c:set var="user" value="${sessionScope.user }"></c:set>
<table border="3">
  <tr>
    <th>Book Id</th>
    <th>User Name</th>
    <th>Issued on</th>
   
   
  </tr>
  <c:forEach var="b" items="${bean.showTransReturns(user) }">
  <tr>
  	<td><c:out value="${b.bookId }"></c:out></td>
  	<td><c:out value="${b.userName }"></c:out></td>
  	<td><c:out value="${b.fromdate }"></c:out></td>
  	
  </tr>
  </c:forEach>
</table>
</body>
</html>