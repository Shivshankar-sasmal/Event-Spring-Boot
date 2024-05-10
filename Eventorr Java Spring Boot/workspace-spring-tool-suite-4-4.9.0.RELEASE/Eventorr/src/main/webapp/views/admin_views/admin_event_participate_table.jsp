<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@include file="../base_views/base_top.jsp"%>
 <%@ page import="org.springframework.web.servlet.support.ServletUriComponentsBuilder" %>

<div class="container-fluid">
   <div class="row">
      <div class="col-12 col-lg-12 col-md-12 ">

            <div class="row justify-content-center my-5">
                   <a href="/admin/user_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-info m-1 px-3 event-profile-font">User Table</a>
                   <a href="/admin/district_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-success m-1 px-3 event-profile-font">Districts Table</a>
                   <a href="/admin/event_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-danger m-1 px-3 event-profile-font">Events Table</a>
                   <a href="/admin/event_participate_table" class="col-10 col-lg-2 col-md-2 btn btn-secondary m-1 px-3 event-profile-font">Event Participate Table</a>
             </div>

            <h1 class="slogan ml-5 mt-2 text-center">Event Participate Table</h1>
            <div class="acc px-3 shadow p-3 mt-3">
                                    <h4 class="text-big mb-1 pl-3">Participate Table - ${event_participate_table.size()} forms</h4>
                                    <div class="content">
                                        <form action="/admin/event_participate_table"  autocomplete="off" method="GET">
                                              <div class="p-1 rounded-pill shadow-sm mb-4 d-flex container my-4">
                                                          <input type="search" autocomplete="off" autofocus="" value="${search_event_participate}"  placeholder="What are you looking for ?" class="form-control border-0 rounded-pill pl-4" name="search_event_participate">
                                                          <button type="submit" class="btn btn-link text-primary"> <i class="fa fa-search"></i> </button> 
                                              </div>    
                                 </form> 
                                          <div class="content-inner">
                                                <p class="faq-ans ml-3">
                                                      <table class="table table-responsive col-12 text-center word-space event-profile-font">
                                                                            <thead class="bg-primary text-white big">
                                                                                  <th>Id</th>
                                                                                  <th>User</th>
                                                                                  <th>Phone Number</th>
                                                                                  <th>Event Id</th>
                                                                                  <th>Event</th>
                                                                                  <th>Event Created By</th>
                                                                                  <th>Create Date</th>                    
                                                                                  <th class="bg-danger">Delete</th>
                                                                            </thead>
                                                                  <tbody class="small">
                                                                        <c:forEach items="${event_participate_table}" var="event_participate_info">
                                                                            <tr>
                                                                              <td>${event_participate_info.getParticipate_id()}</td>
                                                                              <td>${event_participate_info.getUser().getUsername()}</td>
                                                                              <td>+91${event_participate_info.getPhone_number()}</td>
                                                                              <td>${event_participate_info.getEvent().getEvent_id()}</td>
                                                                              <td>${event_participate_info.getEvent().getTitle()}</td>
                                                                              <td>${event_participate_info.getEvent().getUser_author().getUsername()}</td>
                                                                              <td><fmt:formatDate type="both" value="${event_participate_info.getForm_date()}" /></td>
                                                                              <td><a href="admin/participate_form_delete/${event_participate_info.getParticipate_id()}" class="btn btn-sm btn-outline-danger"><small>Delete</small></a></td>
                                                                            </tr>
                                                                      </c:forEach>
                                                                  </tbody>
                                                              </table>
                                                </p>
                                          </div>
                                    </div>
                                </div>
      </div>
   </div>   
</div>
             
 <%@include file="../base_views/base_bottom.jsp" %>