/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package YerVin;

import java.io.Serializable;


public class User implements Serializable {
    private int id;
    private String username;
    private String password;
    private String filename;

    public User(int id) {
        this.id = id;
        this.username = username;
    }
    
    public User(int id, String username, String password) {
        this(id, username, password, null);
    }
    
    public User(int id, String username, String password, String filename) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.filename = filename;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}