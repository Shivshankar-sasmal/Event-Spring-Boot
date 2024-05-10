<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@include file="../base_views/base_top.jsp"%>
 <%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>

 <div class="container">        
      <div class="row shadow-lg py-4">
            <div class="col-12 col-lg-4 col-md-6 pt-5 mx-auto pb-5 profile imgs">
                  <div class="card">
                          <div class="card-image">
                                <img src="/static/images/default/undraw_code_thinking_1jeh.png" alt="">
                          </div>                     
                          <div class="profile-image">
                                <img src="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path_user).path(event.getUser_author().getImage()).toUriString()}" alt="">
                          </div>
                          <div class="card-content">
                                <h2 class="py-3">${event.getUser_author().getFull_Name()}</h2>
                                <h5 class="red">${event.getUser_author().getUsername()}</h5>
                                <blockquote class="container text-muted event-profile-font">
                                  <i class="fa fa-quote-left fa-2x text-primary"></i>
                                    ${event.getUser_author().getSomething_About_You()}
                                </blockquote>
                                <h5><i class="fa fa-envelope red"></i> <small class="event-profile-font word-break"><a href="mailto:${event.getUser_author().getEmail()}" class="text-dark">${event.getUser_author().getEmail()}</a></small></h5>
                          </div>
                          <hr>
                          <div class="pb-3 d-flex justify-content-around">
                              <a href="https://www.google.co.in/maps/dir//${event.getUser_author().getDistrict()},+Maharashtra/" target="_blank" class="text-dark"><i class="fa fa-home fa-2x"></i></a>
                              <a href="https://www.google.co.in/maps/dir//${event.getUser_author().getDistrict()},+Maharashtra/" target="_blank" class="text-dark"><span class="event-profile-font">${event.getUser_author().getDistrict()}</span></a>
                          </div>
                  </div>
            </div>         
                  
            <div class="col-12 col-lg-7 col-md-7 mx-auto p-2 detail my-auto">  
                  <c:if test="${Current_user.user.getEmail().contentEquals(event.getUser_author().getEmail())}">
                        <div class="pb-3 d-flex justify-content-end">
                           <a href="/update/${event.getEvent_id()}" class="btn btn-outline-primary mx-1">Update</a>   
                           <a href="/delete/${event.getEvent_id()}" class="btn btn-outline-danger mx-1">Delete</a>
                        </div>
                  </c:if>           
                  
                  <div class="event_content_touch mb-2">
                              <div class="blog-header">
                                      <img src="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path).path(event.getEvent_poster_image()).toUriString()}" class="img-fluid" alt="">
                                      <div class="blog-header-info">
                                            <kbd class="bg-primary">${event.getEvent_type()}</kbd>
                                            <h3><a href="/detail/${event.getEvent_id()}">${event.getTitle()}</a></h3>
                                      </div>                      
                                </div>
                          
                                <div class="px-2 pt-2 d-flex justify-content-between">
                                      <div class="d-flex">
                                            <a href=""> <img src="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path_user).path(event.getUser_author().getImage()).toUriString()}" alt="" class="img-fluid img-event-profile"></a>
                                            <a href=""><h3 class="my-auto ml-3 slogan word-break">${event.getUser_author().username}</h3></a>
                                      </div>        
                                      <div>
                                            <span class="mr-2 event-profile-font"> <a href="https://www.google.co.in/maps/dir//${event.getDistrict()},+Maharashtra/" class="text-muted" target="_blank"><i class="fa fa-map-marker red"></i> ${event.getDistrict()}</a> </span>
                                              <a href="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path).path(event.getEvent_poster_image()).toUriString()}" download><i class="fa fa-arrow-circle-o-down text-dark"></i></a>
                                      </div>
                                </div>
                                <div class="text-muted date ml-date">${event.getDate_posted().getDayOfMonth()} ${event.getDate_posted().getMonth()}, ${event.getDate_posted().getYear()}</div>
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
                     
                        <div class="pt-4 pb-2 d-flex justify-content-between event-profile-font">
                              <div>
                                    <a href="/participate/${event.getEvent_id()}" class="btn btn-outline-primary btn-sm">Participate</a>
                              </div>
                              <div class="text-muted outer-content-touch">
                                  <small><i class="fa fa-calendar-check-o mr-1"></i><fmt:formatDate type="date" value="${event.getEvent_date()}" /></small>
                              </div>
                        </div>
            </div>                  
          </div>      
        </div>
        <div class="container">  
                            <p class="event-profile-font red text-center mt-4 h4"> People Participated : ${participate_list.size()}</p>
                            <hr color=red>
                               <c:if test="${Current_user.user.getEmail().contentEquals(event.getUser_author().getEmail())}">
                                    <ol class="row bg-light">
                                      <c:forEach items="${participate_list}" var="participate">
                                            <li type="1" class="col-12 col-lg-6 col-md-6 py-3 word-break event-profile-font">
                                                    Name : <span class="red">${participate.getUser().getFull_Name()}</span> <br>
                                                    Username : ${participate.getUser().getUsername()} <br>
                                                    Phone : <a href="tel:+91${participate.getPhone_number()}">+91${participate.getPhone_number()}</a><br>
                                                    Email : <a href="mailto:${participate.getUser().getEmail()}">${participate.getUser().getEmail()}</a><br>
                                                    College : ${participate.getCollege()} <br>
                                                    Time : <fmt:formatDate type="both" value="${participate.getForm_date()}" /> <br>
                                                          <div class="text-center my-2"><a href="/participate_form_delete/${event.getEvent_id()}/${participate.getParticipate_id()}" class="btn btn-outline-danger btn-sm">Delete Form</a></div>
                                            </li>
                                      </c:forEach>                                     
                                    </ol>
                                 </c:if>   
                                          
        </div>  
</div>   
           
             
 <%@include file="../base_views/base_bottom.jsp" %>