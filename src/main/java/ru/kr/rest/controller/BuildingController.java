package ru.kr.rest.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.kr.entity.Building;
import ru.kr.repository.BuildingRepository;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/building")
public class BuildingController {

    @Autowired
    private BuildingRepository buildingRepository;

    @GetMapping("/list")
    public String getList (Model model) {
        model.addAttribute("building_list", buildingRepository.findAll());
        return "building_list";
    }

    @GetMapping("/edit")
    public String editForm(Model model) {
        return "edit_building";
    }

    @GetMapping("/edit/{building}")
    public String editFormById(@PathVariable Building building, Model model) {
        model.addAttribute("building", building);
        return "edit_building";
    }

    @PostMapping(value = "/save")
    public String create(@RequestParam("picture") MultipartFile picture, @RequestParam Map<String, Object> form, Model model) throws IOException {
        ModelMapper mapper = new ModelMapper();
        Building building = mapper.map(form, Building.class);
        if (picture != null) {
            building.setPicture(picture.getBytes());
        }
        buildingRepository.saveAndFlush(building);
        model.addAttribute("building_list", buildingRepository.findAll());
        return "redirect:/building/list";
    }

    @GetMapping("/delete/{building}")
    public String delete(@PathVariable Building building, Model model) {
        if (building != null) {
            buildingRepository.delete(building);
        }
        model.addAttribute("building_list", buildingRepository.findAll());
        return "redirect:/building/list";
    }
}
