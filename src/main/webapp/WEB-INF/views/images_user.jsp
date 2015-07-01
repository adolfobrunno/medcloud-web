<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src='<c:url value="/js/images_user.js"/>' type="text/javascript" ></script>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
    
    
    	<div class="css-section">
    		<h1 class="section-title"><a href='<c:url value="/images/new" />' data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Enviar nova imagem">
    			<i class="fa fa-plus"></i></a> Imagens</h1>
    		<table class="table table-hover" id="imageList">
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
    				<c:forEach items="${images}" var="image" varStatus="step">
    					<fmt:parseDate value="${image.creation_date}" var="theDate" pattern="yyyyMMdd" />
    					<tr rel="image-${step.index}">
    						<td>${image.iid}</td>
    						<td> <span data-toggle="tooltip" data-placement="bottom" title="" data-original-title="${image.type.description}">
    						${image.type}</span></td>
    						<td>${image.cid}</td>
    						<td><fmt:formatDate value="${theDate}" pattern="dd/MM/yyyy"/></td>
    						<td>${image.size} KB</td>
    					</tr>
    					<input type="hidden" value="${image.absolutPath}" id="image-${step.index}"/>
    				</c:forEach>
    			</tbody>
    		</table>
    	</div>
    	
    	<div class="modal fade" id="imageModal" role="dialog" aria-labelledby="" aria-hidden="true" style="display: none">
    		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body no-padding">
						<a href="#" class="thumbnail thumbnail-round">
							<img alt="Image" src="" id="imageSrc" />
						</a>
					</div>
				</div>    		
    		</div>
    	</div>
    	
    	<script type="text/javascript">

    	$(document).ready(function(){
    	    $('[data-toggle="tooltip"]').tooltip();   
    	});
    	</script>
    </tiles:putAttribute>
</tiles:insertDefinition>