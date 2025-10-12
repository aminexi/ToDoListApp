package com.todolist;

import com.todolist.dao.TaskDao;
import com.todolist.model.Task;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class TaskServlet extends HttpServlet {
    private TaskDao taskDAO;

    public void init() {
        taskDAO = new TaskDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertTask(request, response);
                    break;
                case "/delete":
                    deleteTask(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateTask(request, response);
                    break;
                default:
                    listTask(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Task> listTask = taskDAO.selectAllTasks();
        request.setAttribute("listTask", listTask);
        RequestDispatcher dispatcher = request.getRequestDispatcher("task-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("task-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Task existingTask = taskDAO.selectTask(id);
        request.setAttribute("task", existingTask);
        RequestDispatcher dispatcher = request.getRequestDispatcher("task-form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        Task newTask = new Task();
        newTask.setTitle(title);
        newTask.setDescription(description);
        newTask.setStatus(status);
        taskDAO.insertTask(newTask);
        response.sendRedirect("list");
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        Task task = new Task(id, title, description, status);
        taskDAO.updateTask(task);
        response.sendRedirect("list");
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        taskDAO.deleteTask(id);
        response.sendRedirect("list");
    }
}
