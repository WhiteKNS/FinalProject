package com.springapp.mvc;

/**
 * Created by Natalya on 11/18/2015.
 */

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {


    private SessionFactory sessionFactory;


    @Override
    public void addContact(User contact) {
        sessionFactory.getCurrentSession().save(contact);
    }


    @SuppressWarnings("unchecked")
    public List<User> listContact() {

        return sessionFactory.getCurrentSession().createQuery("from User")
                .list();
    }


    @Override
    public void removeUser(Integer id) {
        User contact = (User) sessionFactory.getCurrentSession().load(
                User.class, id);
        if (null != contact) {
            sessionFactory.getCurrentSession().delete(contact);
        }

    }
}