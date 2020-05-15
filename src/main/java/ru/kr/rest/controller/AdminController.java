package ru.kr.rest.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kr.entity.Role;
import ru.kr.entity.User;
import ru.kr.repository.UserRepository;

import java.util.*;

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
            return "registration";
        }
        newUser.setActive(true);
        HashSet<Role> roles = new HashSet<>();
        roles.add(Role.ADMIN);
        roles.add(Role.USER);
        newUser.setRoles(roles);
        userRepository.saveAndFlush(newUser);
        return "login";
    }

    @GetMapping("/user/list")
    public String getUsersList (Model model) {
        model.addAttribute("users_list" ,  userRepository.findAll());
        return "users_list";
    }

    @GetMapping("/user/edit/{user}")
    public String getUser(@PathVariable User user, Model model) {
        model.addAttribute("user" ,  user);
        model.addAttribute("roles" ,  Role.values());
        return "edit_user";
    }

    @PostMapping("/user/save")
    public String saveUser(@RequestParam Map<String, Object> form, Model model) {
        User user = mapper.map(form, User.class);
        Set<Role> roles = new HashSet();
        for (Role role: Role.values()) {
            String roleMode = (String) form.get(role.toString());
            if (Objects.nonNull(roleMode)) {
                roles.add(role);
            }
        }
        user.setRoles(roles);
        if (Objects.nonNull(user.getId())){
            User oldUser = userRepository.getOne(user.getId());
            user.setPassword(oldUser.getPassword());
        }
        userRepository.saveAndFlush(user);
        model.addAttribute("users_list" ,  userRepository.findAll());
        return "users_list";
    }

    @GetMapping("/user/delete/{user}")
    public String deleteUser(@PathVariable User user, Model model) {
        userRepository.delete(user);
        model.addAttribute("users_list" ,  userRepository.findAll());
        return "users_list";
    }
}
