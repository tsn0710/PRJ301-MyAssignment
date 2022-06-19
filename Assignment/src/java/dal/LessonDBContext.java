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
import model.Lesson;

/**
 *
 * @author Tong Nhat
 */
public class LessonDBContext extends DBContext<Lesson>{

    @Override
    public ArrayList<Lesson> list() {
        try {
            ArrayList<Lesson> ds = new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("select * from [all]");
            ResultSet rs = sql.executeQuery();
            while(rs.next()){
                Lesson a = new Lesson();
                a.setId(rs.getInt("id"));
                a.setSlot(rs.getInt("slot"));
                a.setDate(rs.getDate("date"));
                a.setGroup(rs.getString("group"));
                a.setCourse(rs.getString("course"));
                a.setInstructor(rs.getString("instructor"));
                a.setRoom(rs.getString("room"));
                ds.add(a);
            }
            return ds;
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    
    public ArrayList<Lesson> list(int did,int numberOfWeek) {
        int slot = did;
        try {
            ArrayList<Lesson> ds = new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("select *\n" +"from [all] where slot = ? and numberOfWeek= ?");
            sql.setInt(1, slot);
            sql.setInt(2, numberOfWeek);
            ResultSet rs = sql.executeQuery();
            while(rs.next()){
                Lesson a = new Lesson();
                a.setSlot(slot);
                a.setId(rs.getInt("id"));
                a.setDate(rs.getDate("date"));
                a.setGroup(rs.getString("group"));
                a.setCourse(rs.getString("course"));
                a.setInstructor(rs.getString("instructor"));
                a.setRoom(rs.getString("room"));
                a.setNumberOfWeek(numberOfWeek);
                ds.add(a);
            }
            return ds;
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Lesson get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(Lesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Lesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Lesson model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Lesson> list(int did) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
