<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/25
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page isELIgnored="false" %>
<%
    //    以斜线开始，不以斜线结束(例如/crud)
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>edit book</title>
</head>
<body>
    <div id="global">
        <form:form commandName="book" action="${APP_PATH}/book_update" method="post">
            <fieldset>
                <LEGEND>edit a book</LEGEND>
                <form:hidden path="id"/>
                <p>
                    <label for="category">Category:</label>
                    <form:select id="category" path="category.id"
                                 items="${categories}" itemLabel="name"
                                 itemValue="id">
                    </form:select>
                </p>
                <p>
                    <label for="title">Title:</label>
                    <form:input id="title" path="title"/>
                </p>
                <p>
                    <label for="author">Author:</label>
                    <form:input id="author" path="author"/>
                </p>
                <p>
                    <label for="isbn">Isbn:</label>
                    <form:input id="isbn" path="isbn"/>
                </p>
                <p id="buttons">
                    <input id="reset" type="reset" tabindex="4">
                    <input id="submit" type="submit" tabindex="5" value="update a Book">
                </p>
            </fieldset>
        </form:form>
    </div>
</body>
</html>
