<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MedSave</title>
    
    <link rel="shortcut icon" href="img/favicon.png">
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
    <!-- Template CSS -->
    <link href='<c:url value="/tools/template/assets/css/preload.css"/>' rel="stylesheet" media="screen" />
    <link href='<c:url value="/tools/template/assets/css/bootstrap.min.css"/>' rel="stylesheet" media="screen"/>
    <link href='<c:url value="/tools/template/assets/css/yamm.css"/>' rel="stylesheet" media="screen"/>
    <link href='<c:url value="/tools/template/assets/css/bootstrap-switch.min.css"/>' rel="stylesheet" media="screen"/>
    <link href='<c:url value="/tools/template/assets/css/font-awesome.min.css"/>' rel="stylesheet" media="screen"/>
    <link href='<c:url value="/tools/template/assets/css/animate.min.css"/>' rel="stylesheet" media="screen"/>
    <link href='<c:url value="/tools/template/assets/css/slidebars.css"/>' rel="stylesheet" media="screen"/>
    <link href='<c:url value="/tools/template/assets/css/lightbox.css"/>' rel="stylesheet" media="screen"/>
    <link href='<c:url value="/tools/template/assets/css/jquery.bxslider.css"/>' rel="stylesheet" media="screen"/>
    <link href='<c:url value="/tools/template/assets/css/syntaxhighlighter/shCore.css"/>' rel="stylesheet" media="screen"/>

    <link href='<c:url value="/tools/template/assets/css/style-green.css"/>' rel="stylesheet" media="screen"/>
	<link href='<c:url value="/tools/template/assets/css/width-full.css"/>' rel="stylesheet" media="screen"/>
    <link href='<c:url value="/tools/template/assets/css/buttons.css"/>' rel="stylesheet" media="screen"/>
    <!-- End template CSS imports -->
    
    
    <link href="<c:url value='/css/geral.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='/css/app.css'/>" rel="stylesheet" type="text/css">
    
    
    <script src="<c:url value="/tools/template/assets/js/jquery.min.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/jquery.cookie.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/bootstrap-switch.min.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/wow.min.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/slidebars.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/jquery.bxslider.min.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/holder.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/buttons.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/styleswitcher.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/jquery.mixitup.min.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/circles.min.js" />"></script>
	
	<!-- Syntaxhighlighter -->
	<script src="<c:url value="/tools/template/assets/js/syntaxhighlighter/shCore.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/syntaxhighlighter/shBrushXml.js" />"></script>
	<script src="<c:url value="/tools/template/assets/js/syntaxhighlighter/shBrushJScript.js" />"></script>
	
	<script src="<c:url value="/tools/template/assets/js/app.js" />"></script>
	
	<script src="<c:url value="/js/date_util.js" />"></script>
    
</head>
<body>
    <div class="page">
        <tiles:insertAttribute name="header" />
        <div class="content container">
            <tiles:insertAttribute name="body" />
        </div>
        <tiles:insertAttribute name="footer" />
    </div>
    
</body>
</html>