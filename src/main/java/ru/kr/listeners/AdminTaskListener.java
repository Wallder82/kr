package ru.kr.listeners;

import org.camunda.bpm.engine.delegate.DelegateTask;
import org.camunda.bpm.engine.delegate.TaskListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kr.entity.Application;
import ru.kr.entity.Equipment;
import ru.kr.entity.PrivateEquipment;
import ru.kr.entity.Status;
import ru.kr.repository.ApplicationRepository;
import ru.kr.repository.EquipmentRepository;
import ru.kr.repository.PrivateEquipmentRepository;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class AdminTaskListener implements TaskListener {

    @Autowired
    private EquipmentRepository equipmentRepository;

    @Autowired
    private ApplicationRepository applicationRepository;

    @Autowired
    PrivateEquipmentRepository privateEquipmentRepository;

    @Override
    public void notify(DelegateTask delegateTask) {
        Long application_id = (Long) delegateTask.getVariable("application_id");
        Application application = applicationRepository.getOne(application_id);
        application.setStatus(Status.COMPLETED.toString());
        applicationRepository.saveAndFlush(application);
        List<PrivateEquipment> privateEquipmentList = new ArrayList<>();
        application.getRowList().forEach(row -> {
            Equipment equipment = row.getEquipment();
            Long count = equipment.getCount();
            count = count - row.getCount();
            equipment.setCount(count);
            equipment = equipmentRepository.saveAndFlush(equipment);

            PrivateEquipment privateEquipment = new PrivateEquipment();
            privateEquipment.setApplication(application);
            privateEquipment.setEquipment(equipment);
            privateEquipment.setSetTime(LocalDateTime.now());
            privateEquipment.setUser(application.getUser());
            privateEquipment.setCount(row.getCount());
            privateEquipmentRepository.saveAndFlush(privateEquipment);
        });
    }
}
