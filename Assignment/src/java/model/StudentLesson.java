/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Tong Nhat
 */
public class StudentLesson {

    Student student;
    Lesson lesson;
    boolean status;
    String recordTime;
    String note;

    public StudentLesson(Student student, Lesson lesson, boolean status, String recordTime, String note) {
        this.student = student;
        this.lesson = lesson;
        this.status = status;
        this.recordTime = recordTime;
        this.note = note;
    }

    @Override
    public String toString() {
        return "student=" + student.getName() + ", lesson=" + lesson.getId() + ", status=" + status + ", recordTime=" + recordTime + ", note=" + note + '}';
    }
    

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Lesson getLesson() {
        return lesson;
    }

    public void setLesson(Lesson lesson) {
        this.lesson = lesson;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(String recordTime) {
        this.recordTime = recordTime;
    }

}
