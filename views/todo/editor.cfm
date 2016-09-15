<cfoutput>
<h1>Add Todo Entry</h1>
<div><a href="#event.buildLink('todo/index')#">View List</a></div>
<form name="addEventForm" id="addEventForm" action="#event.buildLink('todo/save')#" method="post">
	<table class>
		<tr class="row">
			<td class="col">Title:</td>
			<td class="col">
				<input type="text" id="title" name="title" value="#rc.todoResultSet.getTitle()#">
				<input type="hidden" id="id" name="id" value="#rc.todoResultSet.getID()#">

			</td>
		</tr>
		<tr class="row">
			<td class="col">Description:</td>
			<td class="col">
				<textarea id="description" name="description" cols="80" rows="5">#rc.todoResultSet.getDescription()#</textarea>
			</td>
		</tr>
		<tr class="row">
			<td class="col">Completed</td>
			<td class="col"><input type="checkbox" id="isdone" name="isdone" value="1"></td>
		</tr>
		<tr class="row">
			<td class="col" colspan="2"><button ><cfif rc.todoResultSet.getID() eq 0 or len(trim(rc.todoResultSet.getID())) eq 0>Add<cfelse>Edit</cfif></button></td>
			
		</tr>
	</table>
</form>

</cfoutput>


