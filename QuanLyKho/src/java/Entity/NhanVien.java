package Entity;

public class NhanVien {

    private String maNV, tenDangNhap, matKhau, tenNhanVien;
    private int tuoi,trangThai,chucVu;
    private boolean gioiTinh;

    public NhanVien() {
    }

    public NhanVien(String maNV, String tenDangNhap, String matKhau) {
        this.maNV = maNV;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
    }

    public NhanVien(String maNV, String tenDangNhap, String matKhau, String tenNhanVien, int tuoi, int trangThai, int chucVu, boolean gioiTinh) {
        this.maNV = maNV;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.tenNhanVien = tenNhanVien;
        this.tuoi = tuoi;
        this.trangThai = trangThai;
        this.chucVu = chucVu;
        this.gioiTinh = gioiTinh;
    }
    
    public String getMaNV() {
        return maNV;
    }

    public void setMaNV(String maNV) {
        this.maNV = maNV;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getTenNhanVien() {
        return tenNhanVien;
    }

    public void setTenNhanVien(String tenNhanVien) {
        this.tenNhanVien = tenNhanVien;
    }

    public int getTuoi() {
        return tuoi;
    }

    public void setTuoi(int tuoi) {
        this.tuoi = tuoi;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public int getChucVu() {
        return chucVu;
    }

    public void setChucVu(int chucVu) {
        this.chucVu = chucVu;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    @Override
    public String toString() {
        return "NhanVien{" + "maNV=" + maNV + ", tenDangNhap=" + tenDangNhap + ", matKhau=" + matKhau + ", tenNhanVien=" + tenNhanVien + ", tuoi=" + tuoi + ", trangThai=" + trangThai + ", chucVu=" + chucVu + ", gioiTinh=" + gioiTinh + '}';
    }
    
    
	
}
