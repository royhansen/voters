<cfcomponent>
	
    <cfset this.name = "IDVoterApp">
    <cfset this.applicationTimeout = CreateTimeSpan(0, 0, 30, 0)>
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = CreateTimeSpan(0, 0, 20, 0)>
    <cfset this.loginStorage = "session">
<!---    <cfset this.mappings = {
        "/com" = expandPath('/com')
    }>--->

    <cffunction name="onApplicationStart" output="false">
    	<cfset application.DSN = "voters">
<!---   <cfset application.userDAO = new com.UserDAO(application.DSN)>
    	<cfset application.userGW = new com.UserGW(application.DSN)>--->
    	<cfset application.voterDAO = new com.VoterDAO(application.DSN)>
    	<!---<cfset application.voterGW = new com.VoterGW(application.DSN)>--->
        <cfreturn true>
    </cffunction>

    <cffunction name="onSessionStart" output="false">
    </cffunction>

    <!---the target page is passed in for reference, but you are not required to include it--->
    <cffunction name="onRequestStart" output="false">
    	<cfargument name="targetPage" type="string">
    	<cfif structKeyExists(URL,"refreshapp")>
    		<cfset this.onApplicationStart()>
 		</cfif>
 		
 		<!---Authenticate User--->
 		<!---<cfif isDefined("URL.logout")>
    		<cfset structDelete(Session,"user")>
    		<cflocation addtoken="false" url="/index.cfm" >
 		</cfif>
 		<cfif NOT structKeyExists(Session,"user") AND not structKeyExists(Form,"login")>
 			<cfinclude template="login.cfm" >
 			<cfabort>
 		<cfelseif structKeyExists(Session,"user")>
 		<cfelse>	
 			<cfif Form.email EQ "" OR Form.password eq "">
 				<cfoutput><h2>You must enter text in both the User Name and Password fields.</h2></cfoutput>
 				<cfinclude template="login.cfm"> 
	            <cfabort> 	
 			<cfelse>
 			
 				<cfquery name="loginQry" dataSource="#application.dsn#"> 
	                SELECT userID, userEmail, userPassword, userSalt, userFirstName, userLastName, userRole 
	                FROM Users 
	                WHERE userEmail = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(form.email)#"> 
	            </cfquery> 
				<cfif loginQry.RecordCount EQ 1> 
	            	<!---<cfif loginQry.userPassword EQ Hash(trim(form.password) & loginQry.userSalt, "SHA-512")> --->
	            		<cfif loginQry.userPassword EQ trim(Form.password)>
	            		<cfoutput>
	            			#loginQry.userSalt#
	            		</cfoutput>        
	            		<!---Authenticated --->
    					<cfscript>
    						Session.user = StructNew();
    						Session.user.userid = "#loginQry.userID#";
    						Session.user.useremail = "#loginQry.userEmail#";
    						Session.user.userfirstname = "#loginQry.userFirstName#";
    						Session.user.userlastname = "#loginQry.userLastName#";
    						Session.user.userrole = "#loginQry.userRole#";
    					</cfscript>
 					<cfelse>
 						<!---Bad Password --->
 						<cfoutput><h2>Your password was incorrect. Please try again</h2></cfoutput>
 						<cfoutput>
	            			DB Pass: #loginQry.userPassword# <br>
	            			DB Salt: #loginQry.userSalt# <br>
	            			Form pW: #Form.password# <br>
	            			Hash: #hash(form.password & loginQry.userSalt, "SHA-512")#
	            		</cfoutput>      
	                	<cfinclude template="login.cfm"> 
	                	<cfabort> 
	            	</cfif>
	            <cfelse> 
	            	<!---Bad Username --->
	                <cfoutput><h2>Your username was not found. Please try again</h2></cfoutput>     
	                <cfinclude template="login.cfm"> 
	                <cfabort> 
	            </cfif> 
 				
 			</cfif>	
 		</cfif>--->
 		
 		
 		<!---<cflogin> 
	        <cfif NOT IsDefined("cflogin")> 
	            <cfinclude template="login.cfm"> 
	            <cfabort> 
	        <cfelse> 
	            <cfif cflogin.name IS "" OR cflogin.password IS ""> 
	                <cfoutput><h2>You must enter text in both the User Name and Password fields.</h2></cfoutput> 
	                <cfinclude template="login.cfm"> 
	                <cfabort> 
	            <cfelse> 
	                <cfquery name="loginQuery" dataSource="#application.dsn#"> 
	                SELECT userID, userPassword, userSalt, userRole 
	                FROM Users 
	                WHERE userID = '#cflogin.name#' AND Password = '#cflogin.password#' 
	                </cfquery> 
	                <cfif loginQuery.Roles NEQ ""> 
	                    <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#" roles="#loginQuery.Roles#"> 
	                <cfelse> 
	                    <cfoutput><H2>Your login information is not valid.<br>Please Try again</H2></cfoutput>     
	                    <cfinclude template="loginform.cfm"> 
	                    <cfabort> 
	                </cfif> 
	            </cfif>     
	        </cfif> 
	    </cflogin>--->
	</cffunction>

	<!---<cffunction name="onRequest" output="false">
    	<cfargument name="targetPage" type="string">
 		<cfinclude template="#arguments.targetPage#">
	</cffunction>--->

	<cffunction name="onRequestEnd" output="false">
		
	</cffunction>	

    <cffunction name="onSessionEnd" output="false">
    	<cfargument name="SessionScope" type="struct">
    	<cfargument name="ApplicationScope" type="struct">
    </cffunction>

<!---    <cffunction name="onApplicationEnd" output="false">
    	<cfargument name="ApplicationScope" type="struct">
    </cffunction>--->

	<!---<cffunction name="onError" output="false">
    	<cfargument name="Exception" type="any">
    	<cfargument name="EventName" type="string">
    </cffunction>--->

</cfcomponent> 