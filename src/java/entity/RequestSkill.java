/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author GHC
 */
public class RequestSkill {
    int request_id;
    int skill_id;

    public RequestSkill() {
    }

    public RequestSkill(int request_id, int skill_id) {
        this.request_id = request_id;
        this.skill_id = skill_id;
    }

    public int getRequest_id() {
        return request_id;
    }

    public void setRequest_id(int request_id) {
        this.request_id = request_id;
    }

    public int getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(int skill_id) {
        this.skill_id = skill_id;
    }
    
    
}
