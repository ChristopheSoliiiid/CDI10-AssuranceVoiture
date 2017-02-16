package Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CmdToSignup implements ICommand {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        return "WEB-INF/signup.jsp";
    }

}
