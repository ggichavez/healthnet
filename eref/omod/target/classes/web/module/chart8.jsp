<%@ include file="/WEB-INF/template/include.jsp"%>

<%@ include file="/WEB-INF/template/header.jsp"%>

<html>
<head> FORM</head>
<body>
 <form name="input" action="http://localhost:8080/openmrs-standalone/moduleServlet/eref/viewServlet" method="get">
Enter Treatment:<input type="text" name= "msg">
<input type="Submit" value="Submit" name="b">

</body>
</html>

<%@ include file="/WEB-INF/template/footer.jsp"%>