<cfoutput>
	<tr>
		<td>
			#todo.getID()#
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
			#todo.getCreateDate()#
		</td>
		<td>
			#todo.getCompleteDate()#
		</td>
		<td>
			#todo.getDueDate()#
		</td>

	</tr>
</cfoutput>