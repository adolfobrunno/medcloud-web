<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<header id="header-full-top" class="hidden-xs header-full">
	 <div class="container">
	 	<div class="header-full-title">
	 		<h1 class="animated fadeInRight"><a href="index.html" id="title-link" class="active">Med<span>Save</span></a>
				<span class="icon-ar icon-ar-inverse icon-ar-lg icon-ar-circle"><i class="fa fa-cloud"></i></span>
				<span class="icon-ar icon-ar-inverse icon-ar-lg icon-ar-circle"><i class="fa fa-folder-open"></i></span>
				<span class="icon-ar icon-ar-inverse icon-ar-lg icon-ar-circle"><i class="fa fa-lock"></i></span>
	 		</h1>
	 		 <p class="animated fadeInRight">Conectividade, agilidade e segurança na organização da informação clínica.</p>
	 	</div>
	 	<nav class="top-nav">
	 		 <div class="dropdown animated fadeInDown animation-delay-11">
	 		 	<c:if test="${pageContext.request.userPrincipal == null}">
	 		 	
	 		 		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Login</a>
		                <div class="dropdown-menu dropdown-menu-right dropdown-login-box animated fadeInUp">
		                    <form role="form" id="login-form"  action="<c:url value='j_spring_security_check'/>" method="POST">
		                        <h4>Realizar Login</h4>
		
		                        <div class="form-group">
		                            <div class="input-group login-input">
		                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
		                                <input id="j_username" name="j_username" type="text" class="form-control" placeholder="nome@exemplo.com">
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
	 		 	</c:if>
            </div> <!-- dropdown -->
	 	</nav>
	 	
	 </div>
</header>