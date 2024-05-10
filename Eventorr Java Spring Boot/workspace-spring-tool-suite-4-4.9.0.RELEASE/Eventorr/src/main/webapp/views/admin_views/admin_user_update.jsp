<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@include file="../base_views/base_top.jsp"%>

<div class="container login-registration">
      <div class="row shadow-lg py-5 m-1">
            <div class="col-12">
                <h2 class="text-center slogan">Admin User Create &amp; Update Form</h2>
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
                                                             User Identity<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="user_id" value="${user_profile.getUser_Id()}" class="textinput textInput form-control"  id="id_user_id" disabled="">        
                                                              <small class="form-text text-muted">Provided Automatically for Security Purpose</small>
                                                        </div>
                                                </div>
                                      </div>
                                      <div class="col-12 col-lg-10 col-md-10 col-sm-12 small">
                                                <div id="div_id_full_name" class="form-group">
                                                        <label for="id_full_name" class=" requiredField">
                                                                 Full Name<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="full_name" autofocus="" value="${user_profile.getFull_Name()}" class="textinput textInput form-control" required="" id="id_full_name">        
                                                        </div>
                                                </div>
                                      </div>
                                      <div class="col-12 col-lg-3 col-md-3 col-sm-12 small">
                                                <div id="div_id_username" class="form-group">
                                                        <label for="id_username" class=" requiredField">
                                                                 Username<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="username" value="${user_profile.getUsername()}" class="textinput textInput form-control" required="" id="id_username"> 
                                                              <small id="hint_id_username" class="form-text text-muted">
                                                                      Letters, digits and @/./+/-/_ included.
                                                              </small>        
                                                        </div>
                                                </div>
                                      </div>
                                      <div class="col-12 col-lg-9 col-md-9 col-sm-12 small">
                                                <div id="div_id_email" class="form-group">
                                                        <label for="id_email" class=" requiredField">
                                                                 Email<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="email" name="email" value="${user_profile.getEmail()}" class="textinput textInput form-control" required="" id="id_email">        
                                                        </div>
                                                </div>
                                      </div>
                                   <div class="col-12 col-lg-3 col-md-3 col-sm-12 small">
                                              <div id="div_id_last_name" class="form-group">
                                                        <label for="id_last_name" class=" requiredField">
                                                                  District<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <select name="district" class="select form-control" id="id_district">
                                                                            <option value=""> ------- </option>
                                                                            <c:forEach items="${district_list}" var="district">
                                                                                   <option value="${district.getDistrict_Id()}"> ${district} </option>
                                                                            </c:forEach>                                            
                                                              </select>                 
                                                        </div>
                                                </div>                                  
                                  </div>
                                  <div class="col-12 col-lg-9 col-md-9 col-sm-12 small">
                                                <div id="div_id_password" class="form-group">
                                                        <label for="id_password" class=" requiredField">
                                                                 Password<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="password" value="${user_update_password}" class="textinput textInput form-control" required="" id="id_password">        
                                                        </div>
                                                </div>
                                      </div>
                                  <div class="col-12 small">
                                          <div id="div_id_something_about_you" class="form-group">
                                                <label for="id_something_about_you" class=" requiredField">
                                                          About you<span class="asteriskField">*</span>
                                                </label>
                                                <div class="">
                                                        <textarea name="something_about_you" cols="40" rows="10" maxlength="400" class="textarea form-control" required="" id="id_about_you">${user_profile.getSomething_About_You()}</textarea>
                                                        <small id="hint_id_about_you" class="form-text text-muted">Tell Us Something About Yourself</small>
                                                </div>
                                          </div>
                                  </div>
                                  <div class="col-12 col-lg-6 col-md-6">
                                        <div id="div_id_image" class="form-group">
                                                <label for="id_image" class=" requiredField">
                                                          Image
                                                </label>
                                                <div class="small">
                                                        Currently: <span class="text-primary">${user_profile.getImage()}</span> <br>
                                                        Change:
                                                        <input type="file" name="image_file" accept="image/*" class="clearablefileinput form-control-file" id="id_image">
                                                </div>
                                        </div>
                                  </div>
                                  <div class="col-6 col-lg-3 col-md-3 col-sm-6 small">
                                                <div id="div_id_is_superuser" class="form-group">
                                                        <label for="id_is_superuser" class=" requiredField">
                                                                 Is_Superuser<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="number" name="is_superuser" value="${user_profile.getIsSuperuser()}" max="1" min="0" class="textinput textInput form-control" required="" id="id_username">        
                                                        </div>
                                                </div>
                                    </div>       
                                    <div class="col-6 col-lg-3 col-md-3 col-sm-6 small">
                                                <div id="div_id_is_activer" class="form-group">
                                                        <label for="id_is_active" class=" requiredField">
                                                                 Is_Active<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="number" name="is_active" value="${user_profile.getIsActive()}" max="1" min="0" class="textinput textInput form-control" required="" id="id_username">        
                                                        </div>
                                                </div>
                                      </div>                  
                                              <div class="col-12 col-lg-12 col-md-12 col-sm-12 small">
                                                          <div id="div_id_is_activer" class="form-group">
                                                                  <label for="id_is_active" class=" requiredField">
                                                                           Registered Date<span class="asteriskField">*</span>
                                                                  </label>            
                                                                  <div class="">
                                                                        <input type="datetime-local" name="registered_date" value="${user_profile.getDate()}" max="1" min="0" class="textinput textInput form-control" id="id_date" disabled="">        
                                                                        <small class="form-text text-muted">Date and Time will be Automatically Provided if is Given or Not</small>
                                                                  </div>
                                                          </div>
                                              </div>                             
                          </div>
                        <div class="form-group d-flex justify-content-center pt-4">
                             <button class="btn btn-outline-primary mx-1" type="submit" >Save</button>
                      	</div>
                </form>
            </div>    
      </div>
</div>

  <%@include file="../base_views/base_bottom.jsp" %>