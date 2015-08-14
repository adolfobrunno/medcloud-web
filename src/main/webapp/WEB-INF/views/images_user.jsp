<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<link rel="stylesheet" href='<c:url value="/tools/jstree/themes/default/style.min.css" /> ' />
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/1.10.7/integration/bootstrap/3/dataTables.bootstrap.css">

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
    
    	<input type="hidden" id="treeUrl" value='<c:url value="/images/tree" />' />
    	<div class="css-section">
    		<h1 class="section-title"><a href='<c:url value="/images/new" />' data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Enviar nova imagem">
    			<i class="fa fa-plus"></i></a> Imagens</h1>
    			
    		<div class="container">
    			<div class="row well">
    				<h2 class="post-title">Busca</h2>
    				<form class="form-inline">
    					<div class="form-group span3">
    						<input class="form-control" type="text" id="" placeholder="Paciente ID" />
    					</div>
    					<div class="form-group span3">
    						<input class="form-control" type="text" id="" placeholder="Estudo ID" />
    					</div>
    					<div class="form-group span3">
    						<input class="form-control" type="text" id="" placeholder="Série ID" />
    					</div>
    					<div class="form-group span3">
    						<input class="form-control" type="text" id="" placeholder="Instância ID" />
    					</div>
    					<div class="form-group">
    						<select class="form-control span3" id="">
    							<option value="">Modalidade</option>
    							<c:forEach items="${modalities}" var="each">
    								<option value="${each}">${each}</option>
    							</c:forEach>
    						</select>
    					</div>
    					<button class="btn btn-primary pull-right">Consultar</button>
    				</form>
    			</div>
    			<div class="row">
    				<div class="col-md-4">
    					<div id="tree"></div>
    				</div>
    				<div class="col-md-8">
    					<div id="message">Nenhum item selecionado</div>
    					<div id="table" style="display: none">
    						<table class="table table-hover" id="imageList">
				    			<thead>
				    				<tr>
					    				<th>IID</th>
					    				<th>Modalidade</th>
					    				<th>CID</th>
					    				<th>Data</th>
					    				<th>Tamanho</th>
				    				</tr>
				    			</thead>
				    			<tbody>
<!-- 				    				<tr> -->
<!-- 				    					<td id="iid"></td> -->
<!-- 				    					<td id="modality"></td> -->
<!-- 				    					<td id="cid"></td> -->
<!-- 				    					<td id="date"></td> -->
<!-- 				    					<td id="size"></td> -->
<!-- 				    				</tr> -->
				    			</tbody>
				    		</table>
	    					<input type="hidden" id="imagePath"/>
    					</div>
    				</div>
    			</div>
    		</div>	
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
    	
    	<script type="text/javascript" type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" type="text/javascript" src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.7/integration/bootstrap/3/dataTables.bootstrap.js"></script>
		<script src='<c:url value="/tools/jstree/jstree.js"/>' type="text/javascript" ></script>
		<script src='<c:url value="/tools/jquery.json.min.js"/>' type="text/javascript" ></script>
		<script src='<c:url value="/js/images_user.js"/>' type="text/javascript" ></script>
    	<script type="text/javascript">

    	$(document).ready(function(){
    	    $('[data-toggle="tooltip"]').tooltip();   
    	});
    	</script>
    </tiles:putAttribute>
</tiles:insertDefinition>