<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/1/2
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Big Cities</title>
    <style>
        table, tr, td{
            border: 1px solid #aaee77;
            padding: 3px;
        }

    </style>
</head>
<body>
Capitals
<table>
    <tr style="background: #448755; color: white; font-weight: bold">
        <td>Country</td>
        <td>Capital</td>
    </tr>
    <c:forEach items="${requestScope.capitals}" var="mapItem">
        <tr>
            <td>${mapItem.key}</td>
            <td>${mapItem.value}</td>
        </tr>
    </c:forEach>
</table>
Big Cities
<table>
    <tr style="background: #448755; color: white; font-weight: bold">
        <td>Country</td>
        <td>Capital</td>
    </tr>
    <c:forEach items="${requestScope.bigCities}" var="mapItem">
        <tr>
            <td>${mapItem.key}</td>
            <td>
                <c:forEach items="${mapItem.value}" var="city" varStatus="status">
                    ${city}
                    <c:if test="${!status.last}">,</c:if>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
    <%--默认是escape是true，把<转义成&lt; 如果输入<br/>则输出"<br/>"--%>
    <%--否则输出空行--%>
    <c:out value="<br/>" escapeXml="false"></c:out>

</table>
</body>
</html>
