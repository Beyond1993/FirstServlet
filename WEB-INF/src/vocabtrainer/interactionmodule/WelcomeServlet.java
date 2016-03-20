package vocabtrainer.interactionmodule;

import vocabtrainer.rlmodule.RunVocabTrainerNoSockets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeServlet extends HttpServlet {

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
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		RunVocabTrainerNoSockets run = new RunVocabTrainerNoSockets();

        // 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		String title = "use GET method to get the value";
		String docType =
		"<!doctype html public \"-//w3c//dtd html 4.0 " +
		"transitional//en\">\n";
		out.println(docType +
		    "<html>\n" +
		    "<head><title>" + title + "</title></head>\n" +
		    "<body bgcolor=\"#f0f0f0\">\n" +
		    "<h1 align=\"center\">" + title + "</h1>\n" +
		    "<ul>\n" +
		    "  <li><b>the value is</b>："
		    + request.getParameter("value") + "\n" +
		    "</ul>\n" +
		    "</body></html>");

		out.println(run.test());
		
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

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("    This is ");
        out.print(this.getClass());
        out.println(", using the POST method");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }

}
