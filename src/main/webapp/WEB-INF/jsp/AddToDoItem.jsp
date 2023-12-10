<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Add ToDo Item</title>

    <!-- Include Syncfusion Essential JS 2 CSS and script files -->
    <link rel="stylesheet" href="https://cdn.syncfusion.com/ej2/material.css" />
    <script src="https://cdn.syncfusion.com/ej2/dist/ej2.min.js"></script>

    <link rel="stylesheet"
    	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script
    	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
    	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</head>
<body>

    <div class="container">

        <h1 class="p-3"> Add a ToDo Item </h1>

        <!-- Syncfusion Grid initialization -->
        <div id="Grid"></div>

        <script th:inline="javascript">
            window.onload = function () {
                // Define Syncfusion Grid for AddToDoItem.jsp
                var grid = new ej.grids.Grid({
                    dataSource: [],
                    columns: [
                        { field: 'title', headerText: 'Title' },
                        { field: 'date', headerText: 'Date' },
                        { field: 'status', headerText: 'Status', defaultValue: 'Incomplete' },
                        // Add other columns as needed
                        // For example, hidden input for 'id'
                        { field: 'id', isPrimaryKey: true, visible: false }
                    ],
                    editSettings: { allowEditing: true, allowAdding: true, allowDeleting: true },
                    toolbar: ['Add', 'Edit', 'Delete', 'Update', 'Cancel'],
                });

                // Render the Syncfusion Grid
                grid.appendTo('#Grid');

                var msg = "${message}";

                if (msg == "Save Failure") {
                    Command: toastr["error"]("Something went wrong with the save.");
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
