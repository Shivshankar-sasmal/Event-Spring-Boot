<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@include file="../base_views/base_top.jsp"%>
 <%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>

<div class="container login-registration">
      <div class="row shadow-lg py-5 m-1">
            <div class="col-12">
                <h2 class="text-center slogan">Admin Event Update Form</h2>
                <hr>
                <form  enctype="multipart/form-data" autocomplete="off" method="POST">
                     <div class="row p-3">
                               <div class="col-12">
                                     <c:if test="${error_list.size() > 0}" >
                                                 <div class="alert alert-block alert-danger" data-dismiss='alert'> 
                                                               <ul class="m-0">
                                                                      <c:forEach items="${error_list}" var="error">
                                                                              <li>${error}</li> 
                                                                       </c:forEach>
                                                               </ul> 
                                                 </div> 
                                     </c:if>
                                 </div>
                                <div class="col-12 col-lg-2 col-md-2 col-sm-12 small">
                                                <div id="div_id_user_id" class="form-group">
                                                        <label for="id_user_id" class=" requiredField">
                                                             Event Identity<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="district_id" value="${event.getEvent_id()}" class="textinput textInput form-control"  id="id_user_id" disabled="">        
                                                              <small class="form-text text-muted">Provided Automatically for Security Purpose</small>
                                                        </div>
                                                </div>
                                      </div>
                                      <div class="col-12 col-lg-10 col-md-10 col-sm-12 small">
                                                <div id="div_id_full_name" class="form-group">
                                                        <label for="id_full_name" class=" requiredField">
                                                                 Event Title<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="title" autofocus="" value="${event.getTitle()}" class="textinput textInput form-control" required="" id="id_title">        
                                                        </div>
                                                </div>
                                      </div>

                                      <div class="col-12 col-lg-4 col-md-4 col-sm-12 small">
                                                <div id="div_id_full_name" class="form-group">
                                                        <label for="id_full_name" class=" requiredField">
                                                                 User <span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                                  <input type="text" name="user_author" value="${event.getUser_author().getUsername()}" class="textinput textInput form-control" required="" id="div_id_user_author" disabled="">
                                                        </div>
                                                </div>

                                                <div id="div_id_event_created" class="form-group">
                                                        <label for="div_id_event_created" class=" requiredField">
                                                                 Event Created<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="date_posted" value="${event.getDate_posted()}" class="textinput textInput form-control" required="" id="div_id_event_created" disabled="">        
                                                        </div>
                                                </div>

                                                <div id="div_id_event_date" class="form-group">
                                                        <label for="id_event_date" class=" requiredField">
                                                                 Event Date<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="event_date" value="${event.getEvent_date()}" class="textinput textInput form-control" required="" id="id_event_date" disabled="">        
                                                        </div>
                                                </div>

                                                <div id="div_id_full_name" class="form-group">
                                                        <label for="id_full_name" class=" requiredField">
                                                                 Event Type <span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                               <input type="text" name="event_type" value="${event.getEvent_type()}" class="textinput textInput form-control" required="" id="id_district">           
                                                        </div>
                                                </div>
                                      </div>

                                      <div class="col-12 col-lg-8 col-md-8 col-sm-12 small">
                                          <div id="div_id_full_name" class="form-group">
                                                        <label for="id_full_name" class=" requiredField">
                                                                 District <span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                               <input type="text" name="district" value="${event.getDistrict().getDistrict()}" class="textinput textInput form-control" required="" id="id_district" disabled="">           
                                                        </div>
                                                </div>

                                          <div id="div_content" class="form-group">
                                                <label for="id_something_about_you" class=" requiredField">
                                                          Event Content<span class="asteriskField">*</span>
                                                </label>
                                                <div class="">
                                                        <textarea name="content" cols="40" rows="10" maxlength="400" class="textarea form-control" required="" id="content">${event.getContent()}</textarea>
                                                </div>
                                          </div>
                                  </div>

                                  <div class="col-12 col-lg-4 col-md-4 col-sm-12 small">
                                                <div id="div_id_event_date" class="form-group">
                                                        <label for="id_event_date" class=" requiredField">
                                                                 Max Seats<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="number" name="max_seats" value="${event.getMax_seats()}" class="textinput textInput form-control" required="" id="id_event_date">        
                                                        </div>
                                                </div>
                                  </div>
                                  <div class="col-12 col-lg-8 col-md-8">
                                       <div id="div_id_event_date" class="form-group">
                                                        <label for="id_event_date" class=" requiredField">
                                                                 College Url
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="college_url" value="${event.getCollege_url()}" class="textinput textInput form-control" id="id_event_date">        
                                                        </div>
                                                </div>
                                  </div>

                                  <div class="col-12">
                                        <div id="div_id_image" class="form-group">
                                                <label for="id_image" class=" requiredField">
                                                          Image
                                                </label>
                                                <div class="small">
                                                        Currently: <span class="text-primary"></span> <br>
                                                        Change:
                                                        <input type="file" name="event_poster_image" accept="image/*" class="clearablefileinput form-control-file" id="id_image" required="">
                                                </div>
                                        </div>
                                 </div>
                                      
                                 <div class="col-12"><center><button class="btn btn-outline-primary" type="Submit">Save</button></center></div>
                </form>
            </div>    
      </div>
</div>           
             
 <%@include file="../base_views/base_bottom.jsp" %>