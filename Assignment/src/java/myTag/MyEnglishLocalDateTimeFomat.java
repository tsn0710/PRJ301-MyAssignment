/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package myTag;

import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Tong Nhat
 */
public class MyEnglishLocalDateTimeFomat extends SimpleTagSupport {
    private String formatLocalDateTime;
    private String localDateTimeOfRecordTimeOfStudentLesson;

    public MyEnglishLocalDateTimeFomat() {
    }

    public void setFormatLocalDateTime(String formatLocalDateTime) {
        this.formatLocalDateTime = formatLocalDateTime;
    }

    public void setLocalDateTimeOfRecordTimeOfStudentLesson(String localDateTimeOfRecordTimeOfStudentLesson) {
        this.localDateTimeOfRecordTimeOfStudentLesson = localDateTimeOfRecordTimeOfStudentLesson;
    }
    
    @Override
    public void doTag() throws IOException{
        LocalDateTime thisLocalDateTime = LocalDateTime.parse(localDateTimeOfRecordTimeOfStudentLesson);
        System.out.println(localDateTimeOfRecordTimeOfStudentLesson);
        formatLocalDateTime=thisLocalDateTime.format(DateTimeFormatter.ofPattern("M/dd/yyyy h:mm:ss a"));
        //co the la 7/09/2022 7:56:36 CH (19 h 56 p toi ngay 9 thang 7 nam 2022)
        //thay CH bang PM, thay SA bang AM
        if(formatLocalDateTime.substring(formatLocalDateTime.length()-2).equals("CH")){
            getJspContext().getOut().write( formatLocalDateTime.replace("CH", "PM"));
        }else if(formatLocalDateTime.substring(formatLocalDateTime.length()-2).equals("SA")){
            getJspContext().getOut().write( formatLocalDateTime.replace("SA", "AM"));
        }
    }
   
}
