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
        	WHERE id = <cfqueryparam value="#arguments.voterid#" cfsqltype="cf_sql_integer" />
    	</cfquery>
   
    <!---	<cfif qReadOne.recordcount eq 1>--->
  	
		<cfset voter = new Voter( 
                id = qReadOne.id, 
                firstName = qReadOne.firstName, 
                lastName = qReadOne.lastName, 
                middleName = qReadOne.middleName,
                gender = qReadOne.gender,
                modeledEthnicity = qReadOne.modeledEthnicity,
                selfReportedEthnicity = qReadOne.selfReportedEthnicity,
                religion = qReadOne.religion,
                birthYear = qReadOne.birthYear,
                birthMonth = qReadOne.birthMonth,
                birthDay = qReadOne.birthDay,
                age = qReadOne.age,
                ageRange = qReadOne.ageRange,
                jurisdictionCode = qReadOne.jurisdictionCode,
                jurisdictionName = qReadOne.jurisdictionName,
                precinct = qReadOne.precinct,
                precinctName = qReadOne.precinctName,
                congDistrict = qReadOne.congDistrict,
                stateLegDistrict = qReadOne.stateLegDistrict,
                regDate = qReadOne.regDate,
                party = qReadOne.party,
                address1 = qReadOne.address1,
                address2 = qReadOne.address2,
                city = qReadOne.city,
                state = qReadOne.state,
                zip5 = qReadOne.zip5,
                zip4 = qReadOne.zip4,
                mailSortCodeRoute = qReadOne.mailSortCodeRoute,
                mailDeliveryPt = qReadOne.mailDeliveryPt,
                mailDeliveryPtChkDigit = qReadOne.mailDeliveryPtChkDigit,
                mailLineOfTravel = qReadOne.mailLineOfTravel,
                mailLineOfTravelOrder = qReadOne.mailLineOfTravelOrder,
                mailDPVStatus = qReadOne.mailDPVStatus,
                latitude = qReadOne.latitude,
                longitude = qReadOne.longitude,
                metroType = qReadOne.metroType,
                metroTypeUrbanPer = qReadOne.metroTypeUrbanPer,
                metroTypeRuralPer = qReadOne.metroTypeRuralPer,
                landlinePhone = qReadOne.landlinePhone,
                landlinePhoneReliabilityCode = qReadOne.landlinePhoneReliabilityCode,
                landlinePhoneMatchLevel = qReadOne.landlinePhoneMatchLevel,
                landlineFTCDoNotCall = qReadOne.landlineFTCDoNotCall,
                idCalc = qReadOne.idCalc,
                crapoSwing = qReadOne.crapoSwing,
                trumpCoattail = qReadOne.trumpCoattail,
                trumpDownDraft = qReadOne.trumpDownDraft
                ) />
		<cfreturn voter>
        <!---<cfreturn true />--->

 	<!---   </cfif>
    
    	<cfreturn false />--->
    
	</cffunction>

</cfcomponent>