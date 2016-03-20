package vocabtrainer.interactionmodule;

import java.util.concurrent.atomic.AtomicInteger;  
import javax.servlet.http.HttpServletRequest;  
import org.apache.catalina.websocket.StreamInbound;  
import org.apache.catalina.websocket.WebSocketServlet;  
  
public class HelloWebSocketServlet extends WebSocketServlet {  
    private static final long serialVersionUID = 1L;  
  
    private final AtomicInteger connectionIds = new AtomicInteger(0);  
    @Override  
    protected StreamInbound createWebSocketInbound(String arg0,  
            HttpServletRequest request) {  
        return new HelloMessageInbound(connectionIds.getAndIncrement(), request  
                .getSession().getId());  
    }  
}  

