<cfoutput>

<cfif rc.todoResultSet.getID() eq 0 or len(trim(rc.todoResultSet.getID())) eq 0>
<cfelse>
	<h1>Edit Todo</h1>
	<div class="todo-group">
</cfif> 

	<div class="todo-group-item todo-group-item-editor clearfix">
		<form name="addEventForm" id="addEventForm" action="#event.buildLink('todo/save')#" method="post">
			<div class="todo-group-item-details">
				<div class="todo-group-item-header">
					<cfif rc.todoResultSet.getID() eq 0 or len(trim(rc.todoResultSet.getID())) eq 0>
						<span class="todo-group-item-complete">
							<i class="glyphicon glyphicon-plus"></i>
							<input type="hidden" name="isdone" value="0" id="isdone">
						</span>
					<cfelse>
						<label for="isdone" class="todo-group-item-complete">
							<input type="checkbox" name="isdone" value="#rc.todoResultSet.getIsdone()#" id="isdone">
						</label> 
					</cfif>
					<h4 class="todo-group-item-title">
						<a role="button" data-toggle="collapse" href="##todonew" aria-expanded="true" aria-controls="todonew">
							<cfif rc.todoResultSet.getID() eq 0 or len(trim(rc.todoResultSet.getID())) eq 0>Add<cfelse>Edit</cfif> Todo
						</a>
					</h4>
				</div>
				<div class="todo-group-item-body collapse <cfif rc.todoResultSet.getID() eq 0 or len(trim(rc.todoResultSet.getID())) eq 0><cfelse>in</cfif> clearfix " id="todonew" role="tododetail" aria-labelledby="todonew">
					<hr class="divider">
					<div class="form-group">
						<label for="title" id="title_label" class="form-label">Title</label>
						<input type="text" id="title" name="title" value="#rc.todoResultSet.getTitle()#" class="form-control" placeholder="Todo Title">
						<input type="hidden" id="id" name="id" value="#rc.todoResultSet.getID()#">
					</div>
					<div class="form-group">
						<label for="description" id="description_label" class="form-label">Description</label>
						<textarea id="description" name="description" cols="80" rows="5" class="form-control" placeholder="Todo Description">#rc.todoResultSet.getDescription()#</textarea>
					</div>

					<div class="form-group">
						<label for="duedate" id="duedate_label" class="form-label">Due Date</label>
						<input type="date" id="duedate" name="duedate" value="#rc.todoResultSet.getDuedate()#" class="form-control" placeholder="Due Date">
					</div>

					<button type="submit" class="btn btn-default btn-sm"><cfif rc.todoResultSet.getID() eq 0 or len(trim(rc.todoResultSet.getID())) eq 0>Add<cfelse>Edit</cfif></button>
				</div>
			</div>
		</form>
	</div>

<cfif rc.todoResultSet.getID() eq 0 or len(trim(rc.todoResultSet.getID())) eq 0>
<cfelse>
	</div>
</cfif> 

</cfoutput>


