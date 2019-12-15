package ru.kr.rest.controller;


import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.kr.entity.Building;
import ru.kr.repository.BuildingRepository;

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

    @GetMapping("/building")
    public String getBuilding(Map<String, Object> model) {
        return "building";
    }

    @PostMapping(value = "/building")
    public String postBuilding( @RequestParam byte[] picture, @RequestParam Map<String, Object> model) {
        ModelMapper mapper = new ModelMapper();
        Building building = mapper.map(model, Building.class);
        building.setPicture(picture);
        buildingRepository.saveAndFlush(building);
        return "building";
    }
}
