package ru.kr.rest.controller;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.kr.entity.Houseroom;
import ru.kr.entity.Room;
import ru.kr.repository.HouseroomRepository;
import ru.kr.repository.RoomRepository;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/room")
public class RoomController {

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private HouseroomRepository houseroomRepository;

    @GetMapping("/list")
    public String getList (Model model) {
        model.addAttribute("room_list", roomRepository.findAll());
        return "room_list";
    }

    @GetMapping("/edit")
    public String editForm(Model model) {
        model.addAttribute("houseroom_list", houseroomRepository.findAll());
        return "edit_room";
    }

    @GetMapping("/edit/{room}")
    public String editFormById(@PathVariable Room room, Model model) {
        model.addAttribute("room", room);
        return "edit_room";
    }

    @PostMapping(value = "/save")
    public String save(@RequestParam Map<String, Object> form, Model model) throws IOException {
        ModelMapper mapper = new ModelMapper();
        Room room = mapper.map(form, Room.class);
        Long houseroomId = Long.parseLong((String) form.get("houseroom"));
        Houseroom houseroom = houseroomRepository.getOne(houseroomId);
        room.setHouseroom(houseroom);
        roomRepository.saveAndFlush(room);
        model.addAttribute("room_list", roomRepository.findAll());
        return "redirect:/room/list";
    }

    @GetMapping("/delete/{room}")
    public String delete(@PathVariable Room room, Model model) {
        if (room != null) {
            roomRepository.delete(room);
        }
        model.addAttribute("room_list", roomRepository.findAll());
        return "redirect:/room/list";
    }
}
