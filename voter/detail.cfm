<cfset voter = application.voterDAO.read(URL.voterid)>
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
          <cfoutput>
          <h1>Voter Detail (#voter.getVoterID()#)</h1>
          
          
          <div class="container-fluid">
          	
          		<div class="row">
          			<div class="col">
			      	Voter ID: #voter.getVoterID()#
			    	</div>
          		</div>
          		
				<div class="row">
			    	<div class="col">
				      	<strong>#voter.getFirstName()# #voter.getMiddleName()# #voter.getLastName()#</strong> <br />
				      	#voter.getStreetAddress1()# <cfif voter.getStreetAddress2() neq "">, #voter.getStreetAddress2()#</cfif><br />
				      	#voter.getStreetCity()# #voter.getStreetState()#, #voter.getStreetZip5()#
			    	</div>
			    	<div class="col">
			      		Gender: #voter.getGender()# <br />
			      		Age: #voter.getAge()# <br /> 
			      		Party: #voter.getParty()#
			    	</div>
			    	<div class="col">
			     		Precinct: #voter.getPrecinct()# <br />
			     		County: #voter.getCounty()# <br />
			     		Legislative District: #voter.getLegDistrict()# <br />
			     		Congressional District: #voter.getCongDistrict()# <br />
			    	</div>
			    	<div class="col">
			      	
			    	</div>
			  	</div>
			  	
			  	<div class="row">
          			<div class="col">
			      	
			    	</div>
          		</div>
			  	
			</div>
			

          <h2>Voter History</h2>
          <div class="container-fluid">
          		<div class="row">
          			<div class="col">
			      	Registration Date: #DateFormat(voter.getRegDate(),"medium")#
			      	<div class="card-deck">
			      	<div class="card" style="width: 20rem;">
					  <div class="card-header">
					  2016 Elections
					  </div>
					  <ul class="list-group list-group-flush">
					  	<li class="list-group-item">2016 Presidential Primary <cfif voter.getPresidentialPrimaryVoted2016() EQ TRUE><a class="btn btn-success" href="##" aria-label="Settings"><i class="fa fa-check fa-fw" aria-hidden="true"></i></a><cfelse><a class="btn btn-danger" href="##" aria-label="Settings"><i class="fa fa-times fa-fw" aria-hidden="true"></i></a></cfif></li>
					    <li class="list-group-item">2016 Primary <cfif voter.getPrimaryVoted2016() EQ TRUE><a class="btn btn-success" href="##" aria-label="Settings"><i class="fa fa-check fa-fw" aria-hidden="true"></i></a><cfelse><a class="btn btn-danger" href="##" aria-label="Settings"><i class="fa fa-times fa-fw" aria-hidden="true"></i></a></cfif></li>
					    <li class="list-group-item">2016 General <cfif voter.getGeneralVoted2016() EQ TRUE><a class="btn btn-success" href="##" aria-label="Settings"><i class="fa fa-check fa-fw" aria-hidden="true"></i></a><cfelse><a class="btn btn-danger" href="##" aria-label="Settings"><i class="fa fa-times fa-fw" aria-hidden="true"></i></a></cfif></li>
					    
					  </ul>
					</div>
					
					<div class="card" style="width: 20rem;">
					  <div class="card-header">
					  2014 Elections
					  </div>
					  <ul class="list-group list-group-flush">
					    <li class="list-group-item">2014 Primary <cfif voter.getGeneralVoted2014() EQ TRUE><a class="btn btn-success" href="##" aria-label="Settings"><i class="fa fa-check" aria-hidden="true"></i></a><cfelse><a class="btn btn-danger" href="##" aria-label="Settings"><i class="fa fa-times" aria-hidden="true"></i></a></cfif></li>
					    <li class="list-group-item">2014 General <cfif voter.getGeneralVoted2014() EQ TRUE><a class="btn btn-success" href="##" aria-label="Settings"><i class="fa fa-check" aria-hidden="true"></i></a><cfelse><a class="btn btn-danger" href="##" aria-label="Settings"><i class="fa fa-times" aria-hidden="true"></i></a></cfif></li>
					  </ul>
					</div>
					
					<div class="card" style="width: 20rem;">
					  <div class="card-header">
					  2012 Elections
					  </div>
					  <ul class="list-group list-group-flush">
					    <li class="list-group-item">2012 Primary <cfif voter.getGeneralVoted2012() EQ TRUE><a class="btn btn-success" href="##" aria-label="Settings"><i class="fa fa-check" aria-hidden="true"></i></a><cfelse><a class="btn btn-danger" href="##" aria-label="Settings"><i class="fa fa-times" aria-hidden="true"></i></a></cfif></li>
					    <li class="list-group-item">2012 General <cfif voter.getGeneralVoted2012() EQ TRUE><a class="btn btn-success" href="##" aria-label="Settings"><i class="fa fa-check" aria-hidden="true"></i></a><cfelse><a class="btn btn-danger" href="##" aria-label="Settings"><i class="fa fa-times" aria-hidden="true"></i></a></cfif></li>
					  </ul>
					</div>
					
					<div class="card" style="width: 20rem;">
					  <div class="card-header">
					  2010 Elections
					  </div>
					  <ul class="list-group list-group-flush">
					    <li class="list-group-item">2010 General <cfif voter.getGeneralVoted2010() EQ TRUE><a class="btn btn-success" href="##" aria-label="Settings"><i class="fa fa-check" aria-hidden="true"></i></a><cfelse><a class="btn btn-danger" href="##" aria-label="Settings"><i class="fa fa-times" aria-hidden="true"></i></a></cfif></li>
					  </ul>
					</div>
					</div><!---End Card Deck --->
		
			    	</div>
          		</div>
          </div>
         		
    
        </cfoutput>
        </main>
      </div>
    </div>
    
    
	<!-- Optional JavaScript -->
    
    <cfinclude template="/includes/footer_scripts.cfm" >
  </body>
</html>