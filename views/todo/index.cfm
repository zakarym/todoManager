<cfoutput>

    <h1>Todo Manager</h1>
    <table border="2" cellpadding="2" cellspacing="2">
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
        <!--- #html.table( data=prc.todolist, class="table table-hover table-striped" )# --->
        #renderView(view="todo/todo", collection=prc.todolist, collectionAs="todo")#
    </table>

</cfoutput>