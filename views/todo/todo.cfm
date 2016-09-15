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
			#Dateformat(todo.getCreateDate(),"mmm-dd-yyyy")# #timeformat(todo.getCreateDate(),"hh:mm:ss")#
		</td>
		<td>
			#todo.getCompleteDate()#
		</td>
		<td>
			#todo.getDueDate()#
		</td>

	</tr>
</cfoutput>