<cfsetting enablecfoutputonly=true>
<!-----------------------------------------------------------------------
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
This is the display of the frameworks MessageBox.
You can customize this as you want via your own css and the
messagebox_style_override setting flag in your configuration file.

----------------------------------------------------------------------->
<!--- Set the css class --->
<cfif msgStruct.type eq "error">
	<cfset msgClass = "alert alert-danger">
<cfelseif msgStruct.type eq "warning">
	<cfset msgClass = "alert alert-warning">
<cfelse>
	<cfset msgClass = "alert alert-info">
</cfif>
<cfoutput>
<div class="#msgClass#"><p class="cbox_messagebox">#msgStruct.message#</p></div>
</cfoutput>
<cfsetting enablecfoutputonly="false">