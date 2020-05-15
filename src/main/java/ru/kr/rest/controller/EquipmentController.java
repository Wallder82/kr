package ru.kr.rest.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.kr.entity.Equipment;
import ru.kr.repository.EquipmentRepository;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {

    private ModelMapper mapper = new ModelMapper();

    @Autowired
    private EquipmentRepository equipmentRepository;

    @GetMapping("/list")
    private String getList(Model model) {
        model.addAttribute("equipment_list", equipmentRepository.findAll());
        return "equipment_list";
    }

    @GetMapping("/edit")
    public String editForm() {
        return "edit_equipment";
    }

    @GetMapping("/edit/{equipment}")
    public String editFormById(@PathVariable Equipment equipment, Model model) {
        model.addAttribute("equipment", equipment);
        return "edit_equipment";
    }

    @PostMapping(value = "/save")
    public String save(@RequestParam Map<String, Object> form, Model model) throws IOException {
        Equipment equipment = mapper.map(form, Equipment.class);
        equipmentRepository.saveAndFlush(equipment);
        model.addAttribute("equipment_list", equipmentRepository.findAll());
        return "redirect:/equipment/list";
    }

    @GetMapping("/delete/{equipment}")
    public String delete(@PathVariable Equipment equipment, Model model) {
        if (equipment != null) {
            equipmentRepository.delete(equipment);
        }
        model.addAttribute("equipment_list", equipmentRepository.findAll());
        return "redirect:/equipment/list";
    }
}
