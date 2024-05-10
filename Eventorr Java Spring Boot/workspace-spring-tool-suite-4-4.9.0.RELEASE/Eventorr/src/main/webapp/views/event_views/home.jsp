<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@include file="../base_views/base_top.jsp"%>
 <%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>

 			<div class="text-primary display-3 slogan text-center"><a href="/">Eventorr !</a></div>
 
 			<form action="/"  autocomplete="off" method="GET">
                        <div class="p-1 rounded-pill shadow-sm mb-4 d-flex container">
                                    <input type="search" autocomplete="off" autofocus="" value="${search}"  placeholder="What are you looking for ?" class="form-control border-0 rounded-pill pl-4" name="search">
                                    <button type="submit" class="btn btn-link text-primary"> <i class="fa fa-search"></i> </button> 
                        </div>    
            </form>    

  <div class="row container mx-auto">
      <div class="col-12 col-lg-7 col-md-7 col-sm-12 shadow p-2 mb-auto"> 
  	  <c:forEach items="${event_post}" var="event"> 	
            <div class="event_content_touch mb-2">
                  <div class="blog-header">
                        <img src="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path).path(event.getEvent_poster_image()).toUriString()}" class="img-fluid" alt="">
                        <div class="blog-header-info">
                              <kbd class="bg-primary">${event.getEvent_type()}</kbd>
                              <h3><a href="/detail/${event.getEvent_id()}">${event.getTitle()}</a></h3>
                        </div>                      
                  </div>
                  
                  <div class="content_event">
                        <div class="px-2 pt-2 d-flex justify-content-between">
                              <div class="d-flex">
                                    <a href=""><img src="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path_user).path(event.getUser_author().getImage()).toUriString()}" alt="" class="img-fluid img-event-profile"></a>
                                    <a href=""><h3 class="my-auto ml-3 slogan word-break">${event.getUser_author().username}</h3></a>
                              </div>
                              <div>
                                    <span class="mr-2 event-profile-font"> <a href="https://www.google.co.in/maps/dir//${event.getDistrict()},+Maharashtra/" class="text-muted" target="_blank"><i class="fa fa-map-marker red"></i> ${event.getDistrict()}</a> </span>
                                    <a href="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path).path(event.getEvent_poster_image()).toUriString()}" download><i class="fa fa-arrow-circle-o-down text-dark"></i></a>
                              </div>
                        </div>

                        <div class="text-muted date ml-date">${event.getDate_posted().getDayOfMonth()} ${event.getDate_posted().getMonth()}, ${event.getDate_posted().getYear()} </div>
                        <div class="p-2 event-profile-font border-bottom">
                          <div><p>
                                 ${event.getContent()}              
                          </p></div>
                          <c:if test="${event.getCollege_url().length() > 0}">
                                 <div class="bg-dark pl-4 text-white rounded-pill">
                                      <p><a href="${event.getCollege_url()}" target="_blank" class="text-white">${event.getCollege_url()}</a></p>
                                  </div>
                          </c:if>
                              <div class="d-flex pt-2 justify-content-between">
                                    <div class="red">
                                          <kbd class="bg-danger kbd-sm">Total Seats - ${event.getMax_seats()}</kbd>
                                    </div>
                              </div>
                        </div>
                  </div>            

                  <div class="pt-2 d-flex justify-content-between event-profile-font">
                        <div>
                              <a href="/participate/${event.getEvent_id()}" class="btn btn-outline-primary btn-sm">Participate</a>
                        </div>
                        <div class="text-muted outer-content-touch">
                            <small><i class="fa fa-calendar-check-o mr-1"></i> <fmt:formatDate type="date" value="${event.getEvent_date()}" /> </small>
                        </div>
                  </div>
            </div>  
      </c:forEach>
      </div>


            <div class="col-12 col-lg-4 col-md-4 col-sm-4 shadow-lg row-center category text-center py-4 mb-auto">
                  <div class="py-3 h4"><kbd class="bg-danger px-4 word-wrap">All_Events</kbd></div>
                  <kbd class="bg-light m-1 event-profile-font"><a href="/">All</a></kbd>

                   <div class="py-2 mt-4 h4"><kbd class="bg-primary px-4">Programming</kbd></div>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=C+Program">C+Program</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Java">Java</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Python">Python</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=HTML">HTML</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=CSS">CSS</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Javacript">Javacript</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Typescript">Typescript</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Django">Django</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Scala">Scala</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Pascal">Pascal</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Flutter">Flutter</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Go">Go</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Hack">Hack</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=SQL">SQL</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=PHP">PHP</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Swift">Swift</a></kbd>
                        

                  <div class="py-2 mt-4 h4"><kbd class="bg-primary px-4">Gaming</kbd></div>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=PUBG">PUBG</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=FreeFire">FreeFire</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Clash+of+Clans">Clash+of+Clans</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Spartans">Spartans</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Chess">Chess</a></kbd>
                        
                   <div class="py-2 mt-4 h4"><kbd class="bg-primary px-4">Activity</kbd></div>                 
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Poster+Presentation">Poster+Presentation</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Treasure+Hunt">Treasure+Hunt</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Spell+Buzz">Spell+Buzz</a></kbd>
                                       
                  <div class="py-2 mt-4 h4"><kbd class="bg-primary px-4">Sports</kbd></div>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Cricket">Cricket</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Football">Football</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Basketball">Basketball</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Swimming">Swimming</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Table+Tennis">Table+Tennis</a></kbd>
                  <div class="py-2 mt-4 h4"><kbd class="bg-primary px-4">Other</kbd></div>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Seminar">Seminar</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Speech">Speech</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Debate">Debate</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Tiktok">Tiktok</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Cooking">Cooking</a></kbd>
                              <kbd class="bg-light m-1 event-profile-font"><a href="/?search=Baking">Baking</a></kbd>
            </div>
      </div>      
</div>              
             
 <%@include file="../base_views/base_bottom.jsp" %>