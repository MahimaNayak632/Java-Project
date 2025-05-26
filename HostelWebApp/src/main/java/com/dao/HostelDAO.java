package com.dao;

import com.model.Student;
import java.sql.*;
import java.sql.Date;
import java.util.*;

public class HostelDAO {
	
	private Connection connect() throws SQLException {
		try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new SQLException("MySQL JDBC Driver not found", e);
	    }
	    return DriverManager.getConnection("jdbc:mysql://localhost:3306/Hostel?useSSL=false&serverTimezone=UTC", "", "");
    }

    public void addStudent(Student s) throws SQLException {
        String sql = "INSERT INTO HostelStudents VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, s.getStudentID());
            ps.setString(2, s.getStudentName());
            ps.setString(3, s.getRoomNumber());
            ps.setDate(4, s.getAdmissionDate());
            ps.setDouble(5, s.getFeesPaid());
            ps.setDouble(6, s.getPendingFees());
            ps.executeUpdate();
        }
        catch(Exception e) {
        	System.out.println(e);
        }
    }

    public void updateStudent(Student s) throws SQLException {
        String sql = "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, s.getAdmissionDate());
            ps.setDouble(4, s.getFeesPaid());
            ps.setDouble(5, s.getPendingFees());
            ps.setInt(6, s.getStudentID());
            ps.executeUpdate();
        }
        catch(Exception e) {
        	System.out.println(e);
        }
    }

    public void deleteStudent(int studentID) throws SQLException {
        String sql = "DELETE FROM HostelStudents WHERE StudentID=?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, studentID);
            ps.executeUpdate();
        }
    }

    public Student getStudent(int studentID) throws SQLException {
        String sql = "SELECT * FROM HostelStudents WHERE StudentID=?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, studentID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt("StudentID"));
                s.setStudentName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getDate("AdmissionDate"));
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                return s;
            }
        }
        return null;
    }

    public List<Student> getAllStudents() throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents";
        try (Connection con = connect(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt("StudentID"));
                s.setStudentName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getDate("AdmissionDate"));
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                list.add(s);
            }
        }
        return list;
    }

    public List<Student> getPendingFeeStudents() throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE PendingFees > 0";
        try (Connection con = connect(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt("StudentID"));
                s.setStudentName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getDate("AdmissionDate"));
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                list.add(s);
            }
        }
        return list;
    }

    public List<Student> getStudentsByRoom(String room) throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE RoomNumber = ?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, room);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt("StudentID"));
                s.setStudentName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getDate("AdmissionDate"));
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                list.add(s);
            }
        }
        return list;
    }

    public List<Student> getStudentsByDateRange(Date from, Date to) throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, from);
            ps.setDate(2, to);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt("StudentID"));
                s.setStudentName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getDate("AdmissionDate"));
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                list.add(s);
            }
        }
        return list;
    }
    
    //To check a specific student exists in database or not.
    public boolean studentIdExists(int studentID) throws SQLException {
        boolean exists = false;
        String sql = "SELECT COUNT(*) FROM HostelStudents WHERE StudentID=?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, studentID);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    exists = rs.getInt(1) > 0;
                }
            }
            return exists;
        }
}
