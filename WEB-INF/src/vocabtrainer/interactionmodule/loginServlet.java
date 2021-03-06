package vocabtrainer.interactionmodule;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import vocabtrainer.interactionmodule.user;

public class loginServlet extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public loginServlet() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    /**
     * The doGet method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to get.
     * 
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */


    /** 
     * 验证防止刷新重复提交 
     * @return 
     */  
    private boolean validateToken(HttpServletRequest request)  
    {         
        try  
        {  
            String sessionToken = (String) request.getSession().getAttribute(  
                    "clientToken");  
            String clientToken = (String) request.getParameter("clientToken");
            System.out.println("old session token: " + sessionToken);                      
            System.out.println("old client token: " + clientToken);     
            
            if (null == sessionToken || sessionToken.isEmpty() 
            		|| clientToken.equals(sessionToken))  {
            	
            	String sToken = UUID.randomUUID().toString().toUpperCase();  
                request.getSession().setAttribute("clientToken", sToken);     
                System.out.println("new token: " + (String) request.getSession().getAttribute(  
                        "clientToken"));
            	return true;         
            }
            else  
            	return false;
        }  
        catch (Exception e)  
        {  
            //LOGGER.error(e.getMessage());  
        	return false;
        }         
        
    } 

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         //Add some codes
        doPost(request,response);
    }

    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to post.
     * 
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         if(!validateToken(request)) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
         }      
                

         String username = request.getParameter("username");
         request.getParameter("password");
         
         if (username == null || username.equals("")) request.getRequestDispatcher("error.jsp").forward(request, response);
         
         user user1=new user();
         user1.setUserName(request.getParameter("username"));
         user1.setPassWord(request.getParameter("password"));
         System.out.println(request.getParameter("username")+request.getParameter("password"));
         
         if(user1.validate())
         {
             request.getSession().setAttribute("username", request.getParameter("username"));      //将user放在Attribute中
             request.getRequestDispatcher("index.jsp").forward(request, response); //校验用户名密码正确，跳转到welcome.jsp
            
         }
         else
        
             request.getRequestDispatcher("error.jsp").forward(request, response);  //校验用户名密码不正确，跳转到index.jsp
            
     
         
    }
    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occurs
     */
    public void init() throws ServletException {
        // Put your code here
    }

}