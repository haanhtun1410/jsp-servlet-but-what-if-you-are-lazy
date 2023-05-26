package com.example.templatefinal;

import com.example.templatefinal.DomainModels.Cart;
import com.example.templatefinal.DomainModels.CartItem;
import com.example.templatefinal.DomainModels.ChiTietSp;
import com.example.templatefinal.DomainModels.SanPham;
import com.example.templatefinal.Responsitories.Crud;
import com.example.templatefinal.Responsitories.impl.CrudImpl;
import com.example.templatefinal.Utilities.FieldReflection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.SneakyThrows;
import org.reflections.Reflections;
import org.reflections.scanners.SubTypesScanner;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@WebServlet(name = "cartServlet", value = {"/san-pham/view","/san-pham/add","/gio-hang","/san-pham/quantity-change"})
public class CartServlet extends HttpServlet{

    Crud sv = new CrudImpl(ChiTietSp.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        HttpSession session = request.getSession();
        session.getAttribute("cart");
        request.setAttribute("cart",session.getAttribute("cart"));
        response.setContentType("text/html");
        ArrayList<String> classList = getClassList();
            request.setAttribute("classList", classList);
        if (uri.contains("san-pham/view")) {
            List<Field> fields = new FieldReflection(ChiTietSp.class).getAllFields();
            request.setAttribute("fields",fields);
            request.setAttribute("list",sv.readAll());
            request.getRequestDispatcher("/view/product.jsp").forward(request, response);
        } else if (uri.contains("gio-hang")) {

            Cart cart = (Cart) session.getAttribute("cart");
            request.setAttribute("cart", cart);
            request.getRequestDispatcher("/view/cart.jsp").forward(request, response);
            System.out.println(cart);
        } else if (uri.contains("/san-pham/quantity-change")) {
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart.getItems().isEmpty()){
                return;
            }
            for (CartItem item : cart.getItems()) {
                 if(item.getProductId().equals(UUID.fromString(request.getParameter("idP")))){
                      item.setQuantity(Integer.valueOf(request.getParameter("quantity")));
                      if(item.getQuantity()<=0){
                          cart.getItems().remove(item);
                          break;
                      }
                 }
            }
            request.setAttribute("cart", cart);
            response.sendRedirect("/gio-hang");

        } else if (uri.contains("/san-pham/add")) {
            Crud sv = new CrudImpl(ChiTietSp.class);
            UUID id = UUID.fromString(request.getParameter("id"));
            ChiTietSp sanPham = (ChiTietSp) sv.findByID(id);
            System.out.println("");
            System.out.println(sanPham);
            System.out.println("");
            // Tạo đối tượng CartItem
            CartItem item = new CartItem();
            item.setProductId(id);
            item.setProductName(sanPham.getSanPham().getTen());
            item.setPrice(sanPham.getGiaBan());
            // Lấy giỏ hàng từ session
            Cart cart = (Cart) session.getAttribute("cart");
            System.out.println(cart);

            // Nếu giỏ hàng chưa được tạo, tạo mới nó
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            // Thêm sản phẩm vào giỏ hàng
            cart.addItem(item);
            System.out.println(cart.getItems().size());

            // Chuyển hướng người dùng đến trang giỏ hàng
            response.sendRedirect("/san-pham/view");
          }
        }

    private ArrayList<String> getClassList() {
        ArrayList<String> classList = new ArrayList<>();
        Reflections reflections = new Reflections("com.example.templatefinal.DomainModels", new SubTypesScanner(false));
        Set<Class<?>> allClasses = reflections.getSubTypesOf(Object.class);
        for (Class clazz : allClasses) {
            classList.add(clazz.getSimpleName());
        }
        return classList;
    }
    }




