
package YerVin;

import java.io.Serializable;
import java.sql.Timestamp;

public class Post implements Serializable{
    private int id;
    private String text;
    private Timestamp timestamp;
    private int user_id;
    private int likes;
    private String filename;
    private String username;

    public Post(int id, String text, Timestamp timestamp, int user_id, int likes, String filename) {
        this.id = id;
        this.text = text;
        this.timestamp = timestamp;
        this.user_id = user_id;
        this.likes = likes;
        this.filename = filename;
    }
    
    public Post(String text, int user_id, String filename) {
        this.text = text;
        this.user_id = user_id;
        this.filename = filename;
    }

    public int getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public int getUser_id() {
        return user_id;
    }
    
    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
