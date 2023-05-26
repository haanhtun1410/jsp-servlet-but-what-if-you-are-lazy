package com.example.templatefinal.Utilities;

import com.example.templatefinal.DomainModels.ChucVu;
import com.example.templatefinal.DomainModels.CuaHang;
import com.example.templatefinal.DomainModels.KhachHang;
import com.example.templatefinal.DomainModels.NhanVien;
import com.example.templatefinal.Responsitories.Crud;
import com.example.templatefinal.Responsitories.impl.CrudImpl;
import org.dom4j.util.StringUtils;
import org.reflections.Reflections;
import org.reflections.scanners.SubTypesScanner;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class FieldReflection {

    private Class<?> className;
    public FieldReflection(Class<?> className) {
        this.className = className;
    }
    public FieldReflection() {
    }

    ///lay tat ca ca truong co trong className;
    public List<Field> getAllFields() {
        List<Field> fields = new ArrayList<>();
        Class<?> clazz = className;
        while (clazz != null) {
            for (Field field : clazz.getDeclaredFields()) {
                field.setAccessible(true);
                fields.add(field);
            }
            clazz = clazz.getSuperclass();
        }
        return fields;
    }

    //////Tao va lay du lieu 1 list cua class duoc dua vao /// optional : co the cai tien hon;
    public static <T> List<T> createListOf(Class<T> clazz) {
        Crud sv = new CrudImpl(clazz);
        List<T> listOfClazz = sv.readAll();
        System.out.println("list of class sau khi get from read aLL: "+listOfClazz.toString());
        return listOfClazz;
    }


    ////lay 1 list chua cac list cua cac class co ben trong className;
    ////note : dung de lay thong tin cho <select>
    ///tra ve list<list>
    public List<List<?>> getAllRelationClasses(){
        Set<Class<?>> classes = new HashSet<>();
        List<List<?>> listOfLists = new ArrayList<List<?>>();
        List<Field> fields = getAllFields();
        for (Field field : fields) {
            Class<?> fieldType = field.getType();
            if (!fieldType.isPrimitive() && !fieldType.getPackage().getName().startsWith("java")) {
                classes.add(fieldType);
                System.out.println(fieldType.toString() + " +  " + classes.size());
            }
        }
        for (Class<?> clazz : classes) {
            List<?> listOfClazz = createListOf(clazz);
            listOfLists.add(listOfClazz);
        }
        for (List<?> list : listOfLists) {
            System.out.println(list.get(0).getClass().getSimpleName()+ " : " + list.toString());
            System.out.println();
            System.out.println(list.get(0).getClass().getSimpleName() +"length :" +list.size());
        }
        return listOfLists;
    }


}
