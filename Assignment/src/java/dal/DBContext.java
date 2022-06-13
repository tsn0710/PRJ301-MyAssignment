/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tong Nhat
 */
public abstract class DBContext<T> {
    Connection connection;
    public DBContext() {
        try {
            String user = "tsn";
            String pass = "12345678";
            String url = "jdbc:sqlserver://TONGNHAT0710200\\MSSQLSERVER:1433;databaseName=assignment";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try {
                connection = DriverManager.getConnection(url, user, pass);
            } catch (SQLException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public abstract ArrayList<T> list();
    public abstract ArrayList<T> list(int did);
    public abstract T get(int id);
    public abstract boolean insert(T model);
    public abstract boolean update(T model);
    public abstract boolean delete(T model);

    
}
