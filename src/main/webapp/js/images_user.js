/**
 * 
 */
$(document).ready(function(){
	createTree();
	
	$(".date").mask("99/99/9999", {placeholder: "dd/mm/yyyy"})
	
	var list = [];
	
	$("#imageList tr").css('cursor', 'pointer');
    
	$("#imageList").delegate('tbody tr', 'click', function() {
    	
    	$(this).toggleClass('success');
    	if($(this).hasClass('success')){
        	list.push($(this).attr('id'))
    	}else{
    		var index = list.indexOf($(this).attr('id'));
    		if(index > -1){
    			list.splice(index, 1)
    		}
    	}
    	if(list.length > 0){
    		$("#btn-download").show();
    	}else{
    		$("#btn-download").hide();
    	}
    });
    
    $("#btn-download").click(function(e){
    	e.preventDefault();
    	var url = $("#ctx").val()+"/images/download/"+list;
    	window.location.href = url;
    });
    
    $("#btn-go").click(function(e){
    	e.preventDefault();
    	var dto = new Object();
    	dto.iid = $("#iid").val();
    	dto.pid = $("#pid").val();
    	dto.sid = $("#sid").val();
    	dto.sno = $("#sno").val();
    	dto.creationDateInit = formatDate($("#cd_init").val());
    	dto.creationDateEnd = formatDate($("#cd_end").val());
    	dto.modality = $("#modality option:selected").val();
    	
    	$.ajax({
    	      type: "POST",
    	      contentType : 'application/json; charset=utf-8',
    	      dataType : 'json',
    	      url: $("#ctx").val()+"/images/filter",
    	      data: JSON.stringify(dto),
    	      success :function(result) {
    	    	  createTable(result);
    	     }
    	  });
    	
    });
});

function createTree(){
	
	var json = new Object();
	
	$.get($("#ctx").val()+"/images/tree", function(data){
		json.core = data;
		$('#tree').jstree(json).on('select_node.jstree', function(e, data){
			var pid = data.node.parents[1] != null ? data.node.parents[1] : '#';
			var sno = data.node.parents[0];
			var sid = data.node.id;
			
			var dto = new Object();
			dto.pid = pid;
			dto.sno = sno;
			dto.sid = sid;
			if(dto.pid !== '#' ){
				$.get($("#ctx").val()+"/images/get/", dto, function(result){
					createTable(result);
				});
			}
		});
	});
}

function createTable(dto){
	
	$("#imageList").DataTable().destroy();
	
	var dataset = new Array();
	var images = dto.properties;
	for ( var i in images) {
		var data = [images[i].iid, images[i].modality, images[i].cid,
		            toDateFormat(images[i].creation_date.iLocalMillis), images[i].size + "KB"];
		dataset.push(data);
	}

	$("#imageList").dataTable({
		"data": dataset,
		"createdRow": function( row, data, dataIndex ) {
		    $(row).attr('id', data[0]);
		},
		"language": {
            "url": "https://cdn.datatables.net/plug-ins/1.10.8/i18n/Portuguese-Brasil.json"
        }
	});
	
	$("#table").show();
	$("#message").hide();
}

function toDateFormat(millis){
	var date = new Date(millis);
	return date.customFormat("#DD#/#MM#/#YYYY#");
}

function formatDate(str){
	
	if(str.length > 0){
		var array = str.split("/");
		var day = array[0];
		var month = array[1];
		var year = array[2];
		
		return year+month+day;
	}
	
}