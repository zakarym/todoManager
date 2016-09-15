<cfoutput>


	<h1>Todo Manager</h1>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Descriiption</th>
				<th>Is done?</th>
				<th>Status</th>
				<th>Create Date</th>
				<th>Complete Date</th>
				<th>Due Date</th>
			</tr>
		</thead>
		<tbody>
			#renderView(view="todo/todo", collection=prc.todolist, collectionAs="todo")#
		</tbody>
	</table>

</cfoutput>