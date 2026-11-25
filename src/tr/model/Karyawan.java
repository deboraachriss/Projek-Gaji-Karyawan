package tr.model;

import java.sql.Date;

public class Karyawan {

    private int idkaryawan;
    private String nama;
    private String alamat;
    private Date tanggal_masuk;
    private int no_rek;
    private String email;
    private String no_hp;

    public int getIdkaryawan() {
        return idkaryawan;
    }

    public void setIdkaryawan(int idkaryawan) {
        this.idkaryawan = idkaryawan;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public Date getTanggal_masuk() {
        return tanggal_masuk;
    }

    public void setTanggal_masuk(Date tanggal_masuk) {
        this.tanggal_masuk = tanggal_masuk;
    }

    public int getNo_rek() {
        return no_rek;
    }

    public void setNo_rek(int no_rek) {
        this.no_rek = no_rek;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNo_hp() {
        return no_hp;
    }

    public void setNo_hp(String no_hp) {
        this.no_hp = no_hp;
    }
}


