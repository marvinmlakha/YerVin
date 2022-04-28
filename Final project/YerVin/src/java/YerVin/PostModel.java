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
            
            String preparedSQL = "select * from post where user_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(preparedSQL);
            
            preparedStatement.setInt(1, user.getId());         
            ResultSet results = preparedStatement.executeQuery();
            
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
            
            String preparedSQL = "UPDATE post SET likes = ? WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(preparedSQL);
            
            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, postId);            
            preparedStatement.executeQuery();
             
            preparedStatement.close();
            connection.close();
        }
        catch ( Exception ex ){
            System.out.println(ex);
        }
    }
}
