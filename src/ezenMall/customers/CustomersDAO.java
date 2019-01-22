package ezenMall.customers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import util.DBManager;

public class CustomersDAO {
	private static final Logger LOG = LoggerFactory.getLogger(CustomersDAO.class);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BCrypt bc = new BCrypt();

	public boolean addCustomers(CustomersDTO customers) {
		conn = DBManager.getConnection();
		String sql = "insert into customers(c_name, c_password, c_email, c_tel) values(?,?,?,?);";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customers.getcName());
			pstmt.setString(2, bc.hashpw(customers.getcPassword(), bc.gensalt(10)));
			pstmt.setString(3, customers.getcEmail());
			pstmt.setString(4, customers.getcTel());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
			return false;
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
					conn.close();
				}
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return true;
	}
	
	public boolean login(int cId, String passwd) {
		conn = DBManager.getConnection();
		String sql = "select c_password from customers where c_id = ?";
		boolean result = false;
		//LOG.debug("login(): " + c_id + ", " + passwd);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cId);
			rs = pstmt.executeQuery();
			rs.next();
			String hashedPw = rs.getString(1);
			//LOG.debug("login(): try " + hashedPw);
			if(bc.checkpw(passwd, hashedPw)) 
				result=true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public String getCustomersName(int cId) {
		conn = DBManager.getConnection();
		String sql = "select c_name from customers where c_id = ?";
		String name = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cId);
			rs = pstmt.executeQuery();
			rs.next();
			name = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return name;
	}
	
	public String getCustomersId() {
		conn = DBManager.getConnection();
		String sql = "select c_id from customers order by c_id desc limit 1";
		String cId = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cId = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cId;
	}
}
