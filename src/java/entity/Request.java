/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author Nguyen Van Long
 */
public class Request {
    int id;
    int mentee_id;
    int mentor_id;
    String mess;
    String title;
    Date deadline;
    Date creationDate;
    Date finishDate;
    int status;
    float deadlineHour;

    public Request(int mentee_id, String mess, String title, Date deadline, Date creationDate, int status, float deadlineHour) {
        this.mentee_id = mentee_id;
        this.mess = mess;
        this.title = title;
        this.deadline = deadline;
        this.creationDate = creationDate;
        this.status = status;
        this.deadlineHour = deadlineHour;
    }

    public Request(int id, int mentee_id, int mentor_id, String mess, String title, Date deadline, Date creationDate, Date finishDate, int status, float deadlineHour) {
        this.id = id;
        this.mentee_id = mentee_id;
        this.mentor_id = mentor_id;
        this.mess = mess;
        this.title = title;
        this.deadline = deadline;
        this.creationDate = creationDate;
        this.finishDate = finishDate;
        this.status = status;
        this.deadlineHour = deadlineHour;
    }


    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMentee_id() {
        return mentee_id;
    }

    public void setMentee_id(int mentee_id) {
        this.mentee_id = mentee_id;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getDeadlineHour() {
        return deadlineHour;
    }

    public void setDeadlineHour(float deadlineHour) {
        this.deadlineHour = deadlineHour;
    }
    
    
}
