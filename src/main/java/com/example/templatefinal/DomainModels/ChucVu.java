package com.example.templatefinal.DomainModels;



import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

/**
 * ChucVu generated by hbm2java
 */
@Entity
@Table(name="ChucVu"
        ,schema="dbo"
        ,catalog="FINALASS_FPOLYSHOP_FA22_SOF205__SOF2041"
        , uniqueConstraints = @UniqueConstraint(columnNames="Ma")
)
public class ChucVu  implements java.io.Serializable {


    private UUID id;
    private String ma;
    private String ten;
    private Set<NhanVien> nhanViens = new HashSet<NhanVien>(0);

    public ChucVu() {
    }


    public ChucVu(UUID id) {
        this.id = id;
    }

    public ChucVu(UUID id, String ma, String ten) {
        this.id = id;
        this.ma = ma;
        this.ten = ten;
    }

    @Id


    @Column(name = "Id", unique = true, nullable = false, length = 36)
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
    @Override
    public String toString() {
        return ten;
    }


    @OneToMany(fetch=FetchType.EAGER, mappedBy="chucVu")
    public Set<NhanVien> getNhanViens() {
        return this.nhanViens;
    }
    public void setNhanViens(Set<NhanVien> nhanViens) {
        this.nhanViens = nhanViens;
    }


}