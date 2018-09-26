package com.global.dao;

import com.global.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.*;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(MockitoJUnitRunner.class)
public class UserDaoImplTest {

    @Mock
    private UserDaoImpl userDao;


    @Test
    public void addUser() {
        Mockito.doNothing()
                .when(userDao).addUser(new User());

    }

    @Test
    public void updateUser() {
        Mockito.doNothing()
                .when(userDao).updateUser(new User());
    }

    @Test
    public void removeUser() {
        Mockito.doNothing()
                .when(userDao).removeUser(4);
    }

    @Test
    public void getUserById() {
        Mockito.when(userDao.getUserById(2))
                .thenReturn(new User());
    }

    @Test
    public void listUsers() {
        List<User> list = userDao.listUsers();
        assertNotNull(list);

    }


}