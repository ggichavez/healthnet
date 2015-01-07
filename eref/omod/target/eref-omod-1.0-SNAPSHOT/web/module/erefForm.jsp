<%@ include file="/WEB-INF/template/include.jsp"%>

<%@ include file="/WEB-INF/template/header.jsp"%>

<h2><spring:message code="eref.title" /></h2>

<script language="javascript" type="text/javascript" >

function jumpto(){




document.getElementById("iframeId").src = document.form1.jumpmenu.value

return true

}


</script>
<form name="form1">
<select name ="epidemictype">
<option>Select Epidemic</option>
<option>Malaria</option>
<option>Dengue</option>
<option>Influenza</option>
<option>Cholera</option>

</select>
<select name="jumpmenu" onChange="jumpto(document.form1.jumpmenu.options[document.form1.jumpmenu.options.selectedIndex].value)">
<option value="${pageContext.request.contextPath}/module/eref/chart0Link.form">Select category</option>
<option value="${pageContext.request.contextPath}/module/eref/chart1Link.form">Time Line</option>
<option value="${pageContext.request.contextPath}/module/eref/chart2Link.form">Geographical distribution</option>
<option value="${pageContext.request.contextPath}/module/eref/chart3Link.form">Age group distribution</option>
<option value="${pageContext.request.contextPath}/module/eref/chart4Link.form">Clinical findings</option>
</select>

</form>
<iframe id ="iframeId"src="http://localhost:8080/openmrs-standalone/module/eref/chart0Link.form" width="100%" height="400">
  <p>Your browser does not support iframes.</p>
</iframe>


<%@ include file="/WEB-INF/template/footer.jsp"%>
