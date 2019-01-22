package ezenMall.admins;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import util.DBManager;

public class AdminDAO {
	private static final Logger LOG = LoggerFactory.getLogger(AdminDAO.class);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BCrypt bc = new BCrypt();

	public List<AdminForCustomersDTO> userList(int currentPage) { // 사용자 목록 10개 씩
		conn = DBManager.getConnection();
		String sql = "select * from customers limit ?,10;";
		List<AdminForCustomersDTO> userList = new ArrayList<AdminForCustomersDTO>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (currentPage-1)*10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AdminForCustomersDTO cDto = new AdminForCustomersDTO();
				cDto.setcId(rs.getString(1));
				cDto.setcName(rs.getString(2));
				cDto.setcEmail(rs.getString(4));
				cDto.setcTel(rs.getString(5));
				userList.add(cDto);
			}
			rs.close();
			return userList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return null;
	}
	
	public int getTotalPage() { // 사용자 목록 게시판 페이지 수
		conn = DBManager.getConnection();
		String sql = "select count(*) from customers;";
		int page = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				page = (rs.getInt(1) - 1) / 10 + 1;
			}
			rs.close();
			return page;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return page;
	}
	
	public int getTotalPageSalesList() { // 고객별 게시판 페이지 수
		conn = DBManager.getConnection();
		String sql = "select count(*) from (select o.o_customerId, date(o.o_date), p.p_name, p.p_unitPrice, sp.s_quantity,o.o_id, p.p_unitPrice*sp.s_quantity " + 
				"from sold_products as sp inner join products as p on p.p_id=sp.s_productId " + 
				"inner join orders as o on o.o_id=sp.s_orderId) as a";
		int page = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				page = (rs.getInt(1) - 1) / 10 + 1;
			}
			rs.close();
			return page;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return page;
	}
	
	public int getTotalPageByDaily() { // 일자별 게시판 페이지 수
		conn = DBManager.getConnection();
		String sql = "select count(*)  from (select date(o_date),sum(o_price) from orders group by date(o_date)) as a;";
		int page = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				page = (rs.getInt(1) - 1) / 10 + 1;
			}
			rs.close();
			return page;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return page;
	}
	
	public int getTotalPageByProduct() { // 상품별 게시판 페이지 수
 		conn = DBManager.getConnection();
		String sql = "select count(*) from (select date(o.o_date), p.p_id, p.p_name, p.p_unitPrice, sum(sp.s_quantity), sum(sp.s_quantity*p.p_unitPrice) " + 
				"from products as p inner join sold_products as sp on p.p_id=sp.s_productId " + 
				"inner join orders as o on o.o_id=sp.s_orderId group by p.p_id order by date(o.o_date), p.p_id) as a;";
		int page = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				page = (rs.getInt(1) - 1) / 10 + 1;
			}
			rs.close();
			return page;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return page;
	}

	public List<AdminForOrdersDTO> orderByCustomer() { // 일단위 고객 매출액 목록
		conn = DBManager.getConnection();
		String sql = "select date(o_date),o_customerid,sum(o_price) from orders "
				+ "group by o_customerid,date(o_date) order by o_date,o_customerid";
		List<AdminForOrdersDTO> orderByCustomerList = new ArrayList<AdminForOrdersDTO>();

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				AdminForOrdersDTO oDto = new AdminForOrdersDTO();
				oDto.setoDate(rs.getString(1));
				oDto.setoCustomerId(rs.getString(2));
				oDto.setSumPrice(rs.getString(3));
				orderByCustomerList.add(oDto);
			}
			rs.close();
			return orderByCustomerList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return null;
	}

	public ArrayList<AdminForOrdersDTO> orderByCustomerList() { //고객별 총액 /고객별 리스트 수
		conn = DBManager.getConnection();
		String sql = "select a.cid,a.d,sum(a.price) from (select o.o_customerId as cid, date(o.o_date) as d, p.p_name, p.p_unitPrice, sp.s_quantity,o.o_id, p.p_unitPrice*sp.s_quantity as price " + 
				"from sold_products as sp inner join products as p on p.p_id=sp.s_productId " + 
				"inner join orders as o on o.o_id=sp.s_orderId order by date(o.o_date), o.o_customerId) as a group by a.cid";
		ArrayList<AdminForOrdersDTO> orderByDailyList = new ArrayList<AdminForOrdersDTO>();

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				AdminForOrdersDTO oDto = new AdminForOrdersDTO();
				oDto.setoCustomerId(rs.getString(1));
				oDto.setoDate(rs.getString(2));
				oDto.setSumPrice(rs.getString(3));
				orderByDailyList.add(oDto);
			}
			rs.close();
			return orderByDailyList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return null;
	}
	
	public ArrayList<AdminForOrdersDTO> orderByDailyList() { //일자별 총액 / 일자별 리스트 수  
		conn = DBManager.getConnection();
		String sql = "select a.d,sum(a.price) from " + 
				"(select o.o_customerId, date(o.o_date) as d, p.p_name, p.p_unitPrice, sp.s_quantity,o.o_id, p.p_unitPrice*sp.s_quantity as price " + 
				"from sold_products as sp inner join products as p on p.p_id=sp.s_productId " + 
				"inner join orders as o on o.o_id=sp.s_orderId order by date(o.o_date), o.o_customerId) as a group by d;";
		ArrayList<AdminForOrdersDTO> customerByDailyList = new ArrayList<AdminForOrdersDTO>();

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				AdminForOrdersDTO oDto = new AdminForOrdersDTO();
				oDto.setoDate(rs.getString(1));
				oDto.setSumPrice(rs.getString(2));
				customerByDailyList.add(oDto);
			}
			rs.close();
			return customerByDailyList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return null;
	}

	public List<DailyListDTO> detailedListByDaily(int currentPage) { //일단위 고객별 상세주문 리스트 (10줄 씩)
		conn = DBManager.getConnection();
		String sql = "select o.o_customerId, date(o.o_date), p.p_name, p.p_unitPrice, sp.s_quantity,o.o_id, p.p_unitPrice*sp.s_quantity " + 
				"from sold_products as sp inner join products as p on p.p_id=sp.s_productId  " + 
				"inner join orders as o on o.o_id=sp.s_orderId order by date(o.o_date) limit ?,10";
		List<DailyListDTO> detailedList = new ArrayList<DailyListDTO>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (currentPage-1)*10);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				DailyListDTO dDto = new DailyListDTO();
				dDto.setCustomerId(rs.getString(1));
				dDto.setDate(rs.getString(2));
				dDto.setpName(rs.getString(3));
				dDto.setUnitPrice(rs.getString(4));
				dDto.setQuantity(rs.getString(5));
				dDto.setOrderId(rs.getString(6));
				dDto.setSumPrice(rs.getString(7));
				detailedList.add(dDto);
			}
			rs.close();
			return detailedList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return null;
	}
	
	public List<DailyListDTO> detailedListByCustomer(int currentPage) { //고객단위 일별 상세주문 리스트 (10줄 씩)
		conn = DBManager.getConnection();
		String sql = "select o.o_customerId, date(o.o_date), p.p_name, p.p_unitPrice, sp.s_quantity,o.o_id, p.p_unitPrice*sp.s_quantity " + 
				"from sold_products as sp inner join products as p on p.p_id=sp.s_productId  " + 
				"inner join orders as o on o.o_id=sp.s_orderId order by o.o_customerId limit ?,10";
		List<DailyListDTO> detailedList = new ArrayList<DailyListDTO>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (currentPage-1)*10);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				DailyListDTO dDto = new DailyListDTO();
				dDto.setCustomerId(rs.getString(1));
				dDto.setDate(rs.getString(2));
				dDto.setpName(rs.getString(3));
				dDto.setUnitPrice(rs.getString(4));
				dDto.setQuantity(rs.getString(5));
				dDto.setOrderId(rs.getString(6));
				dDto.setSumPrice(rs.getString(7));
				detailedList.add(dDto);
			}
			rs.close();
			return detailedList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return null;
	}

	public List<DailyListDTO> productSaleList(int currentPage) {//일단위 제품별 상세주문 리스트(10줄 씩)
		conn = DBManager.getConnection();
		String sql = "select date(o.o_date), p.p_id, p.p_name, p.p_unitPrice, sum(sp.s_quantity), sum(sp.s_quantity*p.p_unitPrice) " + 
				"from products as p inner join sold_products as sp on p.p_id=sp.s_productId " + 
				"inner join orders as o on o.o_id=sp.s_orderId group by p.p_id order by date(o.o_date),p.p_id limit ?,10;";
		List<DailyListDTO> productList = new ArrayList<DailyListDTO>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (currentPage-1)*10);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				DailyListDTO dDto = new DailyListDTO();
				dDto.setDate(rs.getString(1));
				dDto.setpId(rs.getString(2));
				dDto.setpName(rs.getString(3));
				dDto.setUnitPrice(rs.getString(4));
				dDto.setQuantity(rs.getString(5));
				dDto.setpSumPrice(rs.getString(6));
				productList.add(dDto);
			}
			rs.close();
			return productList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed())
					conn.close();
					pstmt.close();
			} catch (Exception se1) {
				se1.printStackTrace();
			}
		}
		return null;
	}
	
	public boolean addAdmin(AdminDTO admins) { // 관리자 회원가입
		conn = DBManager.getConnection();
		LOG.debug("addAdmin:" + admins);
		String sql = "insert into admins(a_name, a_password, a_dept, a_tel) values(?,?,?,?);";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admins.getaName());
			pstmt.setString(2, bc.hashpw(admins.getaPassword(), bc.gensalt(10)));
			pstmt.setString(3, admins.getaDept());
			pstmt.setString(4, admins.getaTel());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
			return false;
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	public boolean adminLogin(int aId, String passwd) { // 관리자 로그인
		conn = DBManager.getConnection();
		String sql = "select a_password from admins where a_id = ?";
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, aId);
			rs = pstmt.executeQuery();
			rs.next();
			String hashedPw = rs.getString(1);
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
	
	public String getAdminsName(int aId) { // 관리자 이름 얻기
		conn = DBManager.getConnection();
		String sql = "select a_name from admins where a_id = ?";
		String name = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, aId);
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
	
	
}
