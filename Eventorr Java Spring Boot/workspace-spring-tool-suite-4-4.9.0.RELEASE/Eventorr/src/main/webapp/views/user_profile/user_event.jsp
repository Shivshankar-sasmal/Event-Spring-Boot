<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@include file="../base_views/base_top.jsp"%>
 <%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>

 <div class="text-primary display-3 slogan text-center"><a href="/">Eventorr !</a></div>

  <div class="row container mx-auto p-2 my-5">
    <div class="col-12 text-center slogan h2 my-3"><big>Event Created - ${event_post.size()}</big></div>
  	  <c:forEach items="${event_post}" var="event"> 	
      <div class="col-12 col-lg-6 col-md-6 col-sm-12 shadow p-2 mb-auto"> 
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
                          <div><p>${event.getContent()}</p></div>
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
      </div>
      </c:forEach>
      </div>   


      <div class="row container mx-auto p-2 my-5">
      <div class="col-12 text-center slogan h2 my-3"><big>Event Participated - ${event_participate_post.size()}</big></div>
      <c:forEach items="${event_participate_post}" var="event">   
      <div class="col-12 col-lg-6 col-md-6 col-sm-12 shadow p-2 mb-auto"> 
            <div class="event_content_touch mb-2">
                  <div class="blog-header">
                        <img src="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path).path(event.getEvent().getEvent_poster_image()).toUriString()}" class="img-fluid" alt="">
                        <div class="blog-header-info">
                              <kbd class="bg-primary">${event.getEvent().getEvent_type()}</kbd>
                              <h3><a href="/detail/${event.getEvent().getEvent_id()}">${event.getEvent().getTitle()}</a></h3>
                        </div>                      
                  </div>
                  
                  <div class="content_event">
                        <div class="px-2 pt-2 d-flex justify-content-between">
                              <div class="d-flex">
                                    <a href=""><img src="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path_user).path(event.getEvent().getUser_author().getImage()).toUriString()}" alt="" class="img-fluid img-event-profile"></a>
                                    <a href=""><h3 class="my-auto ml-3 slogan word-break">${event.getEvent().getUser_author().username}</h3></a>
                              </div>
                              <div>
                                    <span class="mr-2 event-profile-font"> <a href="https://www.google.co.in/maps/dir//${event.getEvent().getDistrict()},+Maharashtra/" class="text-muted" target="_blank"><i class="fa fa-map-marker red"></i> ${event.getEvent().getDistrict()}</a> </span>
                                    <a href="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path).path(event.getEvent().getEvent_poster_image()).toUriString()}" download><i class="fa fa-arrow-circle-o-down text-dark"></i></a>
                              </div>
                        </div>

                        <div class="text-muted date ml-date">${event.getEvent().getDate_posted().getDayOfMonth()} ${event.getEvent().getDate_posted().getMonth()}, ${event.getEvent().getDate_posted().getYear()} </div>
                        <div class="p-2 event-profile-font border-bottom">
                          <div><p>${event.getEvent().getContent()}</p></div>
                            <c:if test="${event.getEvent().getCollege_url().length() > 0}">
                               <div class="bg-dark pl-4 text-white rounded-pill">
                                    <p><a href="${event.getEvent().getCollege_url()}" target="_blank" class="text-white">${event.getEvent().getCollege_url()}</a></p>
                                </div>
                         </c:if>                       
                              <div class="d-flex pt-2 justify-content-between">
                                    <div class="red">
                                      <kbd class="bg-danger kbd-sm">Total Seats - ${event.getEvent().getMax_seats()}</kbd>                                          
                                    </div>
                              </div>
                        </div>
                  </div>            

                  <div class="pt-2 d-flex justify-content-between event-profile-font">
                        <div>
                              <a href="/participate/${event.getEvent().getEvent_id()}" class="btn btn-outline-primary btn-sm">Participate</a>
                        </div>
                        <div class="text-muted outer-content-touch">
                            <small><i class="fa fa-calendar-check-o mr-1"></i> <fmt:formatDate type="date" value="${event.getEvent().getEvent_date()}" /> </small>
                        </div>
                  </div>
            </div>  
      </div>
      </c:forEach>
      </div>   
</div>              
             
 <%@include file="../base_views/base_bottom.jsp" %>