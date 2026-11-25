/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tr.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ASUS
 */
public class ControllerKaryawan {
    public Statement stm;
    public ResultSet res;
    public String sql;
    private DefaultTableModel dtm; // Deklarasi DefaultTableModel

    // Inisialisasi Koneksi
    Koneksi db = new Koneksi();

    // Konstruktor
    public ControllerKaryawan() {
        db.config();
        this.stm = db.stm;
        this.dtm = new DefaultTableModel();
    }

    // Method untuk membuat model tabel
    public DefaultTableModel buatTabel() {
        dtm.addColumn("id");
        dtm.addColumn("nama karyawan");
        dtm.addColumn("alamat");
        dtm.addColumn("tanggal masuk");
        dtm.addColumn("jabatan");
        dtm.addColumn("no rekening");
        dtm.addColumn("email");
        dtm.addColumn("no. hp");
        return dtm;
    }

    // Method untuk mengambil data (SELECT)
    public void tampilkanData() throws SQLException {
        try {
            // Bersihkan data lama dari tabel
            dtm.getDataVector().removeAllElements();
            dtm.fireTableDataChanged();

            // Query
            this.sql = "SELECT * FROM tb_karyawan";

            // Jalankan query
            res = stm.executeQuery(sql);

            // Unboxing data ke dalam array
            while (res.next()) {
                Object[] obj = new Object[8]; // Ukuran array 8
                obj[0] = res.getString("id_karyawan");
                obj[1] = res.getString("nama");
                obj[2] = res.getString("alamat");
                obj[3] = res.getString("tanggal_masuk");
                obj[4] = res.getString("jabatan");
                obj[5] = res.getString("no_rek");
                obj[6] = res.getString("email");
                obj[7] = res.getString("no_hp");

                // Masukkan obj ke dalam DefaultTableModel
                dtm.addRow(obj);
            }
        } catch (Exception e) {
            System.out.println("Gagal menjalankan query: " + e.getMessage());
        }
    }
    
    public void tambahData() throws SQLException{
        

    }

}
