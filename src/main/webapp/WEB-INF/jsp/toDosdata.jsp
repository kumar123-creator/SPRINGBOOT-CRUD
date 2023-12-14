<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>View ToDo Item List</title>
    <link rel="stylesheet" href="https://cdn.syncfusion.com/ej2/material.css" />
</head>
<body>
    <h2>ToDo Item List</h2>

    <div id="grid"></div>

    <script src="https://cdn.syncfusion.com/ej2/dist/ej2.min.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {

        var toDos = [];
        var selectedRecords = []; // Declare selectedRecords at a higher scope

        // Initialize the DataGrid
        ej.grids.Grid.Inject(ej.grids.Edit, ej.grids.Toolbar);
        var grid = new ej.grids.Grid({
            dataSource: toDos,
            editSettings: { allowEditing: true, allowDeleting: true, allowAdding: true, mode: 'Dialog', height: 400 },
            toolbar: ['Add', 'Edit', 'Delete', 'Search'],
            columns: [
                { field: 'id', headerText: 'Id' , isPrimaryKey: true},
                { field: 'title', headerText: 'Title' },
                { field: 'author', headerText: 'Author' },
                { field: 'mobile', headerText: 'Mobile' },
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
                        addToDo(args.data);
                    } else if (args.action === 'edit') {
                        // If it was an 'edit' action, send the updated record to the server to update the database
                        updateToDoData(args.data);
                    }
                }
            }

        });

        // Function to fetch toDos data
        function fetchToDosData() {
            // Make an AJAX request to the server to fetch data
            fetch('/alltoDos')
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

        // Function to add a new toDo
        function addToDo(toDo) {
            fetch('/addtoDo', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(toDo),
            })
                .then(response => response.json())
                .then(data => {
                    console.log('ToDo added successfully:', data);
                    // Fetch updated data after adding a new toDo
                    fetchToDOsData();
                })
                .catch(error => {
                    console.error('Error adding toDo:', error);
                });
        }
        
        // Function to update a toDo
        function updateToDoData(updatedToDo) {
            fetch('/updateToDo/' + updatedToDo.id, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(updatedToDo),
            })
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error('Error updating toDo: ' + response.statusText);
                    }
                })
                .then(data => {
                    // Process the updated toDo data
                    console.log('ToDo updated successfully:', data);
                    fetchToDosData(); // Refresh the data after a successful update
                })
                .catch(error => {
                    console.error('Error updating toDo:', error.message);
                });
        }

        grid.toolbarClick = function (args) {
            if (args.item.id === 'grid_delete') {
                // Get the selected records
                var selectedRecords = grid.getSelectedRecords();

                if (selectedRecords.length > 0) {
                    // Send a POST request to the server to delete the selected record
                    fetch('/deleteToDo/' + selectedRecords[0].id, {
                        method: 'POST',
                    })
                        .then(response => response.text())
                        .then(message => {
                            console.log(message);
                            // Refresh the grid after a successful deletion
                            fetchToDosData();
                        })
                        .catch(error => {
                            console.error('Error deleting record:', error);
                        });
                } else {
                    console.warn('No records selected for deletion');
                }
            }
        };

        // Render the DataGrid
        grid.appendTo('#grid');

        // Automatically fetch data when the DOM content is loaded
        fetchToDosData();

    });

    </script>
</body>
</html>
<style>.e-grid .e-toolbar .e-btn {
    background-color: #deecf9;
    }
    .e-grid .e-headercell {
   color: darkblue;
    font-weight: bold;
   
}
.e-grid .e-gridheader {
    
      font-weight: bold;
}
.e-grid .e-headercelldiv {
   font-size: 15px;
}
</style>