package com.example.web.security;

import com.example.web.dtos.UserAppDto;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;
import java.util.Map;

public class CustomOAuth2User implements OAuth2User, UserAppInfo  {

    @Getter
    private final UserAppDto userAppDto;
    private final Map<String, Object> attributes;

    public CustomOAuth2User(UserAppDto userAppDto, Map<String, Object> attributes) {
        this.userAppDto = userAppDto;
        this.attributes = attributes;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    @Override
    public String getUsername() {
        return userAppDto.getUsername();
    }

    @Override
    public String getEmail() {
        return userAppDto.getEmail();
    }

    @Override
    public Integer getId() {
        return userAppDto.getId_user_app();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return userAppDto.getAuthorities(); // o List.of() si no usás roles
    }

    @Override
    public String getName() {
        return userAppDto.getUsername();
    }
}
