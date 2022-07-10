/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utility;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.Lesson;

/**
 *
 * @author Tong Nhat
 */
public class Utility {

    public static int getStatus(Lesson thisLesson, ArrayList<String> statusList) {
        //status la so StudentLesson
        //statusList la cua nhieu Lesson nhung trong ham nay ta chi lay dung cai status can thiet
        String lessonID = Integer.toString(thisLesson.getId());
        int status = 0;
        if (getEndTimeOfLesson(thisLesson).isBefore(LocalDateTime.now())) {
            status = -1;
            for (String thisStatus : statusList) {
                if (lessonID.equals(thisStatus.split("_")[0])) {
                    status = Integer.parseInt(thisStatus.split("_")[1]);
                    if (status > 0) {
                        status = 1;
                    }
                }
            }
            return status;
        }
        return status;
    }

    public static String getTimeSlot(String slot) {

        //tung char trong nhung string nay co tac dung trong ham isAllowToTakeAttendance
        //edit ham nay co the dan den ham isAllowToTakeAttendance bi loi
        if (slot.contains("1")) {
            return "<p  style=\"color: white\" class=\"a\">(7:30-9:00)</p>";
        }
        if (slot.contains("2")) {
            return "<p  style=\"color: white\" class=\"a\">(9:10-10:40)</p>";
        }
        if (slot.contains("3")) {
            return "<p style=\"color: white\" class=\"a\">(10:50-12:20)</p>";
        }
        if (slot.contains("4")) {
            return "<p style=\"color: white\" class=\"a\">(12:50-14:20)</p>";
        }
        if (slot.contains("5")) {
            return "<p style=\"color: white\" class=\"a\">(14:30-16:00)</p>";
        }
        if (slot.contains("6")) {
            return "<p style=\"color: white\" class=\"a\">(16:10-17:40)</p>";
        }
        if (slot.contains("7")) {
            return "<p style=\"color: white\" class=\"a\">(17:50-19:20)</p>";
        }
        if (slot.contains("8")) {
            return "<p style=\"color: white\" class=\"a\">(19:50-21:20)</p>";
        }
        return "";
    }

    public static String dateTimeStringToDisplayInBrower(String dateTime) {
        LocalDateTime todayVietNam = LocalDateTime.parse(dateTime);
        String returnString = todayVietNam.format(DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm:ss a"));
        //2022/07/09 07:56:36 CH (19 h 56 p toi)
        if (returnString.substring(returnString.length() - 2, returnString.length()).equals("CH")) {
            return returnString.replace("CH", "PM");
        }
        if (returnString.substring(returnString.length() - 2, returnString.length()).equals("SA")) {
            return returnString.replace("SA", "AM");
        }
        return returnString;
    }

    public static LocalDateTime getEndTimeOfLesson(Lesson thisLesson) {
        //ham nay co lien quan den ham getStatus
        Date dateee = thisLesson.getDate();
        //chuyen lesson sang LocalDateTime dua vao date va slot
        String hourAndMinute = getTimeSlot(Integer.toString(thisLesson.getSlot())).substring(41, 46);
        //hourAndMinute co the la: 9:00)
        if (hourAndMinute.contains(")")) {
            //continue
        }
        int hour = Integer.parseInt(hourAndMinute.split("[:()-]")[0]);
        int minute = Integer.parseInt(hourAndMinute.split("[:()-]")[1]);
        LocalDateTime thisLessonEnd = LocalDateTime.of(dateee.toLocalDate(), LocalTime.of(hour, minute));
        return thisLessonEnd;
    }

    public static LocalDateTime getStartTimeOfLesson(Lesson thisLesson) {
        Date dateee = thisLesson.getDate();
        //chuyen lesson sang LocalDateTime dua vao date va slot
        String hourAndMinute = getTimeSlot(Integer.toString(thisLesson.getSlot())).substring(35, 40);
        //hourAndMinute co the la:  (9:10
        int hour = 0, minute = 0;
        if (hourAndMinute.contains("(")) {
            hour = Integer.parseInt(hourAndMinute.split("[:()-]")[1]);
            minute = Integer.parseInt(hourAndMinute.split("[:()-]")[2]);
        } else {
            hour = Integer.parseInt(hourAndMinute.split("[:()-]")[0]);
            minute = Integer.parseInt(hourAndMinute.split("[:()-]")[1]);
        }
        LocalDateTime thisLessonStart = LocalDateTime.of(dateee.toLocalDate(), LocalTime.of(hour, minute));
        
        return thisLessonStart;
    }
    
    public static boolean isAllowToTakeAttendance(Lesson thisLesson){
        LocalDateTime thisLessonStart = getStartTimeOfLesson(thisLesson);
        LocalDateTime noww = LocalDateTime.now();
        //allow takeAttendance (take or edit) in 24 h after this Lesson begin
        if(noww.minusHours(24).isBefore(thisLessonStart) && noww.isAfter(thisLessonStart)){
            return true;
        }
        return false;
    }
    
    public static boolean isAllowToTakeAttendance(Date thisLessonDate, int thisLessonSlot){
        Lesson thisLesson = new Lesson();
        thisLesson.setDate(thisLessonDate);
        thisLesson.setSlot(thisLessonSlot);
        LocalDateTime thisLessonStart = getStartTimeOfLesson(thisLesson);
        LocalDateTime noww = LocalDateTime.now();
        //allow takeAttendance (take or edit) in 24 h after this Lesson begin
        if(noww.minusHours(24).isBefore(thisLessonStart) && noww.isAfter(thisLessonStart)){
            return true;
        }
        return false;
    }
    
}
