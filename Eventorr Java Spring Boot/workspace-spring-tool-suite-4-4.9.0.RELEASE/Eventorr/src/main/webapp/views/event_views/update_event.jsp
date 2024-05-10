<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@include file="../base_views/base_top.jsp"%>
 <%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>

<div class="container">
      <div class="row shadow-lg py-5 m-1">
                   <div class="col-12">
                           <h2 class="text-center slogan">Update Event</h2>
                           <hr>
                   </div>                
                    <div class="col-12 col-lg-6 col-md-6 mx-auto p-2 detail mb-4">
                    <div class="event_content_touch mb-2">
                              <div class="blog-header">
                                      <img src="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path).path(event.getEvent_poster_image()).toUriString()}" class="img-fluid" alt="">
                                      <div class="blog-header-info">
                                            <kbd class="bg-primary">${event.getEvent_type()}</kbd>
                                            <h3><a href="/post/114/">${event.getTitle()}</a></h3>
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
                                      </div>
                        </div>                          
                        <div class="pt-2 d-flex justify-content-between event-profile-font">
                              <div>
                                    <a href="/post/114/form" class="btn btn-outline-primary btn-sm">Participate</a>
                              </div>
                              <div class="text-muted outer-content-touch">
                                  <small><i class="fa fa-calendar-check-o mr-1"></i><fmt:formatDate type="date" value="${event.getEvent_date()}" /></small>
                              </div>
                        </div>
                </div>
                

                <div class="col-11 col-lg-5 col-md-9 row-center">
                    <form method="POST" enctype="multipart/form-data" autocomplete="off">
                        <div class="text-small">
                        <div class="row">
                        <div class="col-12">    
                         <div id="div_id_title" class="form-group">        
                                 <label for="id_title" class=" requiredField">
                                     Title<span class="asteriskField">*</span>
                                 </label>
                                     <div class="">
                                         <input type="text" name="title" value="${event.getTitle()}" maxlength="75" class="textinput textInput form-control" required id="id_title">
                                     </div>
                         </div>
                         <div id="div_id_content" class="form-group">
                                 <label for="id_content" class=" requiredField">
                                     Content<span class="asteriskField">*</span>
                                 </label>
                                     <div class="">
                                         <textarea name="content" cols="40" rows="10" class="textarea form-control" required id="id_content">${event.getContent()}</textarea>
                                    </div>
                         </div>
                        </div>
                        <div class="col-12 col-lg-6 col-md-6">
                         <div id="div_id_event_date" class="form-group">
                                 <label for="id_event_date" class=" requiredField">
                                     Event date<span class="asteriskField">*</span>
                                 </label>
                                     <div class="">
                                         <input type="date" name="event_date" value="${event.getEvent_date()}" class="dateinput form-control" required id="id_event_date"> 
                             <small id="hint_id_event_date" class="form-text text-muted">Date Is Present in MM-DD-YY format</small>
                        </div>
                        </div>
                        <div id="div_id_district" class="form-group">
                                 <label for="id_district" class=" requiredField">
                                     District<span class="asteriskField">*</span>
                                 </label>         
                        <div class="">
                              <select name="district" class="select form-control" required="" id="id_district">
                                     <option value="">---------</option>
                                      <c:forEach items="${district_list}" var="district">
                                       <option value="${district.getDistrict_Id()}"> ${district} </option>
                                       </c:forEach>
                              </select>
                         </div>
                         </div>
                         </div>
                         <div class="col-12 col-lg-6 col-md-6">
                         <div id="div_id_event_type" class="form-group">
                                 <label for="id_event_type" class=" requiredField">
                                     Event type<span class="asteriskField">*</span>
                                 </label>
                                     <div class="">
                                         <input type="text" name="event_type" value="${event.getEvent_type()}" maxlength="20" class="textinput textInput form-control" required id="id_event_type">
                             <small id="hint_id_event_type" class="form-text text-muted">eg. Programming, Working, Dance, etc.</small>
                         </div>
                         </div>   
                         <div id="div_id_max_seats" class="form-group">
                                 <label for="id_max_seats" class=" requiredField">
                                     Max seats<span class="asteriskField">*</span>
                                 </label>           
                                     <div class="">
                                         <input type="number" name="max_seats" value="${event.getMax_seats()}" min="0" class="numberinput form-control" required id="id_max_seats">
                                     </div>
                         </div>
                        </div>
                        <div class="col-12">    
                         <div id="div_id_college_url" class="form-group">
                                 <label for="id_college_url" class="">
                                     College url
                                 </label>
                                     <div class="">
                                         <input type="url" name="college_url" maxlength="200" class="urlinput form-control" id="id_college_url" value="${event.getCollege_url()}">
                                         <small id="hint_id_college_url" class="form-text text-muted">eg. Pastes Event URL If Want</small>
                                     </div>
                         </div>
                         </div>
                                    <div class="col-12">
                                           <div id="div_id_event_poster_image" class="form-group">
                                                   <label for="id_event_poster_image" class=" requiredField">
                                                       Event poster image<span class="asteriskField">*</span>
                                                   </label>
                                                       <div class="">
                                                            <input type="file" name="event_poster_image" accept="image/*" class="clearablefileinput form-control-file" id="id_event_poster_image" required="">
                                                           <small id="hint_id_event_poster_image" class="form-text text-muted">Upload a 800 x 400 Image</small>
                                                       </div>
                                           </div>
                                       </div>
                                                       </div>
                                                 </div>  
                                                 <div class="form-group text-center mt-4">
                                                     <button class="btn btn-outline-primary" type="submit">Post Event</button>
                                                     <hr>
                                                 </div>
                    </form>
                 </div>
      </div>

      <div class="col-12 alert alert-danger m-1 mt-5 text-center">
                <li type="circle"> Please, make sure that you <b>Don't Post the Same Post</b> Posted by <b>Other User</b>, Else an <b>Official Complaint</b> may get Registered <b>Against You</b></li>
      </div>
</div>

 <%@include file="../base_views/base_bottom.jsp" %>