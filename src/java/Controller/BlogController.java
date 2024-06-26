package Controller;

import DAO.BlogDao;
import Model.Blog;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "BlogController", urlPatterns = {"/blogController"})
public class BlogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDao blogDao = new BlogDao();
        ArrayList<Blog> bl = blogDao.recentBlog();
        
        String blogIdParam = request.getParameter("blogId");
        if (blogIdParam != null) {
            try {
                int blogId = Integer.parseInt(blogIdParam);
                Blog blog = blogDao.getBlogByBlogId(blogId);
                if (blog != null) {
                    System.out.println(blog.getUser().getName());
                    request.setAttribute("blog", blog);
                } else {
                    // Handle case where blog is not found
                    System.out.println("Blog not found for id: " + blogId);
                }
            } catch (NumberFormatException e) {
                // Handle case where blogId is not a valid integer
                System.out.println("Invalid blogId: " + blogIdParam);
            }
        } else {
            // Handle case where blogId parameter is missing
            System.out.println("blogId parameter is missing");
        }
        
        request.setAttribute("bl", bl);
        request.getRequestDispatcher("BlogDetails.jsp").forward(request, response);
    }
}
