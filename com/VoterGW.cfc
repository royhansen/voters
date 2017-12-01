<cfcomponent output="false">
	
	<cffunction name="init" access="public" output="false" returntype="VoterGW">
		<cfargument name="dsn" required="true" type="string" hint="datasource" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getTotalVoters" access="public" output="false" returntype="numeric">
		<cfset var qCountAll = "">
		<cfquery name="qCountAll" datasource="#variables.dsn#">
			SELECT Count(VoterID) AS totalVoters
			FROM dbo.Voters
		</cfquery>
		<cfreturn qCountAll.totalVoters> 
	</cffunction>
	
	<cffunction name="getAllVoters" access="public" output="false" returntype="Query">
		<cfargument name="rowstart" required="true" default="0">
		<cfargument name="numrows" required="true" default="50">
		<cfset var qReadAll = "" />
		<!---offset/fetch used to page query mssql 2012 or later --->
    	<cfquery name="qReadAll" datasource="#variables.dsn#">
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
            	Zip4
        	FROM dbo.Voters
        	ORDER BY LastName, FirstName ASC OFFSET #rowstart# ROWS FETCH NEXT #numrows# ROWS ONLY;
    	</cfquery>
    	<cfreturn qReadAll>
	</cffunction>
	
	
	<cffunction name="getVotersByFilter" access="public" output="false" returntype="Query">
		<cfargument name="rowstart" required="true" default="0">
		<cfargument name="numrows" required="true" default="50">
		<cfargument name="lastname" required="false" default="" type="string">
		<cfargument name="firstname" required="false" default="" type="string">
		<cfargument name="streetnumber" required="false" default="" type="numeric">
		<cfargument name="streetname" required="false" default="" type="string">
		<cfargument name="city" required="false" default="" type="string">
		<cfargument name="county" required="false" default="" type="string">
		<cfargument name="zip" required="false" default="0" type="numeric">
		<cfset var qReadAll = "" />

    	<cfquery name="qReadAll" datasource="#variables.dsn#">
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
            	Records = COUNT(1) OVER()
        	FROM dbo.Voters
        	WHERE 1 = 1
        	<cfif arguments.lastname NEQ "">
        	AND LastName LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.lastname#%" />
			</cfif>
			<cfif arguments.firstname NEQ "">
        	AND FirstName LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.firstname#%" />
			</cfif>
			<cfif arguments.streetnumber NEQ 0>
        	AND StreetNumber = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.streetnumber#" />
			</cfif>
			<cfif arguments.streetname NEQ "">
        	AND StreetName LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.streetname#%" />
			</cfif>
			<cfif arguments.city NEQ "">
        	AND City LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.city#%" />
			</cfif>
			<cfif arguments.county NEQ "">
        	AND County LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.county#%" />
			</cfif>
			<cfif arguments.zip NEQ 0>
        	AND Zip = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.zip#" />
			</cfif>
        	ORDER BY LastName, FirstName ASC OFFSET #rowstart# ROWS FETCH NEXT #numrows# ROWS ONLY;
    	</cfquery>
    	<cfreturn qReadAll>
	</cffunction>
	
	
</cfcomponent>