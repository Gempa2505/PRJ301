/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProjectDAO;
import dao.StartupProjectsDAO;
import dao.UserDAO;
import dto.StartupProjectsDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author FPTSHOP
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";

    public UserDTO getUser(String strUserID) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readById(strUserID);
        return user;
    }

    public boolean isValidLogin(String strUserID, String strPassword) {
        UserDTO user = getUser(strUserID);
        System.out.println(user);
        return user != null && user.getPassword().equals(strPassword);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    String strUserID = request.getParameter("txtUsername");
                    String strPassword = request.getParameter("txtPassword");
                    if (isValidLogin(strUserID, strPassword)) {
                        url = "search.jsp";
                        UserDTO user = getUser(strUserID);
                        request.getSession().setAttribute("user", user);

                        // Lấy danh sách tất cả dự án sau khi đăng nhập
                        StartupProjectsDAO pdao = new StartupProjectsDAO();
                        List<StartupProjectsDTO> projectList = pdao.getAllProjects();
                        request.setAttribute("project", projectList);
                    } else {
                        url = "invalid.jsp";
                    }
                } else if (action.equals("logout")) {
                    request.getSession().invalidate();
                    url = "login.jsp";
                } else if (action.equals("search")) {
                    url = "search.jsp";
                    StartupProjectsDAO pdao = new StartupProjectsDAO();
                    String searchTerm = request.getParameter("txtSearchProject");
                    if (searchTerm == null) {
                        searchTerm = "";
                    }
                    List<StartupProjectsDTO> project = pdao.searchByName(searchTerm);
                    request.setAttribute("project", project);
                    request.setAttribute("searchTerm", searchTerm);
                } else if (action.equals("createProject")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");

                    if (user == null || !"AD".equals(user.getRoleID())) {
                        request.setAttribute("errorMessage", "Only Admins can create projects!");
                        url = "create.jsp";
                    } else {
                        String name = request.getParameter("projectName");
                        String description = request.getParameter("description");
                        String status = request.getParameter("status");
                        String launchDateStr = request.getParameter("estimatedLaunch");

                        // Kiểm tra dữ liệu đầu vào (bắt lỗi)
                        if (name == null || name.trim().isEmpty()
                                || description == null || description.trim().isEmpty()
                                || status == null || status.trim().isEmpty()
                                || launchDateStr == null || launchDateStr.trim().isEmpty()) {

                            request.setAttribute("errorMessage", "All fields are required!");
                            url = "create.jsp";
                        } else if (name.length() > 100 || description.length() > 500) {
                            request.setAttribute("errorMessage", "Project name or description is too long!");
                            url = "create.jsp";
                        } else {
                            try {
                                Date launchDate = Date.valueOf(launchDateStr);
                                StartupProjectsDTO newProject = new StartupProjectsDTO(0, name, description, status, launchDate);

                                if (new StartupProjectsDAO().create(newProject)) {
                                    session.setAttribute("successMessage", "Project created successfully!");
                                    url = "search.jsp";
                                } else {
                                    request.setAttribute("errorMessage", "Failed to create project.");
                                    url = "create.jsp";
                                }
                            } catch (IllegalArgumentException e) {
                                request.setAttribute("errorMessage", "Invalid date format!");
                                url = "create.jsp";
                            } catch (Exception e) {
                                request.setAttribute("errorMessage", "An unexpected error occurred.");
                                url = "create.jsp";
                            }
                        }
                        Date launchDate = Date.valueOf(launchDateStr);
                        StartupProjectsDTO newProject = new StartupProjectsDTO(0, name, description, status, launchDate);

                        if (new StartupProjectsDAO().create(newProject)) {
                            request.getSession().setAttribute("successMessage", "Project created successfully!");
                            url = "search.jsp";
                        } else {
                            request.getSession().setAttribute("errorMessage", "Failed to create project.");
                            url = "create.jsp";
                        }
                    }
                }

            }
        } catch (Exception e) {
            log("Error in MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
