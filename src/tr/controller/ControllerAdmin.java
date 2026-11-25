/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tr.controller;

import java.sql.ResultSet;
import java.sql.Statement;
import tr.model.LoginAdmin;

/**
 *
 * @author ASUS
 */
public class ControllerAdmin {

    public Statement stm;
    public ResultSet res;
    public String sql;

    //KONSTRUKTOR
    public ControllerAdmin() {
        Koneksi db = new Koneksi();
        db.config();
        this.stm = db.stm;
    }

    public boolean cekLogin(String a, String b) {
        LoginAdmin la = new LoginAdmin();
        la.setUsername(a);
        la.setPassword(b);
        boolean status = false;

        try {
            this.sql = "SELECT * FROM tb_admin WHERE username=" + la.getUsername() + "AND password=" + la.getPassword() + "'";

            res = stm.executeQuery(sql);

            if (res.next()) {
                status = true;
            } else {
                status = false;
            }
        } catch (Exception e) {
            System.out.println("gagal query" + e);
        }
        return status;
    }
}
