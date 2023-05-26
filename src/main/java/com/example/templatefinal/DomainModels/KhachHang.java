package com.example.templatefinal.DomainModels;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.*;

@Entity
@Table(name="KhachHang"
        ,schema="dbo"
        ,catalog="FINALASS_FPOLYSHOP_FA22_SOF205__SOF2041"
        , uniqueConstraints = @UniqueConstraint(columnNames="Ma")
)
public class KhachHang  implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id", unique = true, nullable = false, length = 36)
    private UUID id;
    private String ma;
    private String ten;
    private String tenDem;
    private String ho;
    @Temporal(TemporalType.DATE)
    @Column(name = "NgaySinh", length = 10)
    private Date ngaySinh;
    private String sdt;
    private String diaChi;
    private String thanhPho;
    private String quocGia;
    private String matKhau;


    public KhachHang() {
    }


    public KhachHang(UUID id) {
        this.id = id;
    }

    public KhachHang(UUID id, String ma, String ten, String tenDem, String ho, Date ngaySinh, String sdt, String diaChi, String thanhPho, String quocGia, String matKhau) {
        this.id = id;
        this.ma = ma;
        this.ten = ten;
        this.tenDem = tenDem;
        this.ho = ho;
        this.ngaySinh = ngaySinh;
        this.sdt = sdt;
        this.diaChi = diaChi;
        this.thanhPho = thanhPho;
        this.quocGia = quocGia;
        this.matKhau = matKhau;

    }

    public KhachHang(String ma, String ten, String tenDem, String ho, Date ngaySinh, String sdt, String diaChi, String thanhPho, String quocGia, String matKhau) {
        this.ma = ma;
        this.ten = ten;
        this.tenDem = tenDem;
        this.ho = ho;
        this.ngaySinh = ngaySinh;
        this.sdt = sdt;
        this.diaChi = diaChi;
        this.thanhPho = thanhPho;
        this.quocGia = quocGia;
        this.matKhau = matKhau;

    }


    public UUID getId() {
        return this.id;
    }

    public void setId(UUID id) {
        this.id = id;
    }


    @Column(name = "Ma", unique = true, length = 20)
    public String getMa() {
        return this.ma;
    }

    public void setMa(String ma) {
        this.ma = ma;
    }


    @Column(name = "Ten")
    public String getTen() {
        return this.ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }


    @Column(name = "TenDem")
    public String getTenDem() {
        return this.tenDem;
    }

    public void setTenDem(String tenDem) {
        this.tenDem = tenDem;
    }


    @Column(name = "Ho")
    public String getHo() {
        return this.ho;
    }

    public void setHo(String ho) {
        this.ho = ho;
    }


    public Date getNgaySinh() {
        return this.ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }


    @Column(name = "Sdt", length = 30)
    public String getSdt() {
        return this.sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }


    @Column(name = "DiaChi")
    public String getDiaChi() {
        return this.diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }


    @Column(name = "ThanhPho")
    public String getThanhPho() {
        return this.thanhPho;
    }

    public void setThanhPho(String thanhPho) {
        this.thanhPho = thanhPho;
    }


    @Column(name = "QuocGia")
    public String getQuocGia() {
        return this.quocGia;
    }

    public void setQuocGia(String quocGia) {
        this.quocGia = quocGia;
    }


    @Column(name = "MatKhau")
    public String getMatKhau() {
        return this.matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    @Override
    public String toString() {
        return "hoten: " + ho + " " + tenDem + " " + ten;
    }



}
