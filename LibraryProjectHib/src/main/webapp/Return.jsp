<%@page import="org.hibernate.Transaction"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="infinite.libraryprojecthib.TranBook"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="infinite.libraryprojecthib.SessionHelper"%>
<%@page import="org.hibernate.SessionFactory"%>
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
<form action="Return.jsp">
<table border="3">
  <tr>
    <th>Book Id</th>
    <th>User Name</th>
    <th>Issued on</th>
    
    <th>Select</th>
  </tr>
  <c:forEach var="b" items="${bean.showTranBook(user) }">
  <tr>
    <c:set var="id" value="${b.bookId }" />
  	<td><c:out value="${b.bookId }"></c:out></td>
  	<td><c:out value="${b.userName }"></c:out></td>
  	<td><c:out value="${b.fromDate }"></c:out></td>
  	<td><input type="checkbox" name="bid" value="${b.bookId}"></td>
  </tr>
  </c:forEach>
</table>
<br/>
<input type="submit" value="Return">
</form>
<c:forEach var="book" items="${paramValues.bid }">
<c:set var="id" value="${book }" />
<c:out value="${bean.returnBook(user, id )} "/>
</c:forEach>
</body>
</html>