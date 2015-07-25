/**
 * 
 */
$(document).ready(function(){
	
	$("#imageList tr").css("cursor", "pointer");
	
    $("#imageList").delegate('tr', 'click', function() {
    	var path = $("#imagePath").val();
    	var image = new Image();
    	image.src = "data:image/png;base64,"+path;
    	$("#imageSrc").attr('src', image.src);
    	$("#imageModal").modal('show');
    });
    
    createTree();
    
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

function createTable(image){
	
	$("#iid").text(image.properties.iid);
	$("#modality").text(image.properties.modality);
	$("#cid").text(image.properties.cid);
	$("#size").text(image.properties.size + "KB");
	$("#date").text(toDateFormat(image.properties.creation_date));
	$("#imagePath").val(image.file64);
	
	$("#table").show();
	$("#message").hide();
}

function toDateFormat(string){
	
	// 20151202
	var y = string.substring(0, 4);
	var m = string.substring(4, 6);
	var d = string.substring(6);
	
	return d+'/'+m+'/'+y;
	
}