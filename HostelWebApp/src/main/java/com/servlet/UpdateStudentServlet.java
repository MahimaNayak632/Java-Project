package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Student s = new Student();
            s.setStudentID(Integer.parseInt(request.getParameter("studentID")));
            s.setStudentName(request.getParameter("studentName"));
            s.setRoomNumber(request.getParameter("roomNumber"));
            s.setAdmissionDate(Date.valueOf(request.getParameter("admissionDate")));
            s.setFeesPaid(Double.parseDouble(request.getParameter("feesPaid")));
            s.setPendingFees(Double.parseDouble(request.getParameter("pendingFees")));

            HostelDAO dao = new HostelDAO();
            
            if(!dao.studentIdExists(Integer.parseInt(request.getParameter("studentID")))) {
            	request.setAttribute("message", "Student with this ID does not exists!");
            	request.setAttribute("messageType", "error");
            	request.getRequestDispatcher("studentupdate.jsp").forward(request, response);
            }
            
            dao.updateStudent(s);

            request.setAttribute("message", "Student updated successfully.");
            request.setAttribute("messageType", "success");
            request.getRequestDispatcher("studentupdate.jsp").forward(request, response);
        } catch (Exception e) {
        	request.setAttribute("message", "Error in updating student");
        	request.setAttribute("messageType", "error");
        	request.getRequestDispatcher("studentupdate.jsp").forward(request, response);
        }
    }
}
