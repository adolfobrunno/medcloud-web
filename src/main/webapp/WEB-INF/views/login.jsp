<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>Artificial Reason</title>

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

    <link href="tools/template/assets/css/style-blue.css" rel="stylesheet" media="screen" title="default">
    <link href="tools/template/assets/css/width-full.css" rel="stylesheet" media="screen" title="default">

    <link href="tools/template/assets/css/buttons.css" rel="stylesheet" media="screen">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.min.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<!-- Preloader -->
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>

<body>

<div class="paper-back-full">
    <div class="login-form-full">
        <div class="fix-box">
            <div class="text-center title-logo animated fadeInDown animation-delay-5">artificial<span>reason</span></div>
            <div class="transparent-div no-padding animated fadeInUp animation-delay-8">
                <ul class="nav nav-tabs nav-tabs-transparent">
                  <li class="active"><a href="#home" data-toggle="tab">Login</a></li>
                  <li><a href="#profile" data-toggle="tab">Register</a></li>
                  <li><a href="#messages" data-toggle="tab">Recovery Pass</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
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
                            <button type="submit" class="btn btn-ar btn-primary pull-right">Login</button>
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
