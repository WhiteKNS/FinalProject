package com.springapp.mvc;

/**
 * Created by Natalya on 11/18/2015.
 */
import java.util.List;
import com.springapp.mvc.User;

public interface UserDAO {

    public void addContact(User user);

    public List<User> listContact();

    public void removeUser(Integer id);
}
