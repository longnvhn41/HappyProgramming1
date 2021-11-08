/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Tri
 */
public class Rating {

    int id;
    int menteeId;
    int mentorId;
    int stars;
    String comment;

    //extra
    String menteeName;

    public Rating() {
    }

    public Rating(int id, int menteeId, int mentorId, int stars, String comment) {
        this.id = id;
        this.menteeId = menteeId;
        this.mentorId = mentorId;
        this.stars = stars;
        this.comment = comment;
    }

    public Rating(String comment) {
        this.comment = comment;
    }

    public String getMenteeName() {
        return menteeName;
    }

    public void setMenteeName(String menteeName) {
        this.menteeName = menteeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMenteeId() {
        return menteeId;
    }

    public void setMenteeId(int menteeId) {
        this.menteeId = menteeId;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}
