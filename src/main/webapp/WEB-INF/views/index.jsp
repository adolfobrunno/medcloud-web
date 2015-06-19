<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
    	<div>Olá, <c:out value="${pageContext.request.userPrincipal.name}"></c:out></div>
	</tiles:putAttribute>
</tiles:insertDefinition>