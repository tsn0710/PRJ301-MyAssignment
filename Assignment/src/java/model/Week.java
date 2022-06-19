/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author Tong Nhat
 */
public class Week {
    int no;
    Date dfrom;
    Date dto;

    @Override
    public String toString() {
        String result = "";
        LocalDate df = dfrom.toLocalDate();
        LocalDate dt = dto.toLocalDate();
        result+=df.getDayOfMonth()+"/"+df.getMonthValue();
        result+=" to ";
        result+=dt.getDayOfMonth()+"/"+dt.getMonthValue();
        return result;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public Date getDfrom() {
        return dfrom;
    }

    public void setDfrom(Date dfrom) {
        this.dfrom = dfrom;
    }

    public Date getDto() {
        return dto;
    }

    public void setDto(Date dto) {
        this.dto = dto;
    }
    
    
}
