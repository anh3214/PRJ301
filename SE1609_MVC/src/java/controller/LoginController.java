/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.employee;
import entity.stores;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOemployee;
import model.DAOstores;

/**
 *
 * @author ptuan
 */
@WebServlet(name = "LoginController", urlPatterns = {"/Login"})
public class LoginController extends HttpServlet {

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
        HttpSession session = request.getSession();
        DAOstores daoS = new DAOstores();
        DAOemployee daoE = new DAOemployee();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("go");
            if (service == null) {
                service = "login";
            }
            if (service.equals("login")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    dispath(request, response, "/JSP/Login/Login.jsp");
                } else {
                    String user = request.getParameter("userName");
                    String pass = request.getParameter("password");
                    stores nS = daoS.Login(user, pass);
                    employee nE = daoE.Login(user, pass);
                    if (nS != null) {
                        session.setAttribute("accSto", nS);
                        response.sendRedirect("Home");
                    } else {
                        if (nE != null) {
                            session.setAttribute("acc", nE);
                            dispath(request, response, "/JSP/Client/ClientAdmin/index.jsp");
                        }else{
                            request.setAttribute("error", "Login Faile");
                            dispath(request, response, "/JSP/Login/Login.jsp");
                        }
                    }
                }
            }
            if (service.equals("logout")) {
                session.invalidate();
                response.sendRedirect("Home");
            }
        }
    }

    public void dispath(HttpServletRequest request,
            HttpServletResponse response, String page)
            throws IOException, ServletException {
        RequestDispatcher dispath = request.getRequestDispatcher(page);
        dispath.forward(request, response);
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
    }// </editor-fold>

}
