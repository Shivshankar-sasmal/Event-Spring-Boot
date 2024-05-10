<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@include file="../base_views/base_top.jsp"%>
 <%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>

<div class="container login-registration">
      <div class="row shadow-lg py-5 m-1">
            <div class="col-12">
                <h2 class="text-center slogan">Participate Form</h2>
                <hr>
            </div>
              
            <div class="col-12 col-lg-6 col-md-6 imgs">
                  <img src="/static/images/default/undraw_web_developer_p3e5.png" alt="" class="img-fluid py-auto">
            </div>
            <div class="col-12 col-lg-5 col-md-9 row-center">
              <h2 class="text-center text-primary slogan">PARTICIPATE, HERE</h2>
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
						  <div id="div_id_phone" class="form-group"> 
						  		<label for="id_phone" class=" requiredField">
						                Phone<span class="asteriskField">*</span> </label> 
						                <div class=""> 
						                	<input type="number" name="phone_number" autofocus="" class="numberinput form-control" required id="id_phone"> <small id="hint_id_phone" class="form-text text-muted">Enter Mobile Number Without Country Code</small> 
						                </div> 
						    </div> 
						    <div id="div_id_college" class="form-group"> 
						    	 <label for="id_college" class=" requiredField">
						                College<span class="asteriskField">*</span> </label> 
						                <div class=""> 
						                	<input type="text" name="college" maxlength="150" class="textinput textInput form-control" required id="id_college"> 
						                </div> 
						     </div>
					</div>
						      <div class="form-group mt-4 text-center">
						                <button class="btn btn-outline-primary" type="submit">Participate</button>
						      </div>
						 <hr>
                  </form>
           </div>           
      </div>

      <div class="col-12 alert alert-info m-1 mt-5 text-center">
                <li type="circle"> Please, make sure that you <b>It's Not a Fake Event</b> Because <b>We would not Be Responsible</b> for <b>any Loss</b></li>
      </div>
</div>          
             
 <%@include file="../base_views/base_bottom.jsp" %>