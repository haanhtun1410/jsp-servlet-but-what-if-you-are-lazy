package com.example.templatefinal.view;

import com.example.templatefinal.DomainModels.*;
import com.example.templatefinal.Responsitories.Crud;
import com.example.templatefinal.Responsitories.impl.CrudImpl;
import com.example.templatefinal.Utilities.FieldReflection;
import lombok.SneakyThrows;
import org.hibernate.id.UUIDHexGenerator;
import org.reflections.Reflections;
import org.reflections.scanners.SubTypesScanner;
import org.reflections.util.ClasspathHelper;
import org.reflections.util.ConfigurationBuilder;
import org.reflections.util.FilterBuilder;

import java.lang.reflect.Field;
import java.util.*;

public class main {
    @SneakyThrows
    public static void main(String[] args) {
        List<Field> fields = new FieldReflection(Class.forName("com.example.templatefinal.DomainModels."+"NhanVien")).getAllFields();
       UUID id = UUID.fromString("40166f1b-57e1-3740-8f83-0428727558b2");
       String cl = "NhanVien";

        System.out.println(new CrudImpl<>(ChucVu.class).readAll());

        System.out.println(new CrudImpl(Class.forName("com.example.templatefinal.DomainModels."+"NhanVien")).findByID(id));



    }
}

