<cfoutput>
<h1>Add Event</h1>
<form name="addEventForm" id="addEventForm" action="#event.buildLink('todo/save')#" method="post">
	<table class>
		<tr class="row">
			<td class="col">Title:</td>
			<td class="col">
				<input type="text" id="title" name="title" value="">

			</td>
		</tr>
		<tr class="row">
			<td class="col">Description:</td>
			<td class="col">
				<textarea id="description" name="description" ></textarea>
			</td>
		</tr>
		<tr class="row">
			<td class="col">Completed</td>
			<td class="col"><input type="checkbox" id="isdone" name="isdone" value="1"></td>
		</tr>
		<tr class="row">
			<td class="col" colspan="2"><button >Add</button></td>
			
		</tr>
	</table>
</form>

</cfoutput>


