package ru.kr.rest.controller;

import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.kr.entity.*;
import ru.kr.repository.ApplicationRepository;
import ru.kr.repository.EquipmentRepository;
import ru.kr.repository.RowRepository;
import ru.kr.repository.UserRepository;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/application")
public class ApplicationController {

    private ModelMapper mapper = new ModelMapper();

    @Autowired
    private ApplicationRepository applicationRepository;

    @Autowired
    private EquipmentRepository equipmentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RowRepository rowRepository;

    @Autowired
    RuntimeService runtimeService;

    @GetMapping("/create_blank/{username}")
    private String createBlankApplication(@PathVariable String username, Model model) {
        Application newApplication = new Application();
        User user = userRepository.findByUsername(username);
        newApplication.setUser(user);
        newApplication.setStatus(Status.CREATED.toString());
        newApplication.setCreateTime(LocalDateTime.now());
        newApplication = applicationRepository.saveAndFlush(newApplication);

        Map<String, Object> variables = new HashMap<>();
        variables.put("application_id", newApplication.getId());
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("ApplicationProcess", newApplication.getId().toString(), variables);

        model.addAttribute("application", newApplication);
        model.addAttribute("equipment_list", equipmentRepository.findAll());
        return "application_info";
    }

    @GetMapping("/list/{username}")
    private String getList(@PathVariable String username, Model model) {
        User user = userRepository.findByUsername(username);
        model.addAttribute("application_list", applicationRepository.findByUserId(user.getId()));
        return "application_list";
    }

    @GetMapping("/edit/{application}")
    public String editFormById(@PathVariable Application application, Model model) {
        model.addAttribute("application", application);
        model.addAttribute("equipment_list", equipmentRepository.findAll());
        return "application_info";
    }

    @GetMapping("/delete/{application}")
    public String delete(@PathVariable Application application, Model model) {
        if (application != null) {
            User user = application.getUser();
            applicationRepository.delete(application);
            ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceBusinessKey(application.getId().toString()).singleResult();
            runtimeService.deleteProcessInstance(processInstance.getId(), "Удаление заявки");
            return "redirect:/application/list/" + user.getUsername();
        }
        else {
            return "redirect:/";
        }
    }

    @PostMapping("/row/add")
    public String addRow(@RequestParam Map<String, Object> form, Model model) {
        Row newRow = new Row();
        Application application = applicationRepository.getOne(Long.valueOf((String) form.get("application_id")));
        Equipment equipment = equipmentRepository.getOne(Long.valueOf((String) form.get("equipment_id")));
        newRow.setApplication(application);
        newRow.setEquipment(equipment);
        newRow.setCount(Long.valueOf((String) form.get("count")));
        rowRepository.save(newRow);
        return "redirect:/application/edit/" + application.getId().toString();
    }

    @PostMapping("/save")
    public String saveApplication(@RequestParam Map<String, Object> form, Model model) {
        Application application = applicationRepository.getOne(Long.valueOf((String) form.get("application_id")));
        application.setDescription((String) form.get("description"));
        applicationRepository.saveAndFlush(application);
        return "redirect:/application/list/" + application.getUser().getUsername();
    }

    @GetMapping("/row/delete/{row}")
    public String delete(@PathVariable Row row, Model model) {
        if (row != null) {
            Application application = row.getApplication();
            rowRepository.delete(row);
            return "redirect:/application/edit/" + application.getId().toString();
        }
        else {
            return "redirect:/";
        }
    }

}
