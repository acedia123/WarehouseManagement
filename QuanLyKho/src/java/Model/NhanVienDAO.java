package Model;

import DBContext.DBContext;
import Entity.NhanVien;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class NhanVienDAO {

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public NhanVien loginAccount(String userName, String password) {
        String query = "SELECT * FROM NhanVien WHERE [tenDangNhap] = ? and [matKhau] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new NhanVien(rs.getString("maNV"),
                        rs.getString("tenDangNhap"),
                        rs.getString("matKhau"),
                        rs.getString("tenNhanVien"),
                        rs.getInt("tuoi"), rs.getInt("trangThai"),
                        rs.getInt("chucVu"),
                        rs.getBoolean("gioiTinh")
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) throws Exception {
        NhanVienDAO dao = new NhanVienDAO();
        System.out.println(dao.loginAccount("admin", "admin"));
    }
}
