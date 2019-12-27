package ru.kr.rest.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.kr.entity.Building;
import ru.kr.entity.Houseroom;
import ru.kr.repository.BuildingRepository;
import ru.kr.repository.HouseroomRepository;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/houseroom")
public class HouseroomController {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private HouseroomRepository houseroomRepository;

    @GetMapping("/list")
    public String getList (Model model) {
        model.addAttribute("houseroom_list", houseroomRepository.findAll());
        return "houseroom_list";
    }

    @GetMapping("/edit")
    public String editForm(Model model) {
        model.addAttribute("building_list", buildingRepository.findAll());
        return "edit_houseroom";
    }

    @GetMapping("/edit/{houseroom}")
    public String editFormById(@PathVariable Houseroom houseroom, Model model) {
        model.addAttribute("houseroom", houseroom);
        return "edit_houseroom";
    }

    @PostMapping(value = "/save")
    public String create(@RequestParam Map<String, Object> form, Model model) throws IOException {
        ModelMapper mapper = new ModelMapper();
        Houseroom houseroom = mapper.map(form, Houseroom.class);
        String buildingKadastr = (String) form.get("building");
        Building building = buildingRepository.getOne(buildingKadastr);
        houseroom.setBuilding(building);
        houseroomRepository.saveAndFlush(houseroom);
        model.addAttribute("houseroom_list", houseroomRepository.findAll());
        return "redirect:/houseroom/list";
    }

    @GetMapping("/delete/{houseroom}")
    public String delete(@PathVariable Houseroom houseroom, Model model) {
        if (houseroom != null) {
            houseroomRepository.delete(houseroom);
        }
        model.addAttribute("houseroom_list", houseroomRepository.findAll());
        return "redirect:/houseroom/list";
    }
}
