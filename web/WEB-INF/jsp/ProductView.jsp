<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/12/21
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>save</title>
</head>
<body>
    <div id="global">
        <h4>the product has been saved</h4>
        <p>
            <h5>${message}</h5>
            name:${product.name}<br/>
            des:${product.description}<br/>
            price:${product.price}
        </p>
        <ol>
            <c:forEach items="${product.images}" var="image">
                <li>${image.originalFilename}</li>
                <img width="100" src="<c:url value="/image/"/>${image.originalFilename}" />
            </c:forEach>
        </ol>
    </div>
</body>
</html>
