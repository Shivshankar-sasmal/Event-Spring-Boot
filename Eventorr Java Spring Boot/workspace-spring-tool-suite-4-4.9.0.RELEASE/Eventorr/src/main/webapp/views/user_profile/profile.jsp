<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
 <%@include file="../base_views/base_top.jsp"%>
 
 <div class="container profile">
      <div class="row">
            <div class="col-12 col-lg-4 col-md-6 pt-3 pb-5">
                  <c:if test="${user_profile.getIsSuperuser() == 1}">
                        <center><a href="/admin" class="btn btn-primary py-2 my-4 w-75 shadow">Admin Click Here</a></center>
                  </c:if>
                  <div class="card">
                          <div class="card-image">
                                  <img src="/static/images/default/undraw_code_thinking_1jeh.png" alt="">
                          </div>                     
                          <div class="profile-image">
                                  <img src="${ServletUriComponentsBuilder.fromCurrentContextPath().path(path).path(user_profile.getImage()).toUriString()}" alt="">
                          </div>
                          <div class="card-content">
                                  <h2 class="py-3">${user_profile.getFull_Name()}</h2>
                                  <h5 class="red">${user_profile.getUsername()}</h5>
                                  <blockquote class="container text-muted event-profile-font">
                                        <i class="fa fa-quote-left fa-2x text-primary"></i>
                                        ${user_profile.getSomething_About_You()}
                                  </blockquote>
                                  <h5><i class="fa fa-envelope red"></i> <small class="event-profile-font word-break">${user_profile.getEmail()}</small></h5>
                          </div>
                          <hr>
                          <div class="pb-3 d-flex justify-content-around">
                                  <a href="https://www.google.co.in/maps/dir//${user_profile.getDistrict()},+Maharashtra/" target="_blank"><i class="fa fa-home fa-2x text-dark"></i></a> 
                                  <a href="https://www.google.co.in/maps/dir//${user_profile.getDistrict()},+Maharashtra/" target="_blank"><span class="event-profile-font text-dark">${user_profile.getDistrict()}</span></a>
                          </div>
                  </div>
            </div>       	
              
            <div class="col-12 col-lg-8 col-md-6 shadow-lg py-4">
                    <c:if test="${error_list.size() > 0}" >
                                <div class="alert alert-block alert-danger" data-dismiss='alert'> 
                                              <ul class="m-0">
                                                     <c:forEach items="${error_list}" var="error">
                                                             <li>${error}</li> 
                                                      </c:forEach>
                                              </ul> 
                                </div> 
                    </c:if>
                  <form method="POST" enctype="multipart/form-data" autocomplete="off">
                          <fieldset>
                                 <legend class="border-bottom py-2 slogan"><big class="h2 ml-2">Profile Info</big></legend>
                          </fieldset>
                          <div class="text-small container row-center my-3">
                                <div class="row">
                                      <div class="col-12">
                                                <div id="div_id_first_name" class="form-group">
                                                        <label for="id_first_name" class=" requiredField">
                                                                 Full Name<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="full_name" value="${user_profile.getFull_Name()}" autofocus="" class="textinput textInput form-control" required="" id="id_first_name">        
                                                        </div>
                                                </div>
                                      </div>
                                      <div class="col-12 col-lg-6 col-md-6">
                                              <div id="div_id_last_name" class="form-group">
                                                        <label for="id_last_name" class=" requiredField">
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
                                        <div id="div_id_image" class="form-group">
                                                <label for="id_image" class=" requiredField">
                                                          Image<span class="asteriskField">*</span>
                                                </label>
                                                <div class="">
                                                        Change:
                                                        <input type="file" name="image" accept="image/*" class="clearablefileinput form-control-file" id="id_image" required="">
                                                </div>
                                        </div>
                                  </div>
                                  <div class="col-12">
                                          <div id="div_id_about_you" class="form-group">
                                                <label for="id_about_you" class=" requiredField">
                                                          About you<span class="asteriskField">*</span>
                                                </label>
                                                <div class="">
                                                        <textarea name="something_about_you" cols="40" rows="10" maxlength="400" class="textarea form-control" required="" id="id_about_you">${user_profile.getSomething_About_You()}</textarea>
                                                        <small id="hint_id_about_you" class="form-text text-muted">Tell Us Something About Yourself</small>
                                                </div>
                                          </div>
                                  </div>
                            </div>
                      </div>

                      <div class="form-group text-center pt-4">
                             <button class="btn btn-outline-primary" type="submit">Update</button>
                      </div>
                </form>
             </div>
        </div>
</div>
<%@include file="../base_views/base_bottom.jsp" %>