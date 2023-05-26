package com.example.templatefinal.Responsitories;

import com.example.templatefinal.DomainModels.MauSac;

import java.util.List;
import java.util.UUID;


public interface Crud<T> {

    public boolean creat(T e);

    public boolean update(T e);

    public List<T> readAll();

    public T findByID(UUID id);

    public boolean delete(T e);


}
