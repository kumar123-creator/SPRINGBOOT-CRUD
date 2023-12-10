<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View ToDo Item List</title>

    <!-- Include Syncfusion Essential JS 2 CSS and script files -->
    <link rel="stylesheet" href="https://cdn.syncfusion.com/ej2/material.css" />
    <script src="https://cdn.syncfusion.com/ej2/dist/ej2.min.js"></script>

    <style>
        a {
            color: white;
        }

        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>
</head>

<body>

    <div class="container">

        <h1 class="p-3"> ToDo Item List</h1>

        <!-- Syncfusion Grid initialization -->
        <div id="Grid"></div>

        <script th:inline="javascript">
            window.onload = function () {
                // Define Syncfusion Grid
                var grid = new ej.grids.Grid({
                    dataSource: <%= new Gson().toJson(list) %>,
                    columns: [
                        { field: 'id', headerText: 'Id' },
                        { field: 'title', headerText: 'Title' },
                        { field: 'date', headerText: 'Date' },
                        { field: 'status', headerText: 'Status' },
                        // Add columns for Mark Complete, Edit, and Delete buttons
                        {
                            headerText: 'Mark Complete',
                            template: '<button type="button" class="btn btn-success">' +
                                '<a href="/updateToDoStatus/{{id}}">Mark Complete</a></button>'
                        },
                        {
                            headerText: 'Edit',
                            template: '<button type="button" class="btn btn-primary">' +
                                '<a href="/editToDoItem/{{id}}">Edit</a></button>'
                        },
                        {
                            headerText: 'Delete',
                            template: '<button type="button" class="btn btn-danger">' +
                                '<a href="/deleteToDoItem/{{id}}">Delete</a></button>'
                        }
                    ]
                });

                // Render the Syncfusion Grid
                grid.appendTo('#Grid');

                var msg = "${message}";

                if (msg == "Save Success") {
                    Command: toastr["success"]("Item added successfully!!");
                } else if (msg == "Delete Success") {
                    Command: toastr["success"]("Item deleted successfully!!");
                } else if (msg == "Delete Failure") {
                    Command: toastr["error"]("Some error occurred, couldn't delete item");
                } else if (msg == "Edit Success") {
                    Command: toastr["success"]("Item updated successfully!!");
                }

                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": false,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
            }
        </script>
    </div>
</body>

</html>
