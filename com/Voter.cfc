<cfcomponent output="false">
	<cfproperty name="voterid" default="0" required="true" type="numeric">
	<cfproperty name="firstName" default="" required="true" type="string">
	<cfproperty name="lastName" default="" required="true" type="string">
	<cfproperty name="middleName" default="" required="true" type="string" >
	<cfproperty name="gender" default="" required="true" type="string">
	<cfproperty name="age" default="" required="false" type="numeric">
	<cfproperty name="precinct" default="" required="true" type="string">
	<cfproperty name="congDistrict" default="0" required="true" type="numeric">
	<cfproperty name="legDistrict" default="0" required="true" type="numeric">
	<cfproperty name="regDate" required="false" type="date">
	<cfproperty name="party" default="" required="false" type="string">
	<cfproperty name="streetAddress1" default="" required="false" type="string">
	<cfproperty name="streetAddress2" default="" required="false" type="string">
	<cfproperty name="streetCity" default="" required="false" type="string">
	<cfproperty name="streetState" default="" required="false" type="string">
	<cfproperty name="streetZip5" default="0" required="false" type="numeric">
	<cfproperty name="streetZip4" default="0" required="false" type="numeric">
	
	
	<cffunction name="init" access="public" hint="Person constructor" returntype="Voter" output="false">
		<cfargument name="voterid" type="numeric" default="0" required="true" hint="The DB id">
		<cfargument name="firstName" type="string" default="" required="true" hint="Persons First Name">
		<cfargument name="lastName" type="string" default="" required="true" hint="Persons Last Name">
		<cfargument name="middleName" type="string" default="" required="true" hint="Persons Middle Name">
		<cfargument name="gender" type="string" default="" required="true" hint="Persons Gender">
		<cfargument name="age" type="string" default="" required="false" hint="Persons Age">
		<cfargument name="precinct" type="string" default="" required="false" hint="Precinct Identifier">
		<cfargument name="congDistrict" type="numeric" default="0" required="false" hint="Congressional District">
		<cfargument name="legDistrict" type="numeric" default="0" required="false" hint="State Legislative District">
		<cfargument name="regDate" type="string" default="1/1/1900" required="false" hint="Voter Registration Date">
		<cfargument name="party" type="string" default="U" required="false" hint="Voter Primary Party">
		<cfargument name="streetAddress1" type="string" default="" required="false" hint="Voter mailing address1">
		<cfargument name="streetAddress2" type="string" default="" required="false" hint="Voter mailing address2">
		<cfargument name="streetCity" type="string" default="" required="false" hint="Voter mailing city">
		<cfargument name="streetState" type="string" default="" required="false" hint="Voter mailing state">
		<cfargument name="streetZip5" type="numeric" default="0" required="false" hint="Voter mailing zip5">
		<cfargument name="streetZip4" type="numeric" default="0" required="false" hint="Voter mailing zip4">
		
		<cfset variables.instance = structNew() /> 
		
		<cfscript>
			setVoterId(arguments.voterid);
			setFirstName(arguments.firstName);
			setLastName(arguments.lastName);
			setMiddleName(arguments.middleName);
			setGender(arguments.gender);
			setAge(arguments.age);
			setPrecinct(arguments.precinct);
			setCongDistrict(arguments.congDistrict);
			setLegDistrict(arguments.stateLegDistrict);
			setRegDate(arguments.regDate);
			setParty(arguments.party);
			setStreetAddress1(arguments.streetAddress1);
			setStreetAddress2(arguments.streetAddress2);
			setStreetCity(arguments.streetCity);
			setStreetState(arguments.streetState);
			setStreetZip5(arguments.streetZip5);
			setStreetZip4(arguments.streetZip4);
		</cfscript>
		
		<cfreturn this />
		
	</cffunction> 
	<!---setters/getter voter details --->
	<cffunction name="setVoterId" returntype="void" output="false">
		<cfargument name="voterid" default="0" type="numeric" required="true">
		<cfset variables.instance.voterid = arguments.voterid>
	</cffunction>
	<cffunction name="getVoterId" returntype="string" output="false">
		<cfreturn variables.instance.voterid>
	</cffunction>
	
	<cffunction name="setFirstName" returntype="void" output="false">
		<cfargument name="firstName" default="" type="string" required="true">
		<cfset variables.instance.firstName = arguments.firstName>
	</cffunction>
	<cffunction name="getFirstName" returntype="string" output="false">
		<cfreturn variables.instance.firstName>
	</cffunction>
	
	<cffunction name="setLastName" returntype="void" output="false">
		<cfargument name="lastName" default="" type="string" required="true">
		<cfset variables.instance.lastName = arguments.lastName>
	</cffunction>
	<cffunction name="getLastName" returntype="string" output="false">
		<cfreturn variables.instance.lastName>
	</cffunction>
	
	<cffunction name="setMiddleName" returntype="void" output="false">
		<cfargument name="middleName" default="" type="string" required="true">
		<cfset variables.instance.middleName = arguments.middleName>
	</cffunction>
	<cffunction name="getMiddleName" returntype="string" output="false">
		<cfreturn variables.instance.middleName>
	</cffunction>
	
	<cffunction name="setGender" returntype="void" output="false">
		<cfargument name="gender" default="" type="string" required="true">
		<cfset variables.instance.gender = arguments.gender>
	</cffunction>
	<cffunction name="getGender" returntype="string" output="false">
		<cfreturn variables.instance.gender>
	</cffunction>
	
	<cffunction name="setAge" returntype="void" output="false">
		<cfargument name="age" default="" type="string" required="true">
		<cfset variables.instance.age = arguments.age>
	</cffunction>
	<cffunction name="getAge" returntype="string" output="false">
		<cfreturn variables.instance.age>
	</cffunction>
	
	
	<!---getters/setter voter district information --->
	
	<cffunction name="setPrecinct" returntype="void" output="false">
		<cfargument name="precinct" default="" type="string" required="true">
		<cfset variables.instance.precinct = arguments.precinct>
	</cffunction>
	<cffunction name="getPrecinct" returntype="string" output="false">
		<cfreturn variables.instance.precinct>
	</cffunction>
	
	<cffunction name="setCongDistrict" returntype="void" output="false">
		<cfargument name="congDistrict" default="0" type="numeric" required="true">
		<cfset variables.instance.congDistrict = arguments.congDistrict>
	</cffunction>
	<cffunction name="getCongDistrict" returntype="numeric" output="false">
		<cfreturn variables.instance.congDistrict>
	</cffunction>
	
	<cffunction name="setLegDistrict" returntype="void" output="false">
		<cfargument name="legDistrict" default="0" type="numeric" required="true">
		<cfset variables.instance.legDistrict = arguments.legDistrict>
	</cffunction>
	<cffunction name="getLegDistrict" returntype="numeric" output="false">
		<cfreturn variables.instance.legDistrict>
	</cffunction>
	
	<cffunction name="setRegDate" returntype="void" output="false">
		<cfargument name="regDate" default="1/1/1900" type="string" required="true">
		<cfif arguments.regDate EQ ''><cfset arguments.regDate="1/1/1900"></cfif><!---To fix null (or '') passed in from voterDAO from read function db --->
		<cfset variables.instance.regDate = parseDateTime(arguments.regDate)>
	</cffunction>
	<cffunction name="getRegDate" returntype="date" output="false">
		<cfreturn variables.instance.regDate>
	</cffunction>
	
	<cffunction name="setParty" returntype="void" output="false">
		<cfargument name="party" default="" type="string" required="true">
		<cfset variables.instance.party = arguments.party>
	</cffunction>
	<cffunction name="getParty" returntype="string" output="false">
		<cfreturn variables.instance.party>
	</cffunction>
	
	<!---getters/setters voter address information --->
	
	<cffunction name="setStreetAddress1" returntype="void" output="false">
		<cfargument name="streetAddress1" default="" type="string" required="true">
		<cfset variables.instance.streetAddress1 = arguments.streetAddress1>
	</cffunction>
	<cffunction name="getStreetAddress1" returntype="string" output="false">
		<cfreturn variables.instance.streetAddress1>
	</cffunction>
	
	<cffunction name="setStreetAddress2" returntype="void" output="false">
		<cfargument name="streetAddress2" default="" type="string" required="true">
		<cfset variables.instance.streetAddress2 = arguments.streetAddress2>
	</cffunction>
	<cffunction name="getStreetAddress2" returntype="string" output="false">
		<cfreturn variables.instance.streetAddress2>
	</cffunction>
	
	<cffunction name="setStreetCity" returntype="void" output="false">
		<cfargument name="streetCity" default="" type="string" required="true">
		<cfset variables.instance.streetCity = arguments.streetCity>
	</cffunction>
	<cffunction name="getStreetCity" returntype="string" output="false">
		<cfreturn variables.instance.streetCity>
	</cffunction>
	
	<cffunction name="setStreetState" returntype="void" output="false">
		<cfargument name="streetState" default="" type="string" required="true">
		<cfset variables.instance.streetState = arguments.streetState>
	</cffunction>
	<cffunction name="getStreetState" returntype="string" output="false">
		<cfreturn variables.instance.streetState>
	</cffunction>
	
	<cffunction name="setStreetZip5" returntype="void" output="false">
		<cfargument name="streetZip5" default="0" type="numeric" required="true">
		<cfset variables.instance.streetZip5 = arguments.streetZip5>
	</cffunction>
	<cffunction name="getStreetZip5" returntype="numeric" output="false">
		<cfreturn variables.instance.streetZip5>
	</cffunction>
	
	<cffunction name="setStreetZip4" returntype="void" output="false">
		<cfargument name="streetZip4" default="0" type="numeric" required="true">
		<cfset variables.instance.streetZip4 = arguments.streetZip4>
	</cffunction>
	<cffunction name="getStreetZip4" returntype="numeric" output="false">
		<cfreturn variables.instance.streetZip4>
	</cffunction>
	
	<!---Return memento for inspection --->
	
	<cffunction name="getMemento" access="public" output="false" hint="I return a dumped struct of the variables.instance scope.">
  		<cfreturn variables.instance />
	</cffunction>
	
</cfcomponent>