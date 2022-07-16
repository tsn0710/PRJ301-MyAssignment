/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Instructor;

/**
 *
 * @author Tong Nhat
 */
public class AccountDBContext extends DBContext<Account> {
    
    public boolean isExistInDB(String name, String password){
        try {
            PreparedStatement sql = connection.prepareStatement("select * from [Account] where name =? and password=?");
            sql.setString(1, name);
            sql.setString(2, password);
            ResultSet rs = sql.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public Account getAccount(String name, String password){
        try {
            PreparedStatement sql = connection.prepareStatement("select [Account].*,[Instructor].name as InstructorName from [Account] join [Instructor] on [Account].InstructorID = [Instructor].id where [Account].name =? and [Account].password=?");
            sql.setString(1, name);
            sql.setString(2, password);
            ResultSet rs = sql.executeQuery();
            if (rs.next()) {
                Account hehe = new Account();
                hehe.setPassword(password);
                hehe.setUserName(name);
                hehe.setInstructor(new Instructor(rs.getString("InstructorID"),rs.getString("InstructorName")));
                return hehe;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Account> list(int did) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
