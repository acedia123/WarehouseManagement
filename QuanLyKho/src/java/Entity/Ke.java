
package Entity;

import java.util.List;


public class Ke {

    private String maKe, tenKe, kichCo;
    private DanhMuc danhMuc;
    private int dong;
    private List<SanPham> dsSanPham;
    private Kho store;
    private int trangThai;

    public Ke() {
    }

    public Ke(String maKe, String tenKe, String kichCo, DanhMuc danhMuc, int dong, List<SanPham> dsSanPham, Kho store, int trangThai) {
        this.maKe = maKe;
        this.tenKe = tenKe;
        this.kichCo = kichCo;
        this.danhMuc = danhMuc;
        this.dong = dong;
        this.dsSanPham = dsSanPham;
        this.store = store;
        this.trangThai = trangThai;
    }

    public String getMaKe() {
        return maKe;
    }

    public void setMaKe(String maKe) {
        this.maKe = maKe;
    }

    public String getTenKe() {
        return tenKe;
    }

    public void setTenKe(String tenKe) {
        this.tenKe = tenKe;
    }

    public String getKichCo() {
        return kichCo;
    }

    public void setKichCo(String kichCo) {
        this.kichCo = kichCo;
    }

    public DanhMuc getDanhMuc() {
        return danhMuc;
    }

    public void setDanhMuc(DanhMuc danhMuc) {
        this.danhMuc = danhMuc;
    }

    public int getDong() {
        return dong;
    }

    public void setDong(int dong) {
        this.dong = dong;
    }

    public List<SanPham> getDsSanPham() {
        return dsSanPham;
    }

    public void setDsSanPham(List<SanPham> dsSanPham) {
        this.dsSanPham = dsSanPham;
    }

    public Kho getStore() {
        return store;
    }

    public void setStore(Kho store) {
        this.store = store;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    @Override
    public String toString() {
        return "Ke{" + "maKe=" + maKe + ", tenKe=" + tenKe + ", kichCo=" + kichCo + ", danhMuc=" + danhMuc + ", dong=" + dong + ", dsSanPham=" + dsSanPham + ", store=" + store + ", trangThai=" + trangThai + '}';
    }
}
