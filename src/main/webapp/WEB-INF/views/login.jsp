<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>MedSave</title>

    <link rel="shortcut icon" href="img/favicon.png">

    <meta name="description" content="">

    <!-- CSS -->
    <link href="tools/template/assets/css/preload.css" rel="stylesheet" media="screen">
    <link href="tools/template/assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="tools/template/assets/css/yamm.css" rel="stylesheet" media="screen">
    <link href="tools/template/assets/css/bootstrap-switch.min.css" rel="stylesheet" media="screen">
    <link href="tools/template/assets/css/font-awesome.min.css" rel="stylesheet" media="screen">
    <link href="tools/template/assets/css/animate.min.css" rel="stylesheet" media="screen">
    <link href="tools/template/assets/css/slidebars.css" rel="stylesheet" media="screen">
    <link href="tools/template/assets/css/lightbox.css" rel="stylesheet" media="screen">
    <link href="tools/template/assets/css/jquery.bxslider.css" rel="stylesheet">
    <link href="tools/template/assets/css/syntaxhighlighter/shCore.css" rel="stylesheet" media="screen">

    <link href="tools/template/assets/css/style-green.css" rel="stylesheet" media="screen" title="default">
    <link href="tools/template/assets/css/width-full.css" rel="stylesheet" media="screen" title="default">

    <link href="tools/template/assets/css/buttons.css" rel="stylesheet" media="screen">
    
    <link href="css/login.css" rel="stylesheet" media="screen">

</head>

<!-- Preloader -->
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>

<body>

<div class="paper-back-full">
    <div class="login-form-full">
        <div class="fix-box">
            <div class="text-center title-logo animated fadeInDown animation-delay-5">Med<span>Save</span></div>
            <div class="transparent-div animated fadeInUp animation-delay-8 panel">
                <div class="panel-body">
                  <div class="tab-pane active" id="home">
                    <form role="form" id="login-form"  action="<c:url value='j_spring_security_check'/>" method="POST">
                        <div class="form-group">
                            <div class="input-group login-input">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input id="j_username" name="j_username" type="text" class="form-control" 
                                	value='<c:if test="${not empty param.login_error}"><c:out value="${SPRING_SECURITY_LAST_USERNAME}"/></c:if>' placeholder="nome@exemplo.com">
                            </div>
                            <br>
                            <div class="input-group login-input">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                               <input id="j_password" name="j_password" type="password" class="form-control" placeholder="Sua senha">
                            </div>
                            <div id="login-buttons">
	                            <button type="submit" class="btn btn-ar btn-primary pull-right">Entrar</button>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                  </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Scripts -->
<script src="tools/template/assets/js/jquery.min.js"></script>
<script src="tools/template/assets/js/jquery.cookie.js"></script>
<script src="tools/template/assets/js/bootstrap.min.js"></script>
<script src="tools/template/assets/js/bootstrap-switch.min.js"></script>
<script src="tools/template/assets/js/wow.min.js"></script>
<script src="tools/template/assets/js/slidebars.js"></script>
<script src="tools/template/assets/js/jquery.bxslider.min.js"></script>
<script src="tools/template/assets/js/holder.js"></script>
<script src="tools/template/assets/js/buttons.js"></script>
<script src="tools/template/assets/js/styleswitcher.js"></script>
<script src="tools/template/assets/js/jquery.mixitup.min.js"></script>
<script src="tools/template/assets/js/circles.min.js"></script>

<!-- Syntaxhighlighter -->
<script src="tools/template/assets/js/syntaxhighlighter/shCore.js"></script>
<script src="tools/template/assets/js/syntaxhighlighter/shBrushXml.js"></script>
<script src="tools/template/assets/js/syntaxhighlighter/shBrushJScript.js"></script>

<script src="tools/template/assets/js/app.js"></script>

<script src="tools/template/assets/js/home_login_full.js"></script>

</body>

</html>
