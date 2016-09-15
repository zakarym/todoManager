<cfoutput>
	<tr>
		<td>
			<cfset theId = todo.getID()>
			#theId#
			<br>
			<form method="post" action="#event.buildLink('todo/delete')#" name="editForm#theId#">
				<button type="submit">Delete</button>
				<input type="hidden" name="id" id="id" value="#theId#">
			</form>
			<form method="post" action="#event.buildLink('todo/editor')#" name="editForm#theId#">
				<button type="submit">Edit</button>
				<input type="hidden" name="id" id="id" value="#theId#">
			</form>
		</td>
		<td>
			#todo.getTitle()#
		</td>
		<td>
			#todo.getDescription()#
		</td>
		<td>
			<cfif todo.getIsDone() eq 1>
				Completed
			<cfelse>
				Incomplete	
			</cfif> 
		</td>
		<td>
			#todo.getStatus()#
		</td>
		<td>
			#Dateformat(todo.getCreateDate(),"mmm-dd-yyyy")# #timeformat(todo.getCreateDate(),"hh:mm:ss")#
		</td>
		<td>
			#todo.getCompletionDate()#
		</td>
		<td>
			#todo.getDueDate()#
		</td>

	</tr>
</cfoutput>