package sit.int202.quizjpaproject.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.beanutils.BeanUtils;
import sit.int202.quizjpaproject.entities.Question;
import sit.int202.quizjpaproject.entities.User;
import sit.int202.quizjpaproject.repositories.UserRepository;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.security.MessageDigest;
import java.util.Enumeration;
import java.util.List;

@WebServlet(name = "ManageUsersServlet", value = "/manage-users")
public class ManageUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("id");
        String action = request.getParameter("action");

        UserRepository userRepo = new UserRepository();
        User user;
        if (strId != null && strId.trim().length() > 0) {
            if (strId.equals("new")) {
                request.setAttribute("id", strId);
                getServletContext().getRequestDispatcher("/user.jsp").forward(request, response);
            } else if (action.trim().equals("update-user")){
                user = userRepo.find(strId);
                request.setAttribute("user" , user);
                getServletContext().getRequestDispatcher("/user.jsp").forward(request, response);
            } else {
                try {
                    if (action.trim().equals("remove-user")){
                        userRepo.delete(strId);
                        response.sendRedirect("manage-users");
                    }
                } catch (NumberFormatException nfe) {
                    System.out.println("Error : uwu!");
                }
            }
        } else {
            List<User> users = userRepo.findAll();
            if (users != null) {
                request.setAttribute("users", users);
                getServletContext().getRequestDispatcher("/list_users.jsp").forward(request, response);
                return;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strId = request.getParameter("id");
        String action = request.getParameter("action");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        if (strId != null) {
            UserRepository userRepo = new UserRepository();
            User users;
            if (action != null && action.trim().equals("add-user") && strId.trim().length() > 0) {
                users = new User(userName, sha256(password), firstName, lastName, email);
                userRepo.save(users);
            } else if (action != null && action.trim().equals("update-user") && strId.trim().length() > 0){
                users = userRepo.find(strId);
                if(users != null){
                    users.setPassword(sha256(password));
                    users.setFirstName(firstName);
                    users.setLastName(lastName);
                    users.setEmail(email);
                    userRepo.update(users);
                    System.out.println("=============================::" + users);
                }
            }
        }
        response.sendRedirect("manage-users");
    }

    private String sha256(final String base) {
        try {
            final MessageDigest digest = MessageDigest.getInstance("SHA-256");
            final byte[] hash = digest.digest(base.getBytes("UTF-8"));
            final StringBuilder hexString = new StringBuilder();
            for (int i = 0; i < hash.length; i++) {
                final String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1)
                    hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
}
