<cfcomponent output="false">
	
	<cffunction name="init" access="public" output="false" returntype="VoterDAO">
		<cfargument name="dsn" required="true" type="string" hint="datasource" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="read" access="public" output="false" returntype="Voter">
		<cfargument name="voterid" required="true" type="numeric" hint="Voter DB id" />
		<cfset var voter="">
    	<cfset var qReadOne = "" />
    	<cfquery name="qReadOne" datasource="#variables.dsn#">
        	SELECT
            	VoterID,
            	LastName,
            	FirstName,
            	MiddleName,
            	Gender,
            	Age,
            	Precinct,
            	CongressionalDistrict,
            	LegislativeDistrict,
            	RegistrationDate,
            	Party,
            	County,
            	StreetNumber,
            	StreetName,
            	Street2,
            	City,
            	State,
            	Zip,
            	Zip4,
            	PrimaryVoted2016,
            	PresidentialPrimaryVoted2016,
            	GeneralVoted2016,
            	PrimaryVoted2014,
            	GeneralVoted2014,
            	PrimaryVoted2012,
            	GeneralVoted2012,
            	GeneralVoted2010
        	FROM dbo.Voters
        	WHERE voterid = <cfqueryparam value="#arguments.voterid#" cfsqltype="cf_sql_integer" />
    	</cfquery>
   		
    <!---	<cfif qReadOne.recordcount eq 1>--->
  		
  		<cfif len(qReadOne.Zip4) EQ 0>
  			<cfset qReadOne.Zip4 = 0>
  		</cfif>
		<cfset voter = new Voter( 
                voterid = qReadOne.voterid, 
                firstName = qReadOne.FirstName, 
                lastName = qReadOne.LastName, 
                middleName = qReadOne.MiddleName,
                gender = qReadOne.Gender,
                age = qReadOne.Age,
                precinct = qReadOne.Precinct,
                congDistrict = qReadOne.CongressionalDistrict,
                stateLegDistrict = qReadOne.LegislativeDistrict,
                regDate = qReadOne.RegistrationDate,
                party = qReadOne.Party,
                county = qReadOne.County,
                streetAddress1 = qReadOne.StreetNumber & " " & qReadOne.StreetName,
                streetAddress2 = qReadOne.Street2,
                streetCity = qReadOne.City,
                streetState = qReadOne.State,
                streetZip5 = qReadOne.Zip,
                streetZip4 = qReadOne.Zip4,
                primaryVoted2016 = qReadOne.PrimaryVoted2016,
                presidentialPrimaryVoted2016 = qReadOne.PresidentialPrimaryVoted2016,
                generalVoted2016 = qReadOne.GeneralVoted2016,
                primaryVoted2014 = qReadOne.PrimaryVoted2014,
                generalVoted2014 = qReadOne.GeneralVoted2014,
                primaryVoted2012 = qReadOne.PrimaryVoted2012,
                generalVoted2012 = qReadOne.GeneralVoted2012,
                generalVoted2010 = qReadOne.GeneralVoted2010
                ) />
		<cfreturn voter>
        <!---<cfreturn true />--->

 	<!---   </cfif>
    
    	<cfreturn false />--->
    
	</cffunction>

</cfcomponent>