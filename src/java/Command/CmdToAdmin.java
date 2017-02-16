package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CmdToAdmin implements ICommand {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        
        return "WEB-INF/admin.jsp";
    }

}
