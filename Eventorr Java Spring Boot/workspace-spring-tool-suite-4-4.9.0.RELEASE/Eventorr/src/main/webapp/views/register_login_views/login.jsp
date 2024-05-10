<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@include file="../base_views/base_top.jsp"%>

<div class="container login-registration">
      <div class="row shadow-lg py-5 m-1">
            <div class="col-12">
                <h2 class="text-center slogan">Login</h2>
                <hr>
            </div>
              
            <div class="col-12 col-lg-6 col-md-6 imgs">
                  <img src="/static/images/default/undraw_secure_login_pdn4.png" alt="" class="img-fluid py-auto">
            </div>

            <div class="col-12 col-lg-5 col-md-9 row-center">
                  <div class="login-container py-3">
                       <img src="/static/images/default/undraw_Designer_by46.png" alt="" class="avatar mx-auto">
                  </div>
                  <h2 class="text-center text-primary slogan">WELCOME, USER</h2>
                  <form method="POST" autocomplete="off">
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
                                      <div id="div_id_username" class="form-group"> 
                                              <label for="id_username" class=" requiredField">
                                                    Username<span class="asteriskField">*</span> 
                                              </label> 
                                              <div class=""> 
                                                      <input type="text" name="username" value="${user_login.username}" autofocus="true" autocapitalize="none" autocomplete="username" maxlength="150" class="textinput textInput form-control" required="" id="id_username"> 
                                              </div> 
                                      </div> 
                                      <div id="div_id_password" class="form-group"> 
                                              <label for="id_password" class=" requiredField">
                                                        Password<span class="asteriskField">*</span> 
                                              </label> 
                                      <div class=""> 
                                              <input type="password" name="password" value="${user_login.password}" autocomplete="current-password" class="textinput textInput form-control" required="" id="id_password"> </div> 
                                      </div>
                          </div>
                          <div class="form-group mt-4 text-center">
                                <button class="btn btn-outline-primary" type="submit">Login</button>
                          </div>
                          <hr>
                          <div class="d-flex justify-content-around">
                                <small class="text-muted">Need an Account ? <a href="/register/" class="ml-1">Sign Up</a></small>
                                <small class="text-muted">
                  						          <a href="/password-reset/">Forgot Password ?</a>
                  				      </small>
                          </div>
                  </form>
           </div>           
      </div>
</div>

 <%@include file="../base_views/base_bottom.jsp" %>