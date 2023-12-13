<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>ToDo Item List</title>
    <link rel="stylesheet" href="https://cdn.syncfusion.com/ej2/material.css" />
    <!-- Add your other stylesheets here -->

    <style>
        /* Add your styles here */
    </style>
</head>
<body>

    <h1>ToDo Item List</h1>

    <div id="grid"></div>

    <script src="https://cdn.syncfusion.com/ej2/dist/ej2.min.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {

        var todoItems = [];

        // Initialize the DataGrid
        ej.grids.Grid.Inject(ej.grids.Edit, ej.grids.Toolbar);
        var grid = new ej.grids.Grid({
            dataSource: todoItems,
            editSettings: { allowEditing: true, allowDeleting: true, allowAdding: true, mode: 'Dialog', height: 400 },
            toolbar: ['Add', 'Edit', 'Delete', 'Search'],
            columns: [
                { field: 'id', headerText: 'Id', isPrimaryKey: true },
                { field: 'title', headerText: 'Title' },
                { field: 'date', headerText: 'Date' },
                { field: 'status', headerText: 'Status' },
                // Add other columns as needed
            ],

            allowPaging: true,
            gridLines: 'Both',
            pageSettings: { pageSize: 10 },
            allowSorting: true,

            actionComplete: function (args) {
                if (args.requestType === 'save') {
                    // The 'save' requestType indicates that an add, edit, or delete operation was performed
                    if (args.action === 'add') {
                        // If it was an 'add' action, send the new record to the server to add to the database
                        addTodoItem(args.data);
                    } else if (args.action === 'edit') {
                        // If it was an 'edit' action, send the updated record to the server to update the database
                        updateTodoItem(args.data);
                    }
                }
            }

        });

        // Function to fetch todo items data
        function fetchTodoItems() {
            // Make an AJAX request to the server to fetch data
            fetch('/viewToDoItem')
                .then(response => response.json())
                .then(data => {
                    console.log('Data received:', data);

                    // Update the DataGrid with the retrieved data
                    grid.dataSource = data;
                    grid.refresh();
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                });
        }


    
        // Render the DataGrid
        grid.appendTo('#grid');

        // Automatically fetch data when the DOM content is loaded
        fetchTodoItems();

    });

    </script>
</body>
</html>
