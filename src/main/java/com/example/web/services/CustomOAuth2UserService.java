package com.example.web.services;

import com.example.web.dtos.UserAppDto;
import com.example.web.repositories.UserAppRepository;
import com.example.web.security.CustomOAuth2User;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final UserAppService userAppService;
    private final UserAppRepository userAppRepository;

    public CustomOAuth2UserService(UserAppService userAppService, UserAppRepository userAppRepository) {
        this.userAppService = userAppService;
        this.userAppRepository = userAppRepository;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) {
        OAuth2User oAuth2User = super.loadUser(userRequest);

        String email = oAuth2User.getAttribute("email");
        String username = oAuth2User.getAttribute("name");

        UserAppDto userDto;
        var optionalUser = userAppRepository.findByEmail(email);
        if (optionalUser.isEmpty()) {
            userAppService.registerUser(username, "OAuthDummyPass123!", email);
            userDto = userAppRepository.findByEmail(email).orElseThrow();
        } else {
            userDto = optionalUser.get();
        }

        return new CustomOAuth2User(userDto, oAuth2User.getAttributes());
    }
}
