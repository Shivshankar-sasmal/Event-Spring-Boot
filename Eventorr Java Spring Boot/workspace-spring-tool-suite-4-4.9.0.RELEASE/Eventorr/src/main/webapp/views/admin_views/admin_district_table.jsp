<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@include file="../base_views/base_top.jsp"%>
 <%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>

<div class="container-fluid">
   <div class="row">
      <div class="col-12 col-lg-12 col-md-12 ">

            <div class="row justify-content-center my-5">
                   <a href="/admin/user_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-info m-1 px-3 event-profile-font">User Table</a>
                   <a href="/admin/district_table" class="col-10 col-lg-2 col-md-2 btn btn-success m-1 px-3 event-profile-font">Districts Table</a>
                   <a href="/admin/event_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-danger m-1 px-3 event-profile-font">Events Table</a>
                   <a href="/admin/event_participate_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-secondary m-1 px-3 event-profile-font">Event Participate Table</a>
             </div>

             <div>
                <a href="/admin/district/add" class="float-right btn btn-outline-primary mr-4">Add District</a>
                <h1 class="slogan ml-5 mt-2 text-center">District Table</h1>
            </div>
             <div class="acc px-3 shadow p-3">
                                           <div>
                                           <h4 class="text-big mb-1 pl-3">District Table - ${district_table.size()} district</h4>
                                           <div class="content">
                                               <form action="/admin/district_table"  autocomplete="off" method="GET">
                                                            <div class="p-1 rounded-pill shadow-sm mb-4 d-flex container my-4">
                                                                        <input type="search" autocomplete="off" autofocus="" value="${search_district}"  placeholder="What are you looking for ?" class="form-control border-0 rounded-pill pl-4" name="search_district">
                                                                        <button type="submit" class="btn btn-link text-primary"> <i class="fa fa-search"></i> </button> 
                                                            </div>    
                                               </form> 
                                                 <div class="content-inner">
                                                        <p class="faq-ans ml-3">
                                                              <table class="table table-responsive col-12 text-center word-space event-profile-font">
                                                                                    <thead class="bg-primary text-white big">
                                                                                          <th>Id</th>
                                                                                          <th >District</th>       
                                                                                          <th class="bg-danger">Update</th>                               
                                                                                          <th class="bg-danger">Delete</th>                               
                                                                                    </thead>
                                                                          <tbody class="small">
                                                                                <c:forEach items="${district_table}" var="district_info">
                                                                                    <tr>
                                                                                          <td>${district_info.getDistrict_Id()}</td>
                                                                                          <td>${district_info.getDistrict()}</td>
                                                                                          <td><a href="/admin/district/update/${district_info.getDistrict_Id()}" class="btn btn-sm btn-outline-primary"><small>Update</small></a></td>
                                                                                          <td><a href="/admin/district/delete/${district_info.getDistrict_Id()}" class="btn btn-sm btn-outline-danger"><small>Delete</small></a></td>
                                                                                    </tr>
                                                                              </c:forEach>
                                                                          </tbody>
                                                                      </table>
                                                        </p>
                                                  </div>
                                           </div>
                                       </div>
            <hr>
      </div>
   </div>   
</div>
             
 <%@include file="../base_views/base_bottom.jsp" %>