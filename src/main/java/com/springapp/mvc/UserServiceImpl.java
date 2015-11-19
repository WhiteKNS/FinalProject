package com.springapp.mvc;

/**
 * Created by Natalya on 11/18/2015.
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springapp.mvc.User;
import com.springapp.mvc.UserDAO;

@Service
public class UserServiceImpl implements UserService {

    private UserDAO userDAO;

    @Transactional
    public void addUser(User contact) {
       userDAO.addContact(contact);
    }

    @Transactional
    public List<User> listUser() {

        return userDAO.listContact();
    }

    @Transactional
    public void removeUser(Integer id) {
        userDAO.removeUser(id);
    }
}