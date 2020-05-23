package ru.kr.rest.controller;

import org.camunda.bpm.engine.RepositoryService;
import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.TaskService;
import org.camunda.bpm.engine.repository.DeploymentBuilder;
import org.camunda.bpm.engine.task.Task;
import org.camunda.bpm.model.bpmn.instance.UserTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

@Controller
@RequestMapping("/camunda")
public class CamundaController {

    @Autowired
    RepositoryService repositoryService;

    @Autowired
    TaskService taskService;

    @Autowired
    RuntimeService runtimeService;

    @PostMapping(value = "/deploy/create")
    public String deployProcess(@RequestParam("file") MultipartFile file) {
        DeploymentBuilder deploymentBuilder = repositoryService.createDeployment();

        if (file.isEmpty()) {
            return "main";
        }
        InputStream uploadFileStream = null;
        try {
            uploadFileStream = file.getInputStream();
        } catch (IOException e) {
            return "main";
        }
        deploymentBuilder.addInputStream(file.getOriginalFilename(), uploadFileStream).deploy();
        return "main";
    }

    @PostMapping(value = "/complete/user_task")
    public String completeUserTask(@RequestParam Map<String, Object> form, Model model) {
        Task userTask = taskService.createTaskQuery().processInstanceBusinessKey((String) form.get("application_id")).singleResult();
        runtimeService.setVariable(userTask.getProcessInstanceId(), "action", (String) form.get("action"));
        taskService.complete(userTask.getId());
        return "main";
    }
}
