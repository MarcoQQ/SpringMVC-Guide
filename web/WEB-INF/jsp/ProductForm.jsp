<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/21
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
    //    以斜线开始，不以斜线结束(例如/crud)
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>add form</title>
</head>
<body>
    <div id="global">
        current locale : ${pageContext.response.locale}
        </br>
        accept-language : ${header["accept-language"]}
        <c:if test="${errors != null}">
            <p id="errors">
            Error(s)
            <ul>
            <c:forEach var="error" items="${errors}">
                <li>${error}</li>
            </c:forEach>
            </ul>
            </p>
        </c:if>
        <form action="${APP_PATH}/product_save" method="post" enctype="multipart/form-data">
            <p>
                <label for="name">Product Name:</label>
                <input type="text" id="name" name="name" tabindex="1">
            </p>
            <p>
                <label for="description" >description:</label>
                <input type="text" id="description" name="description" tabindex="2">
            </p>
            <p>
                <label for="price">price:</label>
                <input type="text" id="price" name="price" tabindex="3">
            </p>
            <p>
                <label for="image">Product Image:</label>
                <input id="image" type="file" name="images[0]">
            </p>
            <p id="buttons">
                <input id="reset" type="reset" tabindex="4">
                <input id="submit" type="submit" tabindex="5" value="add">
            </p>
        </form>
    </div>
</body>
</html>
