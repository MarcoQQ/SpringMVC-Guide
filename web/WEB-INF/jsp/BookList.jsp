<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/25
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    //    以斜线开始，不以斜线结束(例如/crud)
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>booklist</title>
</head>
<body>
    <div id="global">
        <h1>Book List</h1>
        <%--<c:url value="/book_input" />--%>
        <a href="${APP_PATH}/book_input">add book</a>
        <table>
            <tr>
                <th>Category</th>
                <th>Title</th>
                <th>ISBN</th>
                <th>Author</th>
                <th>&nbsp;</th>>
            </tr>


            <c:forEach items="${books}" var="book">
            <tr>
                <td>${book.category.name}</td>
                <td>${book.title}</td>
                <td>${book.isbn}</td>
                <td>${book.author}</td>
                <td><a href="${APP_PATH}/book_edit/${book.id}">Edit</a></td>
            </tr>
            </c:forEach>
        </table>
        <br/>
        <table>
            <tr style="background: #ababff">
                <th>Category</th>
                <th>Title</th>
                <th>ISBN</th>
                <th>Author</th>
            </tr>
            <c:forEach items="${books}" var="book" varStatus="status">
                <c:if test="${status.count % 2 == 0}">
                    <tr style="background: #eeeeff">
                </c:if>
                <c:if test="${status.count % 2 == 0}">
                    <tr style="background: #eeeeff">
                </c:if>
                <td>${book.category.name}</td>
                <td>${book.title}</td>
                <td>${book.isbn}</td>
                <td>${book.author}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
</body>
</html>
