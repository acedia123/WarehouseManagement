package Model;

import DBContext.DBContext;
import Entity.Ke;
import Entity.Kho;
import Entity.SanPham;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class KeDAO {

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public List<Ke> getAllKe() throws Exception {
        SanPhamDAO spDao = new SanPhamDAO();
        KhoDAO khoDao = new KhoDAO();
        List<Ke> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Ke";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                List<SanPham> dsSanPham = spDao.getSanPhamTheoKe(rs.getString("maKe"));
                Kho store = khoDao.getStoreById(rs.getString("maKho"));
                list.add(new Ke(rs.getString("maKe"),
                        rs.getString("tenKe"),
                        rs.getString("kichCo"),
                        null,
                        rs.getInt("dong"),
                        dsSanPham,
                        store,
                        rs.getInt("trangThai")));
            }
        } catch (SQLException e) {
            System.out.println("Checking: " + e.getMessage());
        }
        return list;
    }

    public Ke getKeTheoMaKe(String maKe) throws Exception {
        SanPhamDAO spDao = new SanPhamDAO();
        try {
            String sql = "SELECT * FROM Ke WHERE maKe = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, maKe);
            rs = ps.executeQuery();
            while (rs.next()) {
                List<SanPham> dsSanPham = spDao.getSanPhamTheoKe(rs.getString("maKe"));
                return new Ke(rs.getString("maKe"),
                        rs.getString("tenKe"),
                        rs.getString("kichCo"),
                        null,
                        rs.getInt("dong"),
                        dsSanPham,
                        null,
                        rs.getInt("trangThai"));
            }
        } catch (SQLException e) {
            System.out.println("Checking: " + e.getMessage());
        }
        return null;
    }

    public int getNumOfKe() throws Exception {
        try {
            String sql = "SELECT COUNT(*) FROM Ke";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Loi" + e.getMessage());
        }
        return 0;
    }

    public Boolean addKe(Ke ke) throws Exception {
        try {
            String sql = "INSERT INTO Ke (maKe,tenKe,kichCo,dong,maKho) "
                    + "VALUES(?,?,?,0,?)";
            int numberElements = getNumOfKe();
            System.out.println(ke);
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "K" + (numberElements + 1));
            ps.setString(2, ke.getTenKe());
            ps.setString(3, ke.getKichCo());
            ps.setString(4, ke.getStore().getMaKho());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error add: " + e.getMessage());
            return false;
        }
    }
    
    public Boolean editKe(Ke ke) throws Exception {
        try {
            String sql = "UPDATE Ke SET tenKe = ?, maKho = ?, kichCo = ?, ngaySua = ?"
                    + " WHERE maKe = ?";
            conn = new DBContext().getConnection();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            ps = conn.prepareStatement(sql);
            ps.setString(1, ke.getTenKe());
            ps.setString(2, ke.getStore().getMaKho());
            ps.setString(2, ke.getKichCo());
            ps.setString(3, dtf.format(now));
            ps.setString(4, ke.getMaKe());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) throws Exception {
        KeDAO dao = new KeDAO();
        List<Ke> list = dao.getAllKe();
        System.out.println(dao.getKeTheoMaKe("K1"));
        for (Ke ke : list) {
            System.out.println(ke);
        }
    }
}
