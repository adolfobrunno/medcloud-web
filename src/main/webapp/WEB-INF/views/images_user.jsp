<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
    
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
    	<div class="css-section">
    		<h1 class="section-title">Imagens</h1>
    		<table class="table table-hover">
    			<thead>
    				<tr>
	    				<th>IID</th>
	    				<th>Tipo</th>
	    				<th>CID</th>
	    				<th>Data</th>
	    				<th>Tamanho</th>
    				</tr>
    			</thead>
    			<tbody>
    				<c:forEach items="${images}" var="image">
    				<fmt:parseDate value="${image.creation_date}" var="theDate" pattern="yyyyMMdd" />
    					<tr>
    						<td>${image.iid}</td>
    						<td> <span rel="tooltip" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="${image.type.description}">
    						${image.type}</span></td>
    						<td>${image.cid}</td>
    						<td><fmt:formatDate value="${theDate}" pattern="dd/MM/yyyy"/></td>
    						<td>${image.size} KB</td>
    					</tr>
    				</c:forEach>
    			</tbody>
    		</table>
    	</div>
    	
    	<script type="text/javascript">

    	$(document).ready(function(){
    	    $('[data-toggle="tooltip"]').tooltip();   
    	});
    	</script>
    </tiles:putAttribute>
</tiles:insertDefinition>