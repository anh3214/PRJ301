/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author ptuan
 */
public class pub_info {
    private String pub_id;
    private String logo;
    private String pr_info;

    public pub_info() {
    }

    @Override
    public String toString() {
        return "pub_info{" + "pub_id=" + pub_id + ", logo=" + logo + ", pr_info=" + pr_info + '}';
    }

    public pub_info(String pub_id, String logo, String pr_info) {
        this.pub_id = pub_id;
        this.logo = logo;
        this.pr_info = pr_info;
    }

    public pub_info(String pub_id, String pr_info) {
        this.pub_id = pub_id;
        this.pr_info = pr_info;
    }
    

    public String getPub_id() {
        return pub_id;
    }

    public void setPub_id(String pub_id) {
        this.pub_id = pub_id;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getPr_info() {
        return pr_info;
    }

    public void setPr_info(String pr_info) {
        this.pr_info = pr_info;
    }
    
}
