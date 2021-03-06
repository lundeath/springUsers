package com.global.dao;

import com.global.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.*;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;
import org.powermock.core.classloader.annotations.PrepareForTest;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(MockitoJUnitRunner.class)
@PrepareForTest(UserDaoImpl.class)
public class UserDaoImplTest {

    @Mock
    private UserDaoImpl userDao;


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