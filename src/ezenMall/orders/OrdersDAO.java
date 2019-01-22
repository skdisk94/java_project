package ezenMall.orders;

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

public class OrdersDAO {
	private static final Logger LOG = LoggerFactory.getLogger(OrdersDAO.class);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BCrypt bc = new BCrypt();
	
	public boolean addOrders(OrdersDTO orders) {	//orders 테이블에 주문 추가하기
		conn = DBManager.getConnection();
		String sql = "insert into orders(o_customerId, o_date, o_price) values(?,now(),?);";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(orders.getoCustomerId()));
			pstmt.setInt(2, Integer.parseInt(orders.getoPrice()));
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
	
	public boolean addSolp(SoldPDTO solp) {		//sold_products 테이블에 주문 추가하기
		conn = DBManager.getConnection();
		String sql = "insert into sold_products values (?,?,?);";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(solp.getsOrderId()));
			pstmt.setInt(2, Integer.parseInt(solp.getsProductId()));
			pstmt.setInt(3, Integer.parseInt(solp.getsQuantity()));
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
	
	public int orderIdSelect(int customerId) {		//주문번호 받아오기
		conn = DBManager.getConnection();
		String sql = "select o_id from orders where o_customerId=? order by o_date desc limit 1";
		int orderId = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, customerId);
			rs = pstmt.executeQuery();
			rs.next();
			orderId = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return orderId;
	}
	
	public List<OrdersDTO> orderHistory(int customerId, int currentPage){		//주문내역 보여주기
		conn = DBManager.getConnection();
		String sql = "select o_id,date(o_date),o_price from orders where o_customerid=? limit ?,10";
		List<OrdersDTO> orderHistory = new ArrayList<OrdersDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, customerId);
			pstmt.setInt(2, (currentPage-1)*10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrdersDTO oDto = new OrdersDTO();
				oDto.setoId(rs.getString(1));
				oDto.setoDate(rs.getString(2));
				oDto.setoPrice(rs.getString(3));
				orderHistory.add(oDto);
			}
			rs.close();
			return orderHistory;
		}catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public int getTotalPageOrder(int customerId) { // 주문 내역 페이지 수
		conn = DBManager.getConnection();
		String sql = "select count(a.o_id) from (select o_id,date(o_date),o_price from orders where o_customerid=?) as a;";
		int page = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, customerId);
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

	public List<DetailOrdersDTO> detailOrders(){
		conn = DBManager.getConnection();
		String sql = "select sp.s_orderId,p.p_id, p.p_name, p.p_imgName, sp.s_quantity, p.p_unitPrice, p.p_unitPrice * sp.s_quantity as price " + 
				"from sold_products as sp inner join products as p on sp.s_productId=p.p_id";
		List<DetailOrdersDTO> detailOrderList = new ArrayList<DetailOrdersDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DetailOrdersDTO dODto = new DetailOrdersDTO();
				dODto.setoId(rs.getString(1));
				dODto.setpId(rs.getString(2));
				dODto.setpName(rs.getString(3));
				dODto.setImgName(rs.getString(4));
				dODto.setQuantity(rs.getString(5));
				dODto.setUnitPrice(rs.getString(6));
				dODto.setPrice(rs.getString(7));
				detailOrderList.add(dODto);
			}
			rs.close();
			return detailOrderList;
		}catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
}
