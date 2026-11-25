package tr.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Koneksi {

    public Connection con;
    public Statement stm;

    //METHOD untuk konfigurasi ke db
    public void config() {
        try {
            String url = "jdbc:mysql://localhost/db_c";
            String user = "root";
            String pass = "";
            Class.forName("com.mysql.cj.jdbc.Driver");

            //String connection
            con = DriverManager.getConnection(url, user, pass);
            //mempersiapkan variabel untul sql statement
            stm = (Statement) con.createStatement();
            System.out.println("Koneksi Berhasil...");
        } catch (Exception e) {
            System.out.println("Koneksi Gagal..." + e);
        }
    }
}
