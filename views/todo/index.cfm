<cfoutput>

	<h1>Todo Manager</h1>

	<div>
		<a href="#event.buildLink('todo/editor')#" class="btn btn-primary btn-sm pull-right">Add Todo</a>
	</div>

	<div class="todo-sort-order">
		<form class="form-inline">
			<div class="form-group">
				<label for="sortorder">Order by:</label>
				<select class="form-control form-control" id="sortorder">
					<option>creation</option>
					<option>completion</option>
					<option>due</option>
					<option>prioty</option>
				</select>
			</div>
			<button type="submit" class="btn btn-default">Sort</button>
		</form>
	</div>

	<div class="todo-group">
		#renderView(view="todo/todo", collection=prc.todolist, collectionAs="todo")#
	</div>

</cfoutput>