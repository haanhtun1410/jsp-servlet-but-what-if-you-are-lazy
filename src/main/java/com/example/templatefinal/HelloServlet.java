package com.example.templatefinal;

import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.example.templatefinal.DomainModels.*;
import com.example.templatefinal.Responsitories.Crud;
import com.example.templatefinal.Responsitories.impl.CrudImpl;
import com.example.templatefinal.Utilities.FieldReflection;
import com.oracle.wls.shaded.org.apache.xpath.objects.XObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lombok.SneakyThrows;
import org.hibernate.id.UUIDGenerator;
import org.reflections.Reflections;
import org.reflections.scanners.SubTypesScanner;

@WebServlet(name = "b1", value = {"/crud-view","/b1/add","/b1/delete","/b1/detail","/b1/update","/b1/search","/b1/view","/main-page"})
public class HelloServlet extends HttpServlet {

    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        response.setContentType("text/html");
        ArrayList<String> classList = getClassList();
        request.setAttribute("classList", classList);
        HttpSession session = request.getSession();
        session.getAttribute("cart");
        request.setAttribute("cart",session.getAttribute("cart"));
        if(uri.contains("main-page")){
            request.getRequestDispatcher("/view/main.jsp").forward(request,response);
        }else if(uri.contains("crud-view")){
           String className = request.getParameter("class");
            request.setAttribute("className",className);
            List<Field> fields = new FieldReflection(Class.forName("com.example.templatefinal.DomainModels."+className)).getAllFields();
            request.setAttribute("fields",fields);
            Crud sv = new CrudImpl(Class.forName("com.example.templatefinal.DomainModels."+className));
            List<?> listClass= sv.readAll();
            request.setAttribute("list",listClass);
            request.getRequestDispatcher("/view/home.jsp").forward(request,response);
        }else if(uri.contains("delete")){
            String className = request.getParameter("class");
            Crud sv = new CrudImpl(Class.forName("com.example.templatefinal.DomainModels."+className));
            request.setAttribute("className",className);
            UUID id = UUID.fromString(request.getParameter("id"));
            Object byID = sv.findByID(id);
            if(sv.delete(byID)){
                request.setAttribute("result","Thành Công");
            }else {
                request.setAttribute("result","Thất Bại");
            }
            response.sendRedirect("/crud-view?class="+className);

        }else if(uri.contains("detail")){
            String className = request.getParameter("class");
            Crud sv = new CrudImpl(Class.forName("com.example.templatefinal.DomainModels."+className));
            request.setAttribute("className",className); //set lai attribute;
            List<Field> fields = new FieldReflection(Class.forName("com.example.templatefinal.DomainModels."+className)).getAllFields();
            request.setAttribute("fields",fields);
            UUID id = UUID.fromString(request.getParameter("id"));
            request.setAttribute("detail",sv.findByID(id));
            request.setAttribute("id",id);
            request.getRequestDispatcher("/view/detail.jsp").forward(request,response);
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


    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
      if(uri.contains("/b1/add")){
          String className = request.getParameter("class");
          Crud sv = new CrudImpl(Class.forName("com.example.templatefinal.DomainModels."+className));
          sv.creat(getDataFromForm(className,request));
          response.sendRedirect("/crud-view?class="+className);
      }else if(uri.contains("update")){
          UUID id = UUID.fromString(request.getParameter("id"));
          String className = request.getParameter("class");
          request.setAttribute("className",className);
          System.out.println("click");
          try {
              Crud sv = new CrudImpl(Class.forName("com.example.templatefinal.DomainModels."+className));
              Object obj = getDataFromForm(className,request);
              Method setIdMethod = obj.getClass().getMethod("setId", UUID.class);
              setIdMethod.invoke(obj, id);
              System.out.println(obj);
              sv.update(obj);
              response.sendRedirect("/crud-view?class="+className);
          }catch (Exception e){
              throw e;

          }
      }
    }

    @SneakyThrows
    public List<Class<?>> getListOfClass(Field clz, String className) {
        List<List<?>> allRelationClasses = new FieldReflection(Class.forName("com.example.templatefinal.DomainModels."+className)).getAllRelationClasses();
        for ( List<?> list : allRelationClasses){
            if(list.get(0).getClass().equals(clz.getType())){
                System.out.println(list);
                return (List<Class<?>>) list;
            }
        }
        return null;
    }

    public void destroy() {
    }

    public Object getDataFromForm(String className,HttpServletRequest request) throws ClassNotFoundException, InvocationTargetException, NoSuchMethodException, ParseException, IllegalAccessException, InstantiationException {
        List<Field> fields = new FieldReflection(Class.forName("com.example.templatefinal.DomainModels."+className)).getAllFields();
        Class<?> clazz = Class.forName("com.example.templatefinal.DomainModels."+className);
        Object obj = clazz.newInstance();
        Map<String, String[]> parameterMap = request.getParameterMap();
        int x =0;
        for (Field field : fields) {
            try {
                String fieldName = field.getName();
                Class<?> fieldType = field.getType();
                System.out.println("type: "+x+fieldType);
                System.out.println("Name(parameter name): "+x+fieldName);
                String fieldClassName = fieldType.getSimpleName();
                String[] parameterValues = parameterMap.get(fieldName);  //lay string trong input....
                if(fieldType.getName().contains("UUID") || fieldName.equalsIgnoreCase("id")){
                    field.set(obj,UUID.randomUUID());
                    continue;
                }
                if (parameterValues != null && parameterValues.length > 0) {
                    /// for data that get from a class
                    if((!fieldType.isPrimitive() && !fieldType.getName().contains("java") || fieldType.getName().contains("UUID"))){
                        String fieldValue = parameterValues[0];
                        System.out.println("fieldValue:"+"value after get from name: "+x+fieldValue);
                        UUID id = UUID.fromString(fieldValue);
                        Object Object = new CrudImpl(Class.forName("com.example.templatefinal.DomainModels."+fieldClassName)).findByID(id);
                        System.out.println(Object);
                        field.set(obj,Object);
                    }
                    /// data that from input
                    else{
                        System.out.println("NOT THE CLASS INNER");
                        Object convertedValue = null;
                        String fieldValue = parameterValues[0];
                        System.out.println("fieldValue:" +fieldValue);

                        // use Class.forName() to get the Class object dynamically

                        if (field.getType().isPrimitive()) {
                            System.out.println("IS PRIM");
                            if (fieldType.equals(int.class)) {
                                convertedValue = Integer.parseInt(fieldValue);
                            } else if (fieldType.getSimpleName().equalsIgnoreCase("double")) {
                                convertedValue = Double.parseDouble(fieldValue);
                            } else if (fieldType.getSimpleName().equalsIgnoreCase("boolean")) {
                                convertedValue = Boolean.parseBoolean(fieldValue);
                            }
                        }else {
                            Class<?> dynamicType = Class.forName(fieldType.getName());
                            System.out.println(dynamicType.getTypeName());
                            if(dynamicType.getTypeName().equalsIgnoreCase("java.util.Date")){
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                convertedValue = dateFormat.parse(fieldValue);
                            }else if(fieldType.equals(String.class)){
                                convertedValue = fieldValue;
                            }else if(fieldType.equals(BigDecimal.class)){
                                convertedValue = new BigDecimal(fieldValue);
                            }
                            else if(fieldType.equals(Set.class)){
                               continue;
                            }else{
                                // use the dynamically obtained Class object to call the appropriate valueOf() method
                                convertedValue = dynamicType.getMethod("valueOf", String.class).invoke(null, fieldValue);
                            }
                        }
                        field.set(obj, convertedValue);
                        System.out.println(obj);
                    }
                }

            }catch (Exception e){
                System.out.println(e);
                throw e;
            }
            x++;
        }
        System.out.println(obj);
        return obj;
    }
}