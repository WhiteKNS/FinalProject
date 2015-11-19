package com.springapp.mvc;

/**
 * Created by Natalya on 11/13/2015.
 */
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component

public class FormValidator implements Validator {

    private Pattern pattern;
    private Matcher matcher;

    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    String ID_PATTERN = "[0-9]+";
    String STRING_PATTERN = "[a-zA-Z]+";
    String MOBILE_PATTERN = "^[0-9]{3}-?[0-9]{7}]$";


    @Override
    public boolean supports(Class aClass) {
        return User.class.equals(aClass);
    }

    public void validate(Object obj, Errors errors) {
        User user = (User) obj;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstname", "required.firstname","Name is required" );
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastname", "NotEmpty.userForm.lastname", "Last name is required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login", "NotEmpty.userForm.login", "login required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.userForm.password", "password required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email","NotEmpty.userForm.email", "email required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthdate", "NotEmpty.userForm.birthdate", "birth date required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotEmpty.userForm.phone", "phone required");

        if(user.getPassword()==null || user.getPassword().length()<6||user.getPassword().length()>16){
            errors.rejectValue("password", "NotEmpty.userForm.password", "password required");
        }


        if(!(user.getPhone()!=null) || !((user.getPhone().length()<=0)&&!(user.getPhone().length()>10))){
            pattern = Pattern.compile(MOBILE_PATTERN);
            matcher = pattern.matcher(user.getPhone());
            if(!matcher.matches()){
                errors.rejectValue("phone", "NotEmpty.userForm.phone", "phone is required");}
        }

        if(!(user.getEmail()!=null)&&user.getEmail().isEmpty()){
            pattern= Pattern.compile(EMAIL_PATTERN);
            matcher = pattern.matcher(user.getEmail());
            if (!matcher.matches()) {
                errors.rejectValue("email", "Pattern.userForm.email", "email is required");
            }
        }


        if(!(user.getFirstname()!=null) || !(user.getFirstname().length()<6)||!(user.getFirstname().length()>16)){
            pattern = Pattern.compile(STRING_PATTERN);
            matcher = pattern.matcher(user.getFirstname());
            if(!matcher.matches()){
                errors.rejectValue("firstname", "NotEmpty.userForm.firstname", "Name is required");}
        }
        if(!(user.getLastname()!=null) || !(user.getLastname().length()<6)||!(user.getLastname().length()>16)){
            pattern = Pattern.compile(STRING_PATTERN);
            matcher = pattern.matcher(user.getLastname());
            if(!matcher.matches()){
                errors.rejectValue("lastname", "NotEmpty.userForm.lastname", "Last name is required");}
        }

        if(user.getLastname()==null || user.getLogin().length()<6||user.getLogin().length()>16){
            errors.rejectValue("login", "NotEmpty.userForm.login", "login required");
        }

        if(user.getLastname()==null || user.getBirthdate().length()<6||user.getBirthdate().length()>16){
            errors.rejectValue("birthdate", "NotEmpty.userForm.birthdate", "birth date is required");
        }
    }
}
