/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import Model.Order;
import Model.OrderStatus;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class SellerDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String xPage = request.getParameter("page");
        String xSelect = request.getParameter("select");
        OrderDAO dao = new OrderDAO();
        ArrayList<Order> allOrderlist = dao.getOrder2Process();
        ArrayList<Order> list = new ArrayList<>();
        ArrayList<OrderStatus> otlist = dao.getOrderSt();
        if (xSelect == null || xSelect.isBlank()) {
            list = allOrderlist;
        } else if (Integer.parseInt(xSelect) == 0) {
            list = allOrderlist;
        } else {
            int selectStatus = Integer.parseInt(xSelect);
            for (Order order : allOrderlist) {
                if (order.getStatus().getId() == selectStatus) {
                    list.add(order);
                }
            }
        }
        int page, numberPerPage = 6;
        int size = list.size();
        int numpage = (size % numberPerPage) == 0 ? (size / numberPerPage) : ((size / numberPerPage) + 1);
        if (xPage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xPage);
        }
        int start, end;
        start = (page - 1) * numberPerPage;
        end = Math.min(page * numberPerPage, size);
        ArrayList<Order> listbyPage = getListByPage(list, start, end);
        request.setAttribute("olist", listbyPage);
        request.setAttribute("page", page);
        if (xSelect == null || xSelect.isBlank()) {
        } else {
            request.setAttribute("selectStatus", Integer.parseInt(xSelect));
        }
        request.setAttribute("numpage", numpage);
        request.setAttribute("otlist", otlist);
        request.getRequestDispatcher("SellerDashboard.jsp").forward(request, response);
    }

    public ArrayList<Order> getListByPage(ArrayList<Order> list, int start, int end) {
        ArrayList<Order> newlist = new ArrayList<>();
        for (int i = start; i < end; i++) {
            newlist.add(list.get(i));
        }
        return newlist;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request, response);
//        String search = request.getParameter("search");
//        String xSelect = request.getParameter("selectStatus");
//        if (search == null || search.isBlank()) {
//            this.doGet(request, response);
//        } else {
//            String xPage = request.getParameter("page");
//            OrderDAO dao = new OrderDAO();
//            ArrayList<Order> allOrderlist = dao.getOrder2Process();
//            ArrayList<Order> list = new ArrayList<>();
//            ArrayList<OrderStatus> otlist = dao.getOrderSt();
//            for (Order order : allOrderlist) {
//                if(order.getPhone().contains(search.trim())){
//                    list.add(order);
//                }
//            }
//            if (xSelect == null || xSelect.isBlank()) {
//            } else if (Integer.parseInt(xSelect) == 0) {
//            } else {
//                int selectStatus = Integer.parseInt(xSelect);
//                for (Order order : allOrderlist) {
//                    if (order.getStatus().getId() == selectStatus) {
//                        list.remove(order);
//                    }
//                }
//            }
//            int page, numberPerPage = 6;
//            int size = list.size();
//            int numpage = (size % numberPerPage) == 0 ? (size / numberPerPage) : ((size / numberPerPage) + 1);
//            if (xPage == null) {
//                page = 1;
//            } else {
//                page = Integer.parseInt(xPage);
//            }
//            int start, end;
//            start = (page - 1) * numberPerPage;
//            end = Math.min(page * numberPerPage, size);
//            ArrayList<Order> listbyPage = getListByPage(list, start, end);
//            request.setAttribute("olist", listbyPage);
//            request.setAttribute("page", page);
//            if (xSelect == null || xSelect.isBlank()) {
//            } else {
//                request.setAttribute("selectStatus", Integer.parseInt(xSelect));
//            }
//            request.setAttribute("numpage", numpage);
//            request.setAttribute("otlist", otlist);
//            request.getRequestDispatcher("SellerDashboard.jsp").forward(request, response);
//        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
