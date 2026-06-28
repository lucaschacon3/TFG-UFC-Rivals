package com.example.web.security;

import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public interface UserAppInfo {
    String getUsername();
    String getEmail();
    Integer getId();
    Collection<? extends GrantedAuthority> getAuthorities();
}
