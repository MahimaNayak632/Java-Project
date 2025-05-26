
package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DisplayStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HostelDAO dao = new HostelDAO();
            List<Student> list = dao.getAllStudents();
            
            request.setAttribute("students", list);
            request.getRequestDispatcher("studentdisplay.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Unable to display students: " + e.getMessage());
            request.getRequestDispatcher("studentdisplay.jsp").forward(request, response);
        }
    }
}
