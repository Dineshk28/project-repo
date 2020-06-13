package com.dinesh.java;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DisplayText", urlPatterns = { "/DisplayText" })
public class DisplayText extends HttpServlet {
	/**
		 * 
		 */
	private static final long serialVersionUID = 1L;
	PrintWriter out;
	public String country_name, state_name, subjects, sub_code,reg_no1,
	reg_no2,reg_no3,reg_no4,reg_no5,reg_no6,stu_name1,stu_name2,stu_name3,stu_name4,stu_name5,stu_name6;
	public Connection con, con1, con2;
	public Statement st, st1, st2;
	public ResultSet rs, rs1, rs2;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		out = response.getWriter();
		String country_id = request.getParameter("country_id");// parameters coming from ajax script
		System.out.println("country_id" + country_id);
		String state_id = request.getParameter("state_id");// parameters coming from ajax script
		System.out.println("state_id" + state_id);
		String city = request.getParameter("city_name");// parameters coming from ajax script
		System.out.println("city" + city);
		try {

			con = DB.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select country_name from countries where id=" + country_id + "");
			if (rs.next()) {
				country_name = rs.getString(1);
				System.out.println("country_name" + country_name);
			}
			con1 = DB.getConnection();
			st1 = con1.createStatement();
			rs1 = st1.executeQuery("select state from states where id=" + state_id + "");
			if (rs1.next()) {
				state_name = rs1.getString(1);
			}

			con2 = DB.getConnection();
			st2 = con.createStatement();
			rs2 = st.executeQuery("select * from backlog_res where subjects ='" + city + "' ");
			
			if (rs2.next()) {
				subjects = rs2.getString(2);
				sub_code = rs2.getString(3);
				reg_no1 = rs2.getString(4);
				stu_name1 = rs2.getString(5);
				reg_no2 = rs2.getString(6);
				stu_name2 = rs2.getString(7);
				reg_no3 = rs2.getString(8);
				stu_name3 = rs2.getString(9);
				reg_no4 = rs2.getString(10);
				stu_name4 = rs2.getString(11);
				reg_no5 = rs2.getString(12);
				stu_name5 = rs2.getString(13);
				reg_no6 = rs2.getString(14);
				stu_name6 = rs2.getString(15 );
				out.println("<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"mycss.css\" /></head><body>");
				out.println("<table style=width:100%>");
				out.println("<tr><td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\"\r\n" + " >"
						+ "SUBJECT <b>:</b></td> <td style=\"padding: 10px; border: 1px solid;font-size: 15px;\\\"\\r\\n\" + \" > "
						+ subjects + "</td></tr>");

				out.println("<tr><td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\"\r\n" + ">"
						+ "SUBJECT CODE <b>:</b></td> <td style=\"padding: 10px; border: 1px solid;font-size: 15px;\\\"\\r\\n\" + \" >"
						+ sub_code + "</td></tr>");
				out.println("</table>");

				out.println("<br/>");
				out.println("<table style=width:100%>");
				out.println("<tr>");
				out.println("<td style=\"\r\n" + "    border: 1px solid;\r\n" + "    width: 20%;\r\n"
						+ "    padding: 10px;\r\n" + "\">REGISTER NUMBER</td>");
				out.println("<td style=\"\r\n" + "    border: 1px solid;\r\n" +

						"    padding: 10px;\r\n" + "\">NAME</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\" >"+reg_no1+"</td>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+stu_name1+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+reg_no2+"</td>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+stu_name2+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+reg_no3+"</td>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+stu_name3+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+reg_no4+"</td>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+stu_name4+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+reg_no5+"</td>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+stu_name5+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+reg_no6+"</td>");
				out.println("<td style=\"padding: 10px; border: 1px solid;font-size: 15px;width: 20%;\">"+stu_name6+"</td>");
				out.println("</tr>");

				out.println("</table></body></html>");
			
			}

			/*
			 * out.println("<h4>Your Selected Country:<b style='color:red;'>&nbsp;" +
			 * country_name + "</b></h4>"); out.
			 * println("<h4>Your Selected State:<b style='color:red;'>&nbsp;&nbsp;&nbsp;" +
			 * state_name + "</b></h4>");
			 * 
			 * out.println("<h4>Your Selected city:<b style='color:red;'>" + city +
			 * "</b></h4>");
			 */

		} catch (Exception e) {
			out.println(e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					/* ignored */}
			}
			if (st != null) {
				try {
					st.close();
				} catch (Exception e) {
					/* ignored */}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					/* ignored */}
			}
			if (rs1 != null) {
				try {
					rs1.close();
				} catch (Exception e) {
					/* ignored */}
			}
			if (st1 != null) {
				try {
					st1.close();
				} catch (Exception e) {
					/* ignored */}
			}
			if (con1 != null) {
				try {
					con1.close();
				} catch (Exception e) {
					/* ignored */}
			}
			if (rs2 != null) {
				try {
					rs1.close();
				} catch (Exception e) {
					/* ignored */}
			}
			if (st2 != null) {
				try {
					st1.close();
				} catch (Exception e) {
					/* ignored */}
			}
			if (con2 != null) {
				try {
					con1.close();
				} catch (Exception e) {
					/* ignored */}
			}

		}
	}
}
