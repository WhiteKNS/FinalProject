package com.springapp.mvc;

/**
 * Created by Natalya on 11/18/2015.
 */


import java.util.List;
import com.springapp.mvc.User;

public interface UserService {

    public void addUser(User contact);

    public List<User> listUser();

    public void removeUser(Integer id);
}