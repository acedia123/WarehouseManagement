package Entity;

public class Kho {

    private String maKho, tenKho, diaChi;
    private int trangThai;
    
    public Kho() {
    }

    public Kho(String maKho, String tenKho, String diaChi) {
        this.maKho = maKho;
        this.tenKho = tenKho;
        this.diaChi = diaChi;
    }
    
    public Kho(String maKho, String tenKho, String diaChi,int trangThai) {
        this.maKho = maKho;
        this.tenKho = tenKho;
        this.diaChi = diaChi;
        this.trangThai = trangThai;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }
    
    public String getMaKho() {
        return maKho;
    }

    public void setMaKho(String maKho) {
        this.maKho = maKho;
    }

    public String getTenKho() {
        return tenKho;
    }

    public void setTenKho(String tenKho) {
        this.tenKho = tenKho;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    @Override
    public String toString() {
        return "Kho{" + "maKho=" + maKho + ", tenKho=" + tenKho + ", diaChi=" + diaChi + ", trangThai=" + trangThai + '}';
    }

}
