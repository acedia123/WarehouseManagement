package Entity;

public class SanPham {

    private String maSanPham, tenSanPham, soDangKi, kichCo, donVi, ngaySanXuat, noiSanXuat, hanSuDung;
    private int soLuongTon, trangThai;
    private float giaNhap, giaBan;
    private DanhMuc danhmuc;

    public SanPham() {
    }

    public SanPham(String maSanPham, String tenSanPham, String soDangKi, String kichCo, String ngaySanXuat, String noiSanXuat, String hanSuDung, int soLuongTo, String donVi, int trangThai, float giaNhap, float giaBan) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.soDangKi = soDangKi;
        this.kichCo = kichCo;
        this.ngaySanXuat = ngaySanXuat;
        this.noiSanXuat = noiSanXuat;
        this.hanSuDung = hanSuDung;
        this.soLuongTon = soLuongTo;
        this.donVi = donVi;
        this.trangThai = trangThai;
        this.giaNhap = giaNhap;
        this.giaBan = giaBan;
    }

    public SanPham(String maSanPham, String tenSanPham, String soDangKi, String kichCo, String ngaySanXuat, String noiSanXuat, String hanSuDung, int soLuongTon, String donVi, int trangThai, float giaNhap, float giaBan, DanhMuc danhmuc) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.soDangKi = soDangKi;
        this.kichCo = kichCo;
        this.ngaySanXuat = ngaySanXuat;
        this.noiSanXuat = noiSanXuat;
        this.hanSuDung = hanSuDung;
        this.soLuongTon = soLuongTon;
        this.donVi = donVi;
        this.trangThai = trangThai;
        this.giaNhap = giaNhap;
        this.giaBan = giaBan;
        this.danhmuc = danhmuc;
    }

    public String getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getSoDangKi() {
        return soDangKi;
    }

    public void setSoDangKi(String soDangKi) {
        this.soDangKi = soDangKi;
    }

    public String getKichCo() {
        return kichCo;
    }

    public void setKichCo(String kichCo) {
        this.kichCo = kichCo;
    }

    public String getNgaySanXuat() {
        return ngaySanXuat;
    }

    public void setNgaySanXuat(String ngaySanXuat) {
        this.ngaySanXuat = ngaySanXuat;
    }

    public String getNoiSanXuat() {
        return noiSanXuat;
    }

    public void setNoiSanXuat(String noiSanXuat) {
        this.noiSanXuat = noiSanXuat;
    }

    public String getHanSuDung() {
        return hanSuDung;
    }

    public void setHanSuDung(String hanSuDung) {
        this.hanSuDung = hanSuDung;
    }

    public int getSoLuongTon() {
        return soLuongTon;
    }

    public void setSoLuongTon(int soLuongTo) {
        this.soLuongTon = soLuongTo;
    }

    public String getDonVi() {
        return donVi;
    }

    public void setDonVi(String donVi) {
        this.donVi = donVi;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public float getGiaNhap() {
        return giaNhap;
    }

    public void setGiaNhap(float giaNhap) {
        this.giaNhap = giaNhap;
    }

    public float getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(float giaBan) {
        this.giaBan = giaBan;
    }

    public DanhMuc getDanhmuc() {
        return danhmuc;
    }

    public void setDanhmuc(DanhMuc danhmuc) {
        this.danhmuc = danhmuc;
    }

    @Override
    public String toString() {
        return "SanPham{" + "maSanPham=" + maSanPham + ", tenSanPham=" + tenSanPham + ", soDangKi=" + soDangKi + ", kichCo=" + kichCo + ", ngaySanXuat=" + ngaySanXuat + ", noiSanXuat=" + noiSanXuat + ", hanSuDung=" + hanSuDung + ", soLuongTon=" + soLuongTon + ", donVi=" + donVi + ", trangThai=" + trangThai + ", giaNhap=" + giaNhap + ", giaBan=" + giaBan + ", danhmuc=" + danhmuc + '}';
    }
}
