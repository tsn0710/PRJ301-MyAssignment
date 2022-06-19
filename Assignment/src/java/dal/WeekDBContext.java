/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Week;

/**
 *
 * @author Tong Nhat
 */
public class WeekDBContext extends DBContext<Week> {

    public void generateWeek() {
        //tao table
        createTable();
        //1 nam co khoang 53 tuan
        int numberOfWeek = 53;
        //ngay bat dau la tu ngay 3 thang 1 nam 2022 (xem tren fap)
        Date dfrom = Date.valueOf("2022-01-03");
        LocalDate df = LocalDate.parse(dfrom.toString());
        ArrayList<Week> arr = new ArrayList<>();
        while (numberOfWeek != 0) {
            //add each week to DB
            addAWeek(53 - numberOfWeek + 1, df);
            df = df.plusDays(7);
            numberOfWeek--;
        }
    }

    @Override
    public ArrayList<Week> list() {
        try {
            ArrayList<Week> arr= new ArrayList<>();
            PreparedStatement sql = connection.prepareStatement("SELECT [no]\n"
                    + "      ,[dfrom]\n"
                    + "      ,[dto]\n"
                    + "  FROM [Week]");
            ResultSet rs = sql.executeQuery();
            while(rs.next()){
                Week a = new Week();
                a.setNo(rs.getInt("no"));
                a.setDfrom(rs.getDate("dfrom"));
                a.setDto(rs.getDate("dto"));
                arr.add(a);
            }
            return arr;
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Week> list(int did) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Week get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(Week model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Week model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Week model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void addAWeek(int i, LocalDate df) {
        Date dto = Date.valueOf(df.plusDays(6));
        Date dfrom = Date.valueOf(df);
        int no = i;
        try {
            PreparedStatement sql = connection.prepareStatement("INSERT INTO [Week]\n"
                    + "           ([no]\n"
                    + "           ,[dfrom]\n"
                    + "           ,[dto])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)");
            sql.setInt(1, i);
            sql.setDate(2, dfrom);
            sql.setDate(3, dto);
            ResultSet rs = sql.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void createTable() {
        try {
            PreparedStatement sql = connection.prepareStatement("create table [Week](\n"
                    + "	[no] [int] not null primary key,\n"
                    + "	[dfrom] [date] not null,\n"
                    + "	[dto] [date] not null\n"
                    + ")");
            ResultSet rs = sql.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void createTableGroup() {
        try {
            PreparedStatement sql = connection.prepareStatement("CREATE TABLE [Group](\n"
                    + "	[group] [nvarchar](50) NOT NULL primary key\n"
                    + "	\n"
                    + " )\nCREATE TABLE [dbo].[all](\n"
                    + "	[id] [nvarchar](50) NOT NULL,\n"
                    + "	[group] [nvarchar](50) NOT NULL,\n"
                    + "	[course] [nvarchar](50) NOT NULL,\n"
                    + "	[instructor] [nvarchar](50) NOT NULL,\n"
                    + "	[slot] [int] NOT NULL,\n"
                    + "	[room] [nvarchar](50) NOT NULL,\n"
                    + "	[date] [date] NOT NULL,\n"
                    + "	[numberOfWeek] [int] not null,\n"
                    + "	FOREIGN KEY ([group]) REFERENCES [Group] ([Group]),\n"
                    + "	FOREIGN KEY ([numberOfWeek]) REFERENCES [Week] ([no]),\n"
                    + " CONSTRAINT [PK_all] PRIMARY KEY CLUSTERED \n"
                    + "(\n"
                    + "	[id] ASC\n"
                    + ")WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\n"
                    + ") ON [PRIMARY]\n"
                    + "GO \nCREATE TABLE [dbo].[Student](\n"
                    + "	[id] [nvarchar](50) NOT NULL,\n"
                    + "	[group] [nvarchar](50) NOT NULL,\n"
                    + "	[name] [nvarchar](50) NOT NULL,\n"
                    + " CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED \n"
                    + "(\n"
                    + "	[id] ASC\n"
                    + ")WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\n"
                    + ") ON [PRIMARY]\n"
                    + "GO\n ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group] FOREIGN KEY([group])\n"
                    + "REFERENCES [dbo].[Group] ([group])\n"
                    + "\n"
                    + "ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Group]\n"
                    + "GO");
            ResultSet rs = sql.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
