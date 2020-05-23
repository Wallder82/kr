package ru.kr.listeners;

import org.camunda.bpm.engine.delegate.DelegateTask;
import org.camunda.bpm.engine.delegate.TaskListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kr.entity.Application;
import ru.kr.entity.Status;
import ru.kr.repository.ApplicationRepository;

@Service
public class AdminTaskListener implements TaskListener {

    @Autowired
    private ApplicationRepository applicationRepository;

    @Override
    public void notify(DelegateTask delegateTask) {
        Long application_id = (Long) delegateTask.getVariable("application_id");
        Application application = applicationRepository.getOne(application_id);
        application.setStatus(Status.COMPLETED.toString());
        applicationRepository.saveAndFlush(application);
    }
}
