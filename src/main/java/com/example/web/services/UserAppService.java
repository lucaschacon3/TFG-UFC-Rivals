package com.example.web.services;

import com.example.web.dtos.UserAppDto;
import com.example.web.repositories.UserAppRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserAppService implements UserDetailsService {


    private final UserAppRepository userAppRepository;
    private final PasswordEncoder passwordEncoder;

    public UserAppService(UserAppRepository userAppRepository, PasswordEncoder passwordEncoder) {
        this.userAppRepository = userAppRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void registerUser(String username, String rawPassword, String email) {
        String normalizedUsername = username.toLowerCase();
        String normalizedEmail = email.toLowerCase();

        if (userAppRepository.findByUsername(normalizedUsername).isPresent()) {
            throw new IllegalArgumentException("Username already exists");
        }
        if (userAppRepository.findByEmail(normalizedEmail).isPresent()) {
            throw new IllegalArgumentException("Email already exists");
        }

        validateEmail(normalizedEmail);
        validatePassword(rawPassword);

        UserAppDto user = new UserAppDto();
        user.setUsername(normalizedUsername);
        user.setEmail(normalizedEmail);
        user.setPassword(passwordEncoder.encode(rawPassword));
        userAppRepository.save(user);

    }

    public void deleteUser(UserAppDto user_app, String current_password) {
        if (!passwordEncoder.matches(current_password, user_app.getPassword())) {
            throw new IllegalArgumentException("Password is not correct");
        }
        userAppRepository.deleteUser(user_app.getId_user_app());
    }

    public void updateUser(UserAppDto user_app, String current_password, String new_username, String new_email, String new_password, String confirm_new_password) {

        if (!passwordEncoder.matches(current_password, user_app.getPassword())) {
            throw new IllegalArgumentException("Password is not correct");
        }

        if ((new_username == null || new_username.isBlank()) &&
                (new_email == null || new_email.isBlank()) &&
                (new_password == null || new_password.isBlank()) &&
                (confirm_new_password == null || confirm_new_password.isBlank())) {

            throw new IllegalArgumentException("At least one field must be filled to update user data");
        }

        if (new_username != null && !new_username.isBlank() && !(new_username.toLowerCase()).equals(user_app.getUsername())) {
            if (userAppRepository.findByUsername(new_username).isPresent()) {
                throw new IllegalArgumentException("Username already exists");
            }
        }

        if (new_email != null && !new_email.isBlank() && !(new_email.toLowerCase()).equals(user_app.getEmail())) {
            validateEmail(new_email);
            if (userAppRepository.findByEmail(new_email).isPresent()) {
                throw new IllegalArgumentException("email already exists");
            }
        } else {
            new_email = null; // para que no se actualice
        }

        if (new_password != null && !new_password.isBlank()) {
            if (!new_password.equals(confirm_new_password)) {
                throw new IllegalArgumentException("Passwords do not match");
            }
            validatePassword(new_password);
            new_password = passwordEncoder.encode(new_password);
        } else {
            new_password = null;
        }

        userAppRepository.updateUser(
                user_app.getId_user_app(),
                (new_username != null && !new_username.isBlank()) ? new_username.toLowerCase() : null,
                (new_email != null) ? new_email.toLowerCase() : null,
                new_password
        );
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserAppDto user = userAppRepository.findByUsername(username.toLowerCase())
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        return new UserAppDto(
                user.getId_user_app(),
                user.getUsername(),
                user.getEmail(),
                user.getPassword(),
                List.of()
        );
    }

    public void validatePassword(String rawPassword) {
        if (rawPassword == null) {
            throw new IllegalArgumentException("Password cannot be empty.");
        }

        if (rawPassword.length() < 10 || rawPassword.length() > 20) {
            throw new IllegalArgumentException("Password must be between 10 and 20 characters long.");
        }

        if (!rawPassword.matches(".*[a-z].*")) {
            throw new IllegalArgumentException("Password must contain at least one lowercase letter.");
        }

        if (!rawPassword.matches(".*[A-Z].*")) {
            throw new IllegalArgumentException("Password must contain at least one uppercase letter.");
        }

        if (!rawPassword.matches(".*\\d.*")) {
            throw new IllegalArgumentException("Password must contain at least one number.");
        }

        if (!rawPassword.matches(".*[!@#$%^&*()\\-+=~`{}\\[\\]:;\"'<>,.?/|\\\\].*")) {
            throw new IllegalArgumentException("Password must contain at least one special character.");
        }
    }

    public void validateEmail(String email) {
        if (email == null || email.isBlank() || email.length() < 6 ||
                !email.contains("@") || !email.contains(".")) {
            throw new IllegalArgumentException("Invalid email address format.");
        }

        String lowerEmail = email.toLowerCase();

        if (!(lowerEmail.endsWith("@gmail.com") ||
                lowerEmail.endsWith("@hotmail.com") ||
                lowerEmail.endsWith("@outlook.com") ||
                lowerEmail.endsWith("@yahoo.com"))) {
            throw new IllegalArgumentException("Email domain is not valid.");
        }
    }




}
