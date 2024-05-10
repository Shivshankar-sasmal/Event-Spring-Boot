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
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                          <c:if test="${Current_user.user.getIsSuperuser() == 1}">
                                 <li class="nav-item">
                                       <a class="nav-link" href="/admin">Admin</a>
                                  </li>
                          </c:if>
                          <c:if test="${! Current_user.is_null()}">
                                 <li class="nav-item">
                                       <a class="nav-link" href="/profile">Profile - ${Current_user.user.username}</a>
                                  </li>
                          </c:if>
                         <c:choose>
                              <c:when test="${Current_user.is_null()}" >
                                        <li class="nav-item">
                                               <a class="nav-link" href="/about">About</a>
                                        </li>
                                         <li class="nav-item">
                                               <a class="nav-link" href="/login">Login</a>
                                        </li>    
                                        <li class="nav-item">
                                               <a class="nav-link" href="/register">Register</a>
                                        </li>    
                              </c:when>
                              <c:otherwise>
                                        <li class="nav-item">
                                               <a class="nav-link" href="/">Home</a>
                                        </li>
                                        <li class="nav-item">
                                               <a class="nav-link" href="/about">About</a>
                                        </li>
                                        <li class="nav-item">
                                               <a class="nav-link" href="/event_new">Create-Post</a>
                                        </li>
                                        <li class="nav-item">
                                               <a class="nav-link" href="/user_events/${Current_user.user.username}">Your-Post</a>
                                        </li>
                                        <li class="nav-item">
                                               <a class="nav-link" href="/logout">Logout</a>
                                        </li>    
                              </c:otherwise>
                          </c:choose>
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
     