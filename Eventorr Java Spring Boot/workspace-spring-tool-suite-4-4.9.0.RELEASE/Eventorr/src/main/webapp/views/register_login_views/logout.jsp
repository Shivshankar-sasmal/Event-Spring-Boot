<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Create Events For Free">
    <link rel="icon" type="image/png" href="/static/images/icon/eventorr.png" type="text/css">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/static/css/event-main.css" type="text/css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css" type="text/css">
    <title>${title}</title>
 </head>

<body>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="com.main.eventorr.web.login_current_user.Current_user" %>
  <%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>


  <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top brand-gradient">
        <div class="container">
              <a class="navbar-brand heading" href="/">Eventorr</a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                                 <li class="nav-item">
                                               <a class="nav-link" href="/login">Login</a>
                                  </li>    
                    </ul>
              </div>
        </div>
  </nav>

  <!-- Page Content -->
 <section class="blog section-padding pb-3">
                           <c:if test="${message.size() > 0}" > 
                                  <div class="container">               
                                                    <div class="alert alert-${message[0]} shadow-sm my-3 text-center" role='alert' data-dismiss='alert'>
                                                         <div class="big text-center">${message[1]}</div>
                                                         <c:remove var="message" />
                                                    </div>
                                  </div>
                            </c:if>         

<div class="container login-registration">
      <div class="row shadow-lg py-5 m-1">
            <div class="col-12">
                <h2 class="text-center slogan">Logout</h2>
                <hr>
            </div>
              
            <div class="col-12 col-lg-6 col-md-6 imgs">
                  <img src="/static/images/default/undraw_secure_login_pdn4.png" alt="" class="img-fluid py-auto">
            </div>

            <div class="col-12 col-lg-5 col-md-9 row-center">
                  <div class="login-container py-3">
                       <img src="/static/images/default/undraw_Designer_by46.png" alt="" class="avatar mx-auto">
                  </div>
                  <h2 class="text-center text-primary slogan">GOODBYE, USER</h2>
                  <div class="text-small form-group">
                        <div class="alert alert-block alert-primary" role='alert' data-dismiss='alert'> 
                                    <ul class="m-0 big p-2 py-3 h6 text-center text-white">
                                          You are Seeing This Page Since <br><br> <b>You Have Been Logged Out.</b>
                                    </ul>
                        </div>

                        <center><a href="/login" class="btn btn-outline-primary w-50 p-2 big mt-3">Login Again</a></center>
                  </div>
           </div>           
      </div>
</div>

</section>

    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/static/js/django-main.js"></script>
 </body>
</html>