<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@include file="../base_views/base_top.jsp"%>

 <div class="container-fluid bg-light">
 						<h1 class="slogan ml-5 mt-2">All Super User</h1>
 						<center>
 						<div class="row container">
 							<c:forEach items="${superusers}" var="superuser">
 								<div class="col-12 col-lg-4 col-md-4 col-sm-12 my-2">
 									<div class="shadow rounded-raised-rectangle p-4">
 										<div class="d-flex justify-content-start">
 											<div class="bg-primary text-white rounded-circle px-3 py-2 h4">${superuser.getUser_Id()}</div>
 											<div class="my-auto text-big ml-2">${superuser.username}</div>
 										</div>
 									</div>
 								</div>
 							</c:forEach>
 						</div>
 						</center>

                  		<div class="row">
                  				<div class="col-12 col-lg-12 col-md-12 py-5">
                  							<h1 class="slogan ml-5 mt-2">All DataBase Tables</h1>

                  							<div class="row justify-content-center my-5">
							                        <a href="/admin/user_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-info m-1 px-3 event-profile-font">User Table</a>
							                        <a href="/admin/district_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-success m-1 px-3 event-profile-font">Districts Table</a>
							                        <a href="/admin/event_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-danger m-1 px-3 event-profile-font">Events Table</a>
							                        <a href="/admin/event_participate_table" class="col-10 col-lg-2 col-md-2 btn btn-outline-secondary m-1 px-3 event-profile-font">Event Participate Table</a>
							                  </div>

                  							 <div class="acc px-3 shadow p-3">
							                      <div><a href="/admin/user/add" class="float-right btn btn-outline-primary mr-4 my-2">Add Users</a></div>
							                      <div>							                      	
							                      </div>
							                      <a href="/admin/user_table"><h4 class="text-big mb-1 pl-3">1. User Table - ${user_table_size} users Present</h4></a>
							                      <div class="content mt-5">
							                            <div class="content-inner">
							                                  <p class="faq-ans ml-3">
							                                    		<table class="table table-responsive col-12 text-center word-space event-profile-font">
				                                                                    <thead class="bg-primary text-white big">
				                                                                          <th >User_Id</th>
				                                                                          <th>Username</th>
				                                                                          <th >Full Name</th>
				                                                                          <th>Email</th>
				                                                                          <th>Password</th>
				                                                                          <th >Disrict</th>
				                                                                          <th>Image</th>
				                                                                          <th>Something About You</th>
				                                                                          <th>Active</th>
				                                                                          <th>Superuser</th>
				                                                                          <th>Account Created</th>
				                                                                    </thead>
				                                                          <tbody class="small">
				                                                                		<tr>
				                                                                				<td>bigint(20)</td>
						                                                                		<td>varchar(50)</td>
						                                                                		<td>varchar(50)</td>
						                                                                		<td>varchar(50)</td>
						                                                                		<td>varchar(80)</td>
						                                                                		<td>bigint(20)</td>
						                                                                		<td>varchar(80)</td>
						                                                                		<td>varchar(200)</td>
						                                                                		<td>int(11)</td>
						                                                                		<td>int(11)</td>
						                                                                		<td>datetime(6)</td>
				                                                                		</tr>
				                                                                		<tr>
				                                                                				<td>Primary Key</td>
						                                                                		<td>Unique Key</td>						                                                                		
						                                                                		<td>Not Null</td>	
						                                                                		<td>Unique Key</td>		
						                                                                		<td>Not Null</td>						                                                                		
						                                                                		<td>Foreign Key</td>						                                                                	
						                                                                		<td>Not Null</td>						                                                                		
						                                                                		<td>Not Null</td>						                                                                		
						                                                                		<td>Not Null</td>						                                                                		
						                                                                		<td>Not Null</td>						                                                                		
						                                                                		<td>Not Null</td>						                                                                		
				                                                                		</tr>
				                                                          </tbody>
				                                                      </table>
							                                  </p>
							                            </div>
							                      </div>
							                  </div>

							                  <div class="acc px-3 shadow p-3 mt-3">
							                  	  <div><a href="/admin/district/add" class="float-right btn btn-outline-primary mr-4">Add District</a></div>
							                      <a href="/admin/district_table"><h4 class="text-big mb-1 pl-3">2. District Table - ${district_table_size} district</h4></a>
							                      <div class="content">
							                            <div class="content-inner">
							                                  <p class="faq-ans ml-3">
							                                    		<table class="table table-responsive col-12 text-center word-space event-profile-font">
				                                                                    <thead class="bg-primary text-white big">
				                                                                          <th>district_id</th>
				                                                                          <th >district</th>                                                             
				                                                                    </thead>
							                                                        <tbody class="small">
							                                                              <tr>
							                                                               		<td>bigint(20)</td>			
							                                                               		<td>varchar(50)</td>			
							                                                              </tr>
							                                                              <tr>
							                                                               		<td>Primary Key</td>			
							                                                               		<td>Unique Key</td>			
							                                                              </tr>
							                                                        </tbody>
				                                                      </table>
							                                  </p>
							                            </div>
							                      </div>
							                  </div>

							                  <div class="acc px-3 shadow p-3 mt-3">
							                      <a href="/admin/event_table"><h4 class="text-big mb-1 pl-3">3. Event Table - ${event_table_size} events</h4></a>
							                      <div class="content">
							                            <div class="content-inner">
							                                  <p class="faq-ans ml-3">
							                                    		<table class="table table-responsive col-12 text-center word-space event-profile-font">
				                                                                    <thead class="bg-primary text-white big">
				                                                                          <th>event_id</th>
				                                                                          <th>college_url</th>
				                                                                          <th>content</th>
				                                                                          <th>date_posted</th>
				                                                                          <th>event_date</th>
				                                                                          <th>event_poster_image</th>
				                                                                          <th>event_type</th>
				                                                                          <th>max_seats</th>
				                                                                          <th>title</th>
				                                                                          <th>district</th>
				                                                                          <th>user</th>
				                                                                         				                                                                          
				                                                                    </thead>
				                                                          <tbody class="small">
				                                                                		<tr>
						                                                                      <td>bigint(20)</td>
						                                                                      <td>varchar(255)</td>
						                                                                      <td>varchar(400)</td>
						                                                                      <td>datetime(6)</td>
						                                                                      <td>datetime(6)</td>
						                                                                      <td>varchar(100)</td>
						                                                                      <td>varchar(15)</td>
						                                                                      <td>int(11)</td>
						                                                                      <td>varchar(75)</td>
						                                                                      <td>bigint(20)</td>
						                                                                      <td>bigint(20)</td>
						                                                                </tr>
						                                                                <tr>
						                                                                      <td>Primary Key</td>
						                                                                      <td>Null</td>
						                                                                      <td>Not Null</td>
						                                                                      <td>Not Null</td>
						                                                                      <td>Not Null</td>
						                                                                      <td>Not Null</td>
						                                                                      <td>Not Null</td>
						                                                                      <td>Not Null</td>
						                                                                      <td>Not Null</td>
						                                                                      <td>Foreign Key</td>
						                                                                      <td>Foreign Key</td>
						                                                                </tr>
				                                                          </tbody>
				                                                      </table>
							                                  </p>
							                            </div>
							                      </div>
							                  </div>

							                  <div class="acc px-3 shadow p-3 mt-3">
							                      <a href="/admin/event_participate_table"><h4 class="text-big mb-1 pl-3">4. Participate Table - ${event_participate_table_size} forms</h4></a>
							                      <div class="content">
							                            <div class="content-inner">
							                                  <p class="faq-ans ml-3">
							                                    		<table class="table table-responsive col-12 text-center word-space event-profile-font">
				                                                                    <thead class="bg-primary text-white big">
				                                                                          <th>participate_id</th>  
				                                                                          <th>college</th>        
				                                                                          <th>form_date</th>
				                                                                          <th>phone_number</th>
				                                                                          <th>event</th>
				                                                                          <th>user</th>
				                                                                    </thead>
				                                                          <tbody class="small">
				                                                          				<tr>
				                                                          					<td>bigint(20)</td>
				                                                          					<td>varchar(70)</td>
				                                                          					<td>datetime(6)</td>
				                                                          					<td>varchar(10)</td>
				                                                          					<td>bigint(20)</td>
				                                                          					<td>bigint(20)</td>
				                                                          				</tr>
				                                                                		<tr>
				                                                                			<td>Primary Key</td>
				                                                                			<td>Not Null</td>
				                                                                			<td>Not Null</td>
				                                                                			<td>Not Null</td>
				                                                                			<td>Foreign Key</td>
				                                                                			<td>Foreign Key</td>
						                                                                </tr>
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