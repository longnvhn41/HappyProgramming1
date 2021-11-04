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
public class Request_mentor {
    int id;
    int userid;
    int skillid;
    String introduce;
    int status;
    public Request_mentor() {
    }

    public Request_mentor(int id, int userid, int skillid, String introduce, int status) {
        this.id = id;
        this.userid = userid;
        this.skillid = skillid;
        this.introduce = introduce;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getSkillid() {
        return skillid;
    }

    public void setSkillid(int skillid) {
        this.skillid = skillid;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Request_mentor{" + "id=" + id + ", userid=" + userid + ", skillid=" + skillid + ", introduce=" + introduce + ", status=" + status + '}';
    }

   
    
}
