<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/1/3
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //    以斜线开始，不以斜线结束(例如/crud)
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <div id="global">
        <form:form commandName="login" action="${APP_PATH}/login" method="post">
            <fieldset>
                <p>
                    <label for="userName">User name:</label>
                    <form:input id="userName" path="userName"></form:input>
                </p>
                <p>
                    <label for="password">User name:</label>
                    <form:input id="password" path="password"></form:input>
                </p>
                <p id="buttons">
                    <input id="reset" type="reset" tabindex="4">
                    <input id="submit" type="submit" tabindex="5" value="login">
                </p>
            </fieldset>
        </form:form>

    </div>
</body>
</html>
