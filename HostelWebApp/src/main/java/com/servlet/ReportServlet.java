package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String criteria = request.getParameter("criteria");
        try {
            HostelDAO dao = new HostelDAO();
            List<Student> result = null;

            if ("pending".equals(criteria)) {
                result = dao.getPendingFeeStudents();
            } else if ("room".equals(criteria)) {
                result = dao.getStudentsByRoom(request.getParameter("roomNumber"));
            } else if ("admission".equals(criteria)) {
                Date from = Date.valueOf(request.getParameter("fromDate"));
                Date to = Date.valueOf(request.getParameter("toDate"));
                result = dao.getStudentsByDateRange(from, to);
            }

            request.setAttribute("reportData", result);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error generating report: " + e.getMessage());
            request.getRequestDispatcher("reports.jsp").forward(request, response);
        }
    }
}
