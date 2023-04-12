package Model;

import DBContext.DBContext;
import Entity.SanPham;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SanPhamDAO {

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public SanPham getData(ResultSet rs) throws SQLException {
        return new SanPham(rs.getString("maSanPham"),
                rs.getString("tenSanPham"),
                rs.getString("soDangKi"),
                rs.getString("kichCo"),
                rs.getString("ngaySanXuat"),
                rs.getString("noiSanXuat"),
                rs.getString("hanSuDung"),
                rs.getInt("soLuongTon"),
                rs.getString("donVi"),
                rs.getInt("trangThai"),
                rs.getFloat("giaNhap"),
                rs.getFloat("giaBan"));
    }

    public List<SanPham> getAllSanPham() throws Exception {
        List<SanPham> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM SanPham";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(getData(rs));
            }
        } catch (SQLException e) {
            System.out.println("Checking: " + e.getMessage());
        }
        return list;
    }

    public List<SanPham> getSanPhamTheoKe(String maKe) throws Exception {
        List<SanPham> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM SanPham WHERE maKe = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maKe);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SanPham(rs.getString("maSanPham"),
                        rs.getString("tenSanPham"),
                        rs.getString("soDangKi"),
                        rs.getString("kichCo"),
                        rs.getString("ngaySanXuat"),
                        rs.getString("noiSanXuat"),
                        rs.getString("hanSuDung"),
                        rs.getInt("soLuongTon"),
                        rs.getString("donVi"),
                        rs.getInt("trangThai"),
                        rs.getFloat("giaNhap"),
                        rs.getFloat("giaBan")));
            }

        } catch (SQLException e) {
            System.out.println("Checking: " + e.getMessage());
        }
        return list;
    }
}
