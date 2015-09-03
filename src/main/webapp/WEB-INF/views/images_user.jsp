<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<link rel="stylesheet" href='<c:url value="/tools/jstree/themes/default/style.min.css" /> ' />
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/plug-ins/1.10.7/integration/bootstrap/3/dataTables.bootstrap.css">

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
    
    	<input type="hidden" id="treeUrl" value='<c:url value="/images/tree" />' />
    	<div class="css-section">
    		<h1 class="section-title">Imagens</h1>
    			
    		<div class="container">
    			<div class="row well">
    				<h2 class="post-title">Busca</h2>
    				<div role="form" class="form-inline">
	    					<div class="form-group">
	    						<input class="form-control" type="text" id="pid" placeholder="ID Paciente (PID)" />
	    					</div>
	    					<div class="form-group">
	    						<input class="form-control" type="text" id="sid" placeholder="ID Estudo (SID)" />
	    					</div>
	    					<div class="form-group">
	    						<input class="form-control" type="text" id="sno" placeholder="Série (SNO)" />
	    					</div>
	    					<div class="form-group">
	    						<input class="form-control" type="text" id="iid" placeholder="ID Instância (IID)" />
	    					</div>
    					
	    					<div class="form-group">
	    						<input class="form-control date" type="text" id="cd_init" placeholder="Data criação inicio" />
	    					</div>
	    					<div class="form-group">
	    						<input class="form-control date" type="text" id="cd_end" placeholder="Data criação fim" />
	    					</div>
	    					
	    					<div class="form-group">
	    						<select class="form-control" id="modality">
	    							<option value="">Modalidade</option>
	    							<c:forEach items="${modalities}" var="each">
	    								<option value="${each}">${each}</option>
	    							</c:forEach>
	    						</select>
	    					</div>
	    					
	    					<div class="form-group pull-right">
		    					<button id="btn-go" class="btn btn-ar btn-primary">Consultar</button>
	    					</div>
    				</div>
    			</div>
    			<div class="row">
    				<div class="col-md-4 well">
   						<h3 class="section-title">Explorar <small style="font-size: 55%">(PID &#8627; SID &#8627; SNO)</small></h3>
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
				    			</tbody>
				    		</table>
				    		<a href="#" style="display: none" class="btn-social solid foursquare" id="btn-download"><i class="fa fa-download"></i>Baixar Itens</a>
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
    	
    	
		<script type="text/javascript" type="text/javascript" src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.7/integration/bootstrap/3/dataTables.bootstrap.js"></script>
		<script src='<c:url value="/tools/jstree/jstree.js"/>' type="text/javascript" ></script>
		<script src='<c:url value="/tools/jquery.maskedinput.min.js"/>' type="text/javascript" ></script>
		<script src='<c:url value="/tools/jquery.json.min.js"/>' type="text/javascript" ></script>
		<script src='<c:url value="/js/images_user.js"/>' type="text/javascript" ></script>
    </tiles:putAttribute>
</tiles:insertDefinition>