package ru.kr.rest.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kr.entity.Role;
import ru.kr.entity.User;
import ru.kr.repository.UserRepository;

import java.util.Collections;
import java.util.Map;
import java.util.Objects;

@Controller
public class AdminController {

    private ModelMapper mapper = new ModelMapper();

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registration")
    public String getRegistrationPage () {
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser (@RequestParam Map<String, Object> form, Model model) {
        User newUser = mapper.map(form, User.class);
        if (Objects.nonNull(userRepository.findByUsername(newUser.getUsername()))) {
            model.addAttribute("message", "Пользователь с таким логином уже существует!");
        }
        newUser.setActive(true);
        newUser.setRoles(Collections.singleton(Role.USER));
        userRepository.saveAndFlush(newUser);
        return "login";
    }
}
