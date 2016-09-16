<cfoutput>

<cfset theId = todo.getID()>

<div class="todo-group-item todo-group-item-#todo.getStatus()# clearfix">
	<div class="todo-group-item-details">
		<div class="todo-group-item-header">
			<label for="isdone" class="todo-group-item-complete">
				<input type="checkbox" name="isdone" value="#todo.getIsDone()#" id="isdone">
			</label> 
			<h4 class="todo-group-item-title">
				<a role="button" data-toggle="collapse" href="##todo#theId#" aria-expanded="true" aria-controls="todo#theId#">#todo.getTitle()#</a>
				<cfif len(trim( todo.getDueDate() ))>
					<cfset remainingDays = DateDiff("d", "#Dateformat(todo.getDueDate(),"mmm-dd-yyyy")#", "#Dateformat( now(),"mmm-dd-yyyy")#" )>
					<cfif remainingDays eq 1>
						<cfset remainingDays = "today">
					<cfelse>
						<cfset remainingDays = remainingDays & " days">
					</cfif>

					<span class="badge">#remainingDays#</span>
				</cfif>
			</h4>
		</div>
		<div class="todo-group-item-body collapse clearfix" id="todo#theId#" role="tododetail" aria-labelledby="todo#theId#">
			<p class="todo-group-item-description">#todo.getDescription()#</p>

			<ul class="todo-group-item-dates">
				<li class="todo-group-item-date-created badge">Created: #Dateformat(todo.getCreateDate(),"mmm-dd-yyyy")# #timeformat(todo.getCreateDate(),"hh:mm:ss")#</li>
				<cfif len(trim(todo.getDueDate()))><li class="todo-group-item-date-due badge">Due: #Dateformat(todo.getDueDate(),"mmm-dd-yyyy")#</li></cfif>
				<cfif len(trim(todo.getDueDate()))><li class="todo-group-item-date-complete badge">Completed: #Dateformat(todo.getCompletionDate(),"mmm-dd-yyyy")#</li></cfif>
			</ul>
		</div>
	</div>
	<div class="todo-group-item-actions">
		<form class="form-inline-block" method="post" action="#event.buildLink('todo/editor')#" name="editForm#theId#">
			<button type="submit" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-pencil"></i></button>
			<input type="hidden" name="id" id="id" value="#theId#">
		</form>
		<form class="form-inline-block" method="post" action="#event.buildLink('todo/delete')#" name="editForm#theId#">
			<button type="submit" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-trash"></i></button>
			<input type="hidden" name="id" id="id" value="#theId#">
		</form>
	</div>
</div>

	<!---
	<tr>
		<td>
			#html.inputField( type="checkbox", name="isdone", value=todo.getIsDone(), groupWrapper="label class=radio-inline" )#
		</td>
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
		<td class="text-right">
			<a href="#event.buildLink('todo/editor?#todo.getID()#')#" class="btn btn-primary">
				Edit	
			</a>
		</td>
	</tr>
	--->
</cfoutput>