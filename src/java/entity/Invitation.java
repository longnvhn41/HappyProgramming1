/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Nguyen Van Long
 */
public class Invitation {

    private int id;
    private int request_id;
    private int mentor_id;
    private String status;

    public Invitation(int id, int request_id, int mentor_id, String status) {
        this.id = id;
        this.request_id = request_id;
        this.mentor_id = mentor_id;
        this.status = status;
    }

    public Invitation(int request_id, int mentor_id, String status) {
        this.request_id = request_id;
        this.mentor_id = mentor_id;
        this.status = status;
    }

    public Invitation() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRequest_id() {
        return request_id;
    }

    public void setRequest_id(int request_id) {
        this.request_id = request_id;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
