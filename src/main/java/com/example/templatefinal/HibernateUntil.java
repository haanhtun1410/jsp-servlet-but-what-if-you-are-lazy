package com.example.templatefinal;

import com.example.templatefinal.DomainModels.*;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;
import org.reflections.Reflections;
import org.reflections.scanners.SubTypesScanner;

import java.util.List;
import java.util.Properties;
import java.util.Set;

public class HibernateUntil {
    private static final SessionFactory FACTORY;

    static {
        Configuration conf = new Configuration();

        Properties properties = new Properties();
        properties.put(Environment.DIALECT, "org.hibernate.dialect.SQLServerDialect");
        properties.put(Environment.DRIVER, "com.microsoft.sqlserver.jdbc.SQLServerDriver");
        properties.put(Environment.URL, "jdbc:sqlserver://localhost:1433;databaseName=FINALASS_FPOLYSHOP_FA22_SOF205__SOF2041");
        properties.put(Environment.USER, "sa");
        properties.put(Environment.PASS, "123456");
        properties.put(Environment.SHOW_SQL, "true");
        properties.put(Environment.POOL_SIZE,100);
        properties.put(Environment.C3P0_MIN_SIZE,5);
        properties.put(Environment.C3P0_MAX_SIZE,10);
        properties.put(Environment.C3P0_TIMEOUT,30000);
        properties.put(Environment.C3P0_IDLE_TEST_PERIOD,1800);


        conf.setProperties(properties);

        Reflections reflections = new Reflections("com.example.templatefinal.DomainModels", new SubTypesScanner(false));
        Set<Class<?>> allClasses = reflections.getSubTypesOf(Object.class);
        for (Class clazz : allClasses) {
            conf.addAnnotatedClass(clazz);
        }

        ServiceRegistry registry = new StandardServiceRegistryBuilder()
                .applySettings(conf.getProperties()).build();
        FACTORY = conf.buildSessionFactory(registry);
    }

    public static SessionFactory getSessionFactory() {
        FACTORY.openSession();
        return FACTORY;
    }

    public static void main(String[] args) {

        System.out.println("Connected");
        List<KhachHang> listNV = null;
        SessionFactory sf = HibernateUntil.getSessionFactory();
        Session ss = sf.openSession();
        try {
            Criteria cr = ss.createCriteria(KhachHang.class);
            listNV = cr.list();
        } catch (HibernateException e) {
            System.out.println(e);
        }
        listNV.forEach(e -> System.out.println(e.toString()));
    }
}
