var URL_API_PROD = 'http://45.55.92.161:8080/medcloud-api/image/new';
var URL_API_DEV = 'http://localhost:8080/api/image/new';

$(document).ready(function(){

	$("#submit").click(function(e){
		e.preventDefault();
		submit();
	});
	
});


function submit(){
	var input = document.getElementById('file');
	var file =  input.files[0];
	var properties = {
		type : $("#type option:selected").val(),
	 	iid : $("#iid").val(),
	 	creation_date : $("#date").val(),
	 	size : $("#size").val(),
		cid : $("#cid").val(),
	  	user_token: $("#token").val()
	};

	var fd = new FormData();
	var blob = new Blob([JSON.stringify(properties)], { type: "application/json" });
	fd.append('properties', blob);
	fd.append('file', file);
	
	$.ajax({
		url: URL_API_PROD,
		method: "POST",
		headers: {
		         "Content-Type": undefined
		  },
		contentType: false,
		data: fd,
		processData: false,
		mimeType: 'multipart/form-data'
	}).done(function(result){
		console.log(result);
		$("#modalTitle").text("Sucesso!");
		$("#modalBody").text("Imagem salva com sucesso!");
		$("#infoForm input").val("");
		$("#resultModal").modal('show');
	});
	
}