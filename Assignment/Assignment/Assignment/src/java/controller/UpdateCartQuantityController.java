package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;

@WebServlet(name = "UpdateCartQuantityController", urlPatterns = {"/update-quantity"})

public class UpdateCartQuantityController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

//            int productId = Integer.parseInt(request.getParameter("productId"));
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            
//            HttpSession session = request.getSession();
//            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
//            if (carts == null) {
//                carts = new LinkedHashMap<>();
//            }
//            
//            if(carts.containsKey(productId)){
//                carts.get(productId).setQuantity(quantity);
//            }
//            
//            session.setAttribute("carts", carts);
//            response.sendRedirect("carts");
//        }
            String product = request.getParameter("productId");
            String quantity = request.getParameter("quantity");
            HttpSession session = request.getSession();
            try {
                int productId = Integer.parseInt(product);
                int q = Integer.parseInt(quantity);

                Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
                if (carts == null) {
                    carts = new LinkedHashMap<>();
                }

                if (carts.containsKey(productId)) {
                    carts.get(productId).setQuantity(q);
                }
                session.setAttribute("carts", carts);
                response.sendRedirect("carts");

            } catch (IOException | NumberFormatException e) {

            }

        }
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
    }
}

// </editor-fold>

