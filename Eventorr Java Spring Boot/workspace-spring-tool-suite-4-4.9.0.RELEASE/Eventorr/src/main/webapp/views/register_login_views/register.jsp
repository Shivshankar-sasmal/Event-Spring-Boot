<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@include file="../base_views/base_top.jsp"%>
 
<div class="container login-registration">
      <div class="row shadow-lg py-5 m-1">
            <div class="col-12">
                  <h2 class="text-center slogan">Register</h2>
                <hr>
            </div>
            <div class="col-12 col-lg-6 col-md-6 my-auto imgs">
                  <img src="/static/images/default/undraw_hey_email_liaa.png" alt="" class="img-fluid">
            </div>        
            <div class="col-12 col-lg-5 col-md-9 row-center pr-3">
                  <div class="login-container py-3">
                      <img src="/static/images/default/undraw_Designer_by46.png" alt="" class="avatar mx-auto">
                  </div>
                  <h2 class="text-center text-primary slogan">SIGN UP, HERE</h2>

                              <form method="POST" autocomplete="off" enctype="multipart/form-data">
      
                                      <div class="text-small form-group">
                                               <c:if test="${error_list.size() > 0}" >
                                                    <div class="alert alert-block alert-danger" data-dismiss='alert'> 
                                                            <ul class="m-0">
                                                                  <c:forEach items="${error_list}" var="error">
                                                                        <li>${error}</li> 
                                                                  </c:forEach>
                                                            </ul> 
                                                    </div> 
                                               </c:if>
                                                    
                                              <div id="div_id_full_name" class="form-group"> 
                                                      <label for="id_full_name" class=" requiredField">
                                                              Full Name<span class="asteriskField">*</span> 
                                                      </label> 
                                              <div class=""> 
                                                      <input type="text" name="full_name" class="textinput textInput form-control" required="" id="id_full_name" autofocus="" value="${user_register.full_name}"> 
                                              </div> 
                                        </div> 

                                        <div id="div_id_username" class="form-group"> 
                                              <label for="id_username" class=" requiredField">
                                                      Username<span class="asteriskField">*</span> 
                                              </label> 
                                              <div class=""> 
                                                     <input type="text" name="username" value="${user_register.username}" maxlength="150" autofocus="" class="textinput textInput form-control" required="" id="id_username"> 
                                                    <small id="hint_id_username" class="form-text text-muted">
                                                              Required. 20 characters or fewer. Letters, digits and @/./+/-/_ included.
                                                    </small> 
                                              </div> 
                                          </div> 

                                        <div id="div_id_district" class="form-group"> 
                                                      <label for="id_district" class=" requiredField">
                                                              District<span class="asteriskField">*</span> 
                                                      </label> 
                                                      <div class=""> 
                                                              <select name="district" class="select form-control" id="id_district" value="${user_register.district.getDistrict_Id()}" required=""> 
                                                                          <option value=""> ------- </option>
                                                                          <c:forEach items="${district_list}" var="district">
                                                                              <option value="${district.getDistrict_Id()}"> ${district} </option>
                                                                          </c:forEach>
                                                              </select>                                                                                     
                                                      </div> 
                                          </div> 
                      
                                                <div id="div_id_email" class="form-group"> 
                                                        <label for="id_email" class=" requiredField">
                                                                  Email<span class="asteriskField">*</span> 
                                                        </label> 
                                                        <div class=""> 
                                                                  <input type="email" name="email" value="${user_register.email}" class="emailinput form-control" required="" id="id_email"> 
                                                                            <p id="error_1_id_email" class="invalid-feedback">
                                                                                    <strong>Email Already Exists</strong>
                                                                            </p> 
                                                        </div> 
                                                </div> 
                                                <div id="div_id_password1" class="form-group"> 
                                                      <label for="id_password1" class=" requiredField">
                                                                Password<span class="asteriskField">*</span> 
                                                      </label> 
                                                      <div class=""> 
                                                                <input type="password" name="password" autocomplete="new-password" class="textinput textInput form-control" required="" id="id_password1"> 
                                                                <small id="hint_id_password1" class="form-text text-muted">
                                                                          Enter A Strong Password
                                                                </small> 
                                                      </div> 
                                                </div> 
                          </div>
                          
                          <div class="form-group text-center">
                                <button class="btn btn-outline-primary" type="submit">Sign Up</button>
                          </div>
                          <hr>
                          <div class="text-center">
                                <small class="text-muted">Already Have an Account ? <a href="/login/" class="ml-2">Sign In</a></small>
                          </div>
                  </form>

          </div>
      </div>
</div>

 <%@include file="../base_views/base_bottom.jsp" %>