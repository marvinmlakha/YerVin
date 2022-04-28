/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package YerVin;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig(maxFileSize = 1000000)
/**
 *
 * @author mlakh
 */
public class UploadPost extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        // https://www.codejava.net/coding/upload-files-to-database-servlet-jsp-mysql
        InputStream inputStream = null; // input stream of the upload file
        String fileName = "";
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("postFile");
        if (filePart != null) {
            fileName = extractFileName(filePart);
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        String username = (String)session.getAttribute("username");
        User user = UserModel.getUser(username);

        int id = user.getId();

        String text = request.getParameter("text");

        Post post = new Post(text,id,fileName);
        
        try{
                Connection connection = DatabaseConnection.getConnection();
                PreparedStatement preparedStatement;
                
                if(inputStream != null){
                    String preparedSQL = "insert into post (text, user_id, image, filename)"
                        + " values (?, ?, ?, ?)";
                    preparedStatement = connection.prepareStatement(preparedSQL);

                    // index starts at 1?
                    preparedStatement.setString(1, post.getText());
                    preparedStatement.setInt(2, post.getUser_id());
                    preparedStatement.setBlob(3, inputStream);
                    preparedStatement.setString(4, post.getFilename());
                }
                else{
                    String preparedSQL = "insert into post (text, user_id)"
                        + " values (?, ?)";
                    preparedStatement = connection.prepareStatement(preparedSQL);

                    // index starts at 1?
                    preparedStatement.setString(1, post.getText());
                    preparedStatement.setInt(2, post.getUser_id());
                }

                preparedStatement.execute();

                preparedStatement.close();
                connection.close();
                inputStream.close();
            
        }
        catch ( Exception ex ){
            System.out.println(ex);
        }

//        PostModel.addPost(post, inputStream);
        
        inputStream.close();

        String url = "/Profile";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    
    //https://www.codejava.net/java-ee/servlet/java-file-upload-example-with-servlet-30-api
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
