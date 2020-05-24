package ru.kr.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.kr.entity.User;
import ru.kr.repository.PrivateEquipmentRepository;
import ru.kr.repository.UserRepository;

@Controller
@RequestMapping("/private_equipment")
public class PrivateEquipmentController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    PrivateEquipmentRepository privateEquipmentRepository;

    @GetMapping("/list/{username}")
    public String getList(@PathVariable String username, Model model) {
        User user = userRepository.findByUsername(username);
        model.addAttribute("equipment_list", privateEquipmentRepository.findByUserId(user.getId()));
        return "private_equipment_list";
    }
}
