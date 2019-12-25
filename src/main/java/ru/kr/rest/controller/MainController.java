package ru.kr.rest.controller;


import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.kr.entity.Building;
import ru.kr.repository.BuildingRepository;

import java.io.IOException;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private BuildingRepository buildingRepository;

    @GetMapping("/greeting")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping
    public String main(Map<String, Object> model) {
        return "main";
    }

}
