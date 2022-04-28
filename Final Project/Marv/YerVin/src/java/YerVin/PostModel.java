/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package YerVin;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author mlakh
 */
@MultipartConfig(maxFileSize = 1000000)

public class PostModel {
    
    public static ArrayList<Post> getPostsOfThisUser(User user){
        ArrayList<Post> Posts = new ArrayList<Post>();
        try{
            Connection connection = DatabaseConnection.getConnection();
            
            Statement statement = connection.createStatement();
            
            ResultSet results = statement.executeQuery("select * from post where user_id = " + user.getId());
            
            while ( results.next() ){
                int id = results.getInt("id");
                String text = results.getString("text");
                int user_id = results.getInt("user_id");
                int likes = results.getInt("likes");
                String filename = results.getString("filename");
                Timestamp timestamp = results.getTimestamp("timestamp");
                
                Post post = new Post(id, text,timestamp, user_id, likes, filename);
                
                post.setUsername(user.getUsername());
                
                Posts.add(post);
            }
            
            results.close();
            statement.close();
            connection.close();
            
        }
        catch ( Exception ex ){
            System.out.println(ex);
        }
        
        return Posts;
    }
    
    public static void incramentLikes(int postId, int likes){
        try{
            Connection connection = DatabaseConnection.getConnection();
            likes++;
            
            Statement statement = connection.createStatement();
            
            statement.executeQuery("UPDATE post SET likes = "+ likes + " WHERE id = " + postId);
            
            statement.close();
            connection.close();
        }
        catch ( Exception ex ){
            System.out.println(ex);
        }
    }
}
