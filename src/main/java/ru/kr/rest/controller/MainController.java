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

    @GetMapping("/create_building")
    public String getBuilding(Map<String, Object> model) {
        return "create_building";
    }

    @PostMapping(value = "/create_building")
    public String postBuilding(@RequestParam("picture") MultipartFile picture, @RequestParam Map<String, Object> model) throws IOException {
        ModelMapper mapper = new ModelMapper();
        Building building = mapper.map(model, Building.class);
        if (picture != null) {
            building.setPicture(picture.getBytes());
        }
        buildingRepository.saveAndFlush(building);
        return "create_building";
    }

    @GetMapping("/building/list")
    public String getBuildingList (Model model) {
        model.addAttribute("building_list", buildingRepository.findAll());
        return "building_list";
    }
}
