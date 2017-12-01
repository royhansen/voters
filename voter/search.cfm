<cfparam name="url.rowstart" default="0" type="numeric">
<cfparam name="url.numrows" default="50" type="numeric">
<cfparam name="url.lastname" default="" type="string">
<cfparam name="url.firstname" default="" type="string">
<cfset numrows = url.numrows>
<cfif structKeyExists(url,"submit")>
	<!---deal with empty numeric zip code field --->
	<cfif url.zip EQ "">
		<cfset url.zip = 0>
	</cfif>
	<cfif url.streetnumber EQ "">
		<cfset url.streetnumber = 0>
	</cfif>
	<cfset voterQry = application.voterGW.getVotersByFilter(lastname="#url.lastname#",firstname="#url.firstname#",streetnumber=#url.streetnumber#,streetname="#url.streetname#",city="#url.city#",county="#url.county#",zip=#url.zip#,rowstart="#url.rowstart#")> 
	<cfset recordCount = voterQry.Records>
<cfelse>
	<cfset recordCount = application.voterGW.getTotalVoters()>
	<cfset voterQry = application.voterGW.getAllVoters()>
</cfif>
<cfif recordCount MOD numrows EQ 0>
	<cfset recordPages = recordCount \ numrows>
<cfelse>
	<cfset recordPages = (recordCount \ numrows) + 1>
</cfif>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Voter Details</title>

    <cfinclude template="/includes/head.cfm">
    
  </head>

  <body>
  	
  	<cfinclude template="/includes/top_nav.cfm">

    <div class="container-fluid">
      <div class="row">
        
        <cfinclude template="/includes/side_nav.cfm">

        <main role="main" class="col-sm-9 ml-sm-auto col-md-10 pt-3">

          <h1><i class="fa fa-search" aria-hidden="true"></i> Search Voters</h1>
          <form class="form-inline" action="search.cfm" method="get">
  			<label class="sr-only" for="lastname">Last Name</label>
  			<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="lastname" name="lastname" placeholder="Last Name">
			<label class="sr-only" for="firstname">First Name</label>
  			<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="firstname" name="firstname" placeholder="First Name">
  			<label class="sr-only" for="streetnumber">Street Number</label>
  			<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="streetnumber" name="streetnumber" placeholder="Street Number">
  			<label class="sr-only" for="streetname">Street Name</label>
  			<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="streetname" name="streetname" placeholder="Street Name">
  			<label class="sr-only" for="city">City</label>
  			<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="city" name="city" placeholder="City">
  			<label class="sr-only" for="zip">Zip</label>
  			<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="zip" name="zip" placeholder="Zip">
  			<label class="sr-only" for="county">County</label>
  			<input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="county" name="county" placeholder="County">
  			<button type="submit" class="btn btn-primary" name="submit" value="submit">Submit</button>
		  </form>
			
		<hr />	
			
          <h2>Search Results - <cfoutput>#recordCount#</cfoutput></h2>
          <div class="container-fluid">
          		<table class="table table-striped">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col">Voter ID</th>
				      <th scope="col">Last Name</th>
				      <th scope="col">First Name</th>
				      <th scope="col">Age</th>
				      <th scope="col">Address</th>
				      <th scope="col">City</th>
				      <th scope="col">Zip</th>
				      <th scope="col">County</th>
				      <th scope="col">Party</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<cfoutput query="voterQry">
				    <tr>
				      <th scope="row"><a href="detail.cfm?voterid=#VoterID#">#VoterID#</a></th>
				      <td>#LastName#</td>
				      <td>#FirstName#</td>
				      <td>#Age#</td>
				      <td>#StreetNumber# #StreetName# #Street2#</td>
				      <td>#City#</td>
				      <td>#Zip#</td>
				      <td>#County#</td>
				      <td>#Party#</td>
				    </tr>
				    </cfoutput>
				  </tbody>
				</table>
				
				<cfif recordPages LTE 10>
				
				<nav aria-label="Recordset Paging">
					  <ul class="pagination">
					    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
					    <cfloop from="1" to="#recordPages#" index="page">
					    	<cfset startrow = (numrows * page)-(numrows-1)>
					    	<cfoutput><li class="page-item"><a class="page-link" href="search.cfm?#CGI.QUERY_STRING#&rowstart=#startrow#">#page#</a></li></cfoutput>
					    </cfloop>
					    <!---<li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>--->
					    <li class="page-item"><a class="page-link" href="#">Next</a></li>
					  </ul>
				</nav>
				
				</cfif>
				
				<cfoutput>Pages: #recordPages#</cfoutput>
          </div>
         
        </main>
      </div>
    </div>
    
    
	<!-- Optional JavaScript -->
    
    <cfinclude template="/includes/footer_scripts.cfm" >

  </body>
</html>