package com.servlet;

import com.dao.HostelDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            HostelDAO dao = new HostelDAO();
            
            if(!dao.studentIdExists(Integer.parseInt(request.getParameter("studentID")))) {
            	request.setAttribute("message", "Student with this ID does not exists!");
            	request.setAttribute("messageType", "error");
            	request.getRequestDispatcher("studentdelete.jsp").forward(request, response);
            }
            
            dao.deleteStudent(studentID);

            request.setAttribute("message", "Student deleted successfully.");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("studentdelete.jsp").forward(request, response);
        } catch (Exception e) {
        	request.setAttribute("message", "Error in deleting student");
        	request.setAttribute("messageType", "error");
        	request.getRequestDispatcher("studentdelete.jsp").forward(request, response);
        }
    }
}
