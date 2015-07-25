<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">

		<div class="css-section">
    		<h1 class="section-title">Salvar Imagem</h1>
    		<div class="panel panel-primary">
    			<div class="panel-heading">Informações</div>
    			<div class="panel-body row">
    				<form action="#" role="form" id="infoForm">
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="iid">Iid</label>
	    						<input type="text" id="iid" class="form-control" />
	    					</div>
	    					<div class="form-group">
	    						<label for="date">Data</label>
	    						<input type="text" id="date" class="form-control" placeholder="Ex: 20151231"/>
	    					</div>
	    					<div class="form-group">
	    						<label for="file">Arquivo</label>
	    						<input type="file" id="file"  />
	    					</div>
	    				</div>
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="cid">CID</label>
	    						<input type="text" id="cid" class="form-control" />
	    					</div>
	    					<div class="form-group">
	    						<label for="type">Tipo</label>
	    						<select id="type" class="form-control">
	    							<c:forEach var="each" items="${types}">
	    								<option value="${each}">${each} - ${each.description}</option>
	    							</c:forEach>
	    						</select>
	    					</div>
	    					<div class="form-group">
	    						<label for="size">Tamanho</label>
	    						<input type="text" id="size" class="form-control" />
	    					</div>
	    				</div>
	    				<button class="btn btn-success btn-block" id="submit">Fazer upload</button>
	    				<input type="hidden" id="token" value="${userToken}" />
    				</form>
    			</div>
    		</div>
    			
 		</div>
 		<div class="modal fade" id="resultModal" role="dialog" aria-labelledby="modalTitle" aria-hidden="true" style="display: none">
    		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-heading" id="modalTitle"></div>
					<div class="modal-body no-padding" id="modalBody">
					</div>
				</div>    		
    		</div>
    	</div>
 		
 		
		<script src='<c:url value="/js/new_image_form.js" />' type="text/javascript" ></script>

    </tiles:putAttribute>
</tiles:insertDefinition>