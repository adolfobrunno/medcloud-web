<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 		<h1>Hello World! <c:out value="${serverTime}"/></h1>
 	</tiles:putAttribute>
 </tiles:insertDefinition>
