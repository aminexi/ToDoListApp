<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #41a5b1 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
            padding: 40px;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
            font-size: 32px;
            text-align: center;
        }

        .btn-add {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            margin-bottom: 30px;
            transition: background 0.3s ease;
            font-weight: 500;
        }

        .btn-add:hover {
            background: #5568d3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #f8f9fa;
            color: #333;
            padding: 15px;
            text-align: left;
            font-weight: 600;
            border-bottom: 2px solid #e9ecef;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e9ecef;
            color: #555;
        }

        tr:hover {
            background: #f8f9fa;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .actions a {
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background: #e3f2fd;
            color: #1976d2;
        }

        .btn-edit:hover {
            background: #1976d2;
            color: white;
        }

        .btn-delete {
            background: #ffebee;
            color: #d32f2f;
        }

        .btn-delete:hover {
            background: #d32f2f;
            color: white;
        }

        .status {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 500;
        }

        .status.pending {
            background: #fff3cd;
            color: #856404;
        }

        .status.completed {
            background: #d4edda;
            color: #155724;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>📋 My Tasks</h1>
    <a href="new" class="btn-add">+ Add New Task</a>

    <table>
        <thead>
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="task" items="${listTask}">
            <tr>
                <td><strong>${task.title}</strong></td>
                <td>${task.description}</td>
                <td>
                            <span class="status <c:if test='${task.status == "Completed"}'>completed</c:if><c:if test='${task.status != "Completed"}'>pending</c:if>">
                                    ${task.status}
                            </span>
                </td>
                <td>
                    <div class="actions">
                        <a href="edit?id=${task.id}" class="btn-edit">Edit</a>
                        <a href="delete?id=${task.id}" class="btn-delete">Delete</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>