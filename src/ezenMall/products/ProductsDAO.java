package ezenMall.products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import util.DBManager;

public class ProductsDAO {
	private static final Logger LOG = LoggerFactory.getLogger(ProductsDAO.class);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<ProductsDTO> AllByProducts(int num1) {
		ArrayList<ProductsDTO> imgNameList = new ArrayList<ProductsDTO>();
		conn = DBManager.getConnection();
		String sql = "select * from products limit ?,5;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num1);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductsDTO products = new ProductsDTO();
				products.setpId(rs.getString(1));
				products.setpName(rs.getString(2));
				products.setpUnitPrice(rs.getString(3));
				products.setpImgName(rs.getString(4));
				products.setpDescription(rs.getString(5));
				imgNameList.add(products);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			LOG.info("Error Code : {}", e.getErrorCode());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return imgNameList;
	}
}
