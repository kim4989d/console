package green;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import java.io.IOException;

public class GreetingServletController extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        processRequest(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        processRequest(request, response);
    }
    
    void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        // ���⼭ Ŭ���̾�Ʈ�� ��û�� �˸°� ó���Ѵ�.
        String greeting = "�׽�Ʈ�Դ�";
        
        request.setAttribute("greeting", greeting);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewGreeting.jsp");
        dispatcher.forward(request, response);
    }
}