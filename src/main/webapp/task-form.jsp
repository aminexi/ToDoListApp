<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Form</title>
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
            max-width: 600px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
            padding: 40px;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }

        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-family: inherit;
            font-size: 14px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus,
        textarea:focus,
        select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        textarea {
            resize: vertical;
            min-height: 120px;
        }

        .button-group {
            display: flex;
            gap: 12px;
            margin-top: 35px;
        }

        input[type="submit"] {
            flex: 1;
            padding: 12px 24px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #5568d3;
        }

        input[type="submit"]:active {
            transform: scale(0.98);
        }

        .btn-back {
            flex: 1;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 12px 24px;
            background: #f0f0f0;
            color: #333;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
            transition: background 0.3s ease;
        }

        .btn-back:hover {
            background: #e0e0e0;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>✏️ <c:if test="${task != null}">Edit Task</c:if><c:if test="${task == null}">New Task</c:if></h1>

    <form action="${task != null ? 'update' : 'insert'}" method="post">
        <c:if test="${task != null}">
            <input type="hidden" name="id" value="${task.id}" />
        </c:if>

        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" value="${task != null ? task.title : ''}" required>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description">${task != null ? task.description : ''}</textarea>
        </div>

        <div class="form-group">
            <label for="status">Status</label>
            <select id="status" name="status">
                <option value="Pending" ${task != null && task.status == 'Pending' ? 'selected' : ''}>Pending</option>
                <option value="Completed" ${task != null && task.status == 'Completed' ? 'selected' : ''}>Completed</option>
            </select>
        </div>

        <div class="button-group">
            <input type="submit" value="Save Task">
            <a href="list" class="btn-back">← Back to List</a>
        </div>
    </form>
</div>
</body>
</html>