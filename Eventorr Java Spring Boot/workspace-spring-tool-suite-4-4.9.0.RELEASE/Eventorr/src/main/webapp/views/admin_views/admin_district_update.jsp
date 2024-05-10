<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="../base_views/base_top.jsp"%>

<div class="container login-registration">
      <div class="row shadow-lg py-5 m-1">
            <div class="col-12">
                <h2 class="text-center slogan">Admin District Create &amp; Update Form</h2>
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
                                                             District Identity<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="district_id" value="${district_record.getDistrict_Id()}" class="textinput textInput form-control"  id="id_user_id" disabled="">        
                                                              <small class="form-text text-muted">Provided Automatically for Security Purpose</small>
                                                        </div>
                                                </div>
                                      </div>
                                      <div class="col-12 col-lg-10 col-md-10 col-sm-12 small">
                                                <div id="div_id_full_name" class="form-group">
                                                        <label for="id_full_name" class=" requiredField">
                                                                 District Name<span class="asteriskField">*</span>
                                                        </label>            
                                                        <div class="">
                                                              <input type="text" name="district" autofocus="" value="${district_record.getDistrict()}" class="textinput textInput form-control" required="" id="id_full_name">        
                                                        </div>
                                                </div>
                                      </div>
                                      
                          			<div class="col-12"><center><button class="btn btn-outline-primary" type="Submit">Save</button></center></div>
                </form>
            </div>    
      </div>
</div>

<%@include file="../base_views/base_bottom.jsp" %>