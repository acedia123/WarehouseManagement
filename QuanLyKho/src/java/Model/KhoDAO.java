package Model;

import DBContext.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import Entity.Kho;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class KhoDAO {

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement ps = null;

    public List<Kho> getAllStores() throws Exception {
        List<Kho> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Kho";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Kho(rs.getString("maKho"),
                        rs.getString("tenKho"),
                        rs.getString("diaChi")));
            }
        } catch (SQLException e) {
            System.out.println("Checking: " + e.getMessage());
        }
        return list;
    }

    public List<Kho> searchByPage(int index, int page, String search) throws Exception {
        List<Kho> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Kho";
            if (search != null) {
                sql += " WHERE tenKho like '%" + search + "%'";
            }
            sql += " ORDER BY ngaySua DESC"
                    + " OFFSET ? ROWS FETCH NEXT ? ROW ONLY";

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, page * index);
            ps.setInt(2, page * index + page);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Kho(rs.getString("maKho"),
                        rs.getString("tenKho"),
                        rs.getString("diaChi"), rs.getInt("trangThai")));
            }
        } catch (SQLException e) {
            System.out.println("Checking: " + e.getMessage());
        }
        return list;
    }

    public Boolean addStore(Kho store) throws Exception {
        try {
            String sql = "INSERT INTO Kho (maKho,tenKho,diaChi) "
                    + "VALUES(?,N'" + store.getTenKho() + "',?)";
            int numberElements = getNumOfStore();
            System.out.println(store);
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "KHO" + (numberElements + 1));
            ps.setString(2, store.getDiaChi());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error add: " + e.getMessage());
            return false;
        }
    }

    public Boolean editStore(Kho store) throws Exception {
        try {
            String sql = "UPDATE Kho SET tenKho = ?, diaChi = ?, ngaySua = ?"
                    + " WHERE maKho = ?";
            conn = new DBContext().getConnection();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            ps = conn.prepareStatement(sql);
            ps.setString(1, store.getTenKho());
            ps.setString(2, store.getDiaChi());
            ps.setString(3, dtf.format(now));
            ps.setString(4, store.getMaKho());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }

    public Kho getStoreById(String id) {
        try {
            String sql = "SELECT * FROM Kho WHERE [maKho] = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Kho(rs.getString("maKho"),
                        rs.getString("tenKho"),
                        rs.getString("diaChi"));
            }
        } catch (Exception e) {
            System.out.println("Checking: " + e.getMessage());
        }
        return null;
    }

    public int getNumOfStore() throws Exception {
        try {
            String sql = "SELECT COUNT(*) FROM KHO";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Loi getAllNumDigitalBySearch " + e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) throws Exception {
        KhoDAO dao = new KhoDAO();
//        List<Store> list = dao.getAllStores();
        List<Kho> lists = dao.searchByPage(0, 10, null);
//        System.out.println(dao.getNumOfStore());
        for (Kho store : lists) {
            System.out.println("hihi" + store);
        }
//        Kho st = new Kho("h1", "Kho Ha Noi", "Ahihi");
//        Boolean check = dao.addStore(st);
//        System.out.println(check);
    }
}
