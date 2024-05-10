<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@include file="../base_views/base_top.jsp"%>
 
 <div class="container">
      <div class="row shadow-lg py-5 m-1">
                <div class="col-12">
                        <h2 class="text-center slogan">Create Event</h2>
                        <hr>
                </div> 
      
               <div class="col-12 col-lg-6 col-md-6 imgs">
                      <div class="col-12 col-lg-12 col-md-12">
                            <div class="login-container pt-3">
                                    <div class="text-big h4s ml-5 text-muted">
                                          <b>Event Posters </b> are usually the first piece of media created for an <b>event.</b> <b>Posters</b> can be powerful if creating excitement &amp; interest for your <b>event</b> if done correctly.
                                    </div>
                            </div>
                            <img src="/static/images/default/undraw_post2_19cj.png" alt="" class="img-fluid py-auto">
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
                                                              <input type="text" name="title" autofocus="" maxlength="75" class="textinput textInput form-control" required="" id="id_title">
                                                        </div>
                                                </div>                                             
                                                <div id="div_id_content" class="form-group">
                                                        <label for="id_content" class=" requiredField">
                                                                  Content<span class="asteriskField">*</span>
                                                        </label>
                                                        <div class="">
                                                                <textarea name="content" cols="40" rows="10" class="textarea form-control" required="" id="id_content"></textarea>    
                                                        </div>   
                                                </div>
                                        </div>
                                        <div class="col-12 col-lg-6 col-md-6">
                                                <div id="div_id_event_date" class="form-group">
                                                        <label for="id_event_date" class=" requiredField">
                                                                  Event date<span class="asteriskField">*</span>
                                                        </label>    
                                                        <div class="">
                                                                  <input type="date" name="event_date" class="dateinput form-control hasDatepicker" required="" id="id_event_date">                 
                                                                  <small id="hint_id_event_date" class="form-text text-muted">Date Is Present in DD-MM-YY format</small> 
                                                        </div>
                                                </div>     
                                                <div id="div_id_district" class="form-group">
                                                        <label for="id_district" class=" requiredField">
                                                                  District<span class="asteriskField">*</span>
                                                        </label>
                                                        <div class="">
                                                              <select name="district" class="select form-control" id="id_last_name" required="">
                                                                            <option value=""> ------- </option>
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
                                                                <input type="text" name="event_type" maxlength="20" class="textinput textInput form-control" required="" id="id_event_type">
                                                                <small id="hint_id_event_type" class="form-text text-muted">eg. Programming, Working, Dance, etc.</small>
                                                        </div>        
                                                </div>
                                                <div id="div_id_max_seats" class="form-group">
                                                        <label for="id_max_seats" class=" requiredField">
                                                                  Max seats<span class="asteriskField">*</span>
                                                        </label>
                                                        <div class="">
                                                                <input type="number" name="max_seats" min="0" class="numberinput form-control" required="" id="id_max_seats">        
                                                        </div>
                                                </div>
                                        </div>
                                        <div class="col-12">   
                                              <div id="div_id_college_url" class="form-group">
                                                      <label for="id_college_url" class="">
                                                                College url
                                                      </label>      
                                                      <div class="">
                                                            <input type="url" name="college_url" maxlength="200" class="urlinput form-control" id="id_college_url">
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