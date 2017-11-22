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
            	StreetNumber,
            	StreetName,
            	Street2,
            	City,
            	State,
            	Zip,
            	Zip4
        	FROM dbo.Voters
        	WHERE voterid = <cfqueryparam value="#arguments.voterid#" cfsqltype="cf_sql_integer" />
    	</cfquery>
   
    <!---	<cfif qReadOne.recordcount eq 1>--->
  	
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
                streetAddress1 = qReadOne.StreetNumber & " " & qReadOne.StreetName,
                streetAddress2 = qReadOne.Street2,
                streetCity = qReadOne.City,
                streetState = qReadOne.State,
                streetZip5 = qReadOne.Zip,
                streetZip4 = qReadOne.Zip4
                ) />
		<cfreturn voter>
        <!---<cfreturn true />--->

 	<!---   </cfif>
    
    	<cfreturn false />--->
    
	</cffunction>

</cfcomponent>