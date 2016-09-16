<cfoutput>

	<h1>Todo Manager</h1>

	<div class="todo-sort-order clearfix">
		<div class="dropdown pull-right">
			<a href="##" class="dropdown-toggle" data-toggle="dropdown">
				Sort by <b class="caret"></b>
			</a>
			<ul id="actions-submenu" class="dropdown-menu">
				 <li><a href="">Creation date</a></li>
				 <li><a href="">Completion date</a></li>
				 <li><a href="">Due date</a></li>
				 <li><a href="">Priority</a></li>
			</ul>
		</div>
	</div>

	<div class="todo-group">
		#renderView(view="todo/editor")#
		#renderView(view="todo/todo", collection=prc.todolist, collectionAs="todo")#
	</div>

</cfoutput>