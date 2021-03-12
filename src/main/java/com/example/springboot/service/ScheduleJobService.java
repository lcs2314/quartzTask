package com.example.springboot.service;

import com.example.springboot.common.Constant;
import com.example.springboot.mapper.ScheduleJobDao;
import com.example.springboot.model.ScheduleJob;
import com.example.springboot.util.ScheduleUtils;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Classname ScheduleJobService
 * @Description TODO
 * @Date 2021/3/12 15:33
 * @Author lichengshuai
 */
@Service
@Transactional(readOnly = true)
public class ScheduleJobService {
    @Autowired
    private ScheduleJobDao scheduleJobDao;

    @Autowired
    private Scheduler scheduler;

    /**
     * 项目启动时，初始化定时器
     */
    @PostConstruct
    public void init(){
        List<ScheduleJob> scheduleJobList = scheduleJobDao.findList();
        for(ScheduleJob scheduleJob : scheduleJobList){
            ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
        }
    }

    /**
     * 生成任务
     * @param scheduleJob
     */
    @Transactional(readOnly = false)
    public void insertScheduleJob(ScheduleJob scheduleJob) {
        scheduleJob.setId(String.valueOf(UUID.randomUUID()));
        scheduleJob.setCreateDate(new Date());
        scheduleJobDao.insert(scheduleJob);
        ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
    }

    /**
     * 更新任务
     * @param scheduleJob
     */
    @Transactional(readOnly = false)
    public void updateScheduleJob(ScheduleJob scheduleJob) {
        scheduleJob.setUpdateDate(new Date());
        scheduleJobDao.update(scheduleJob);
        ScheduleUtils.updateScheduleJob(scheduler, scheduleJob);
    }

    /**
     * 执行任务
     * @param id
     */
    public void run(String id) {
        ScheduleJob scheduleJob = scheduleJobDao.get(id);
        ScheduleUtils.run(scheduler,scheduleJob);
    }


    /**
     * 删除任务
     * @param id
     */
    @Transactional(readOnly = false)
    public void del(String id) {
        ScheduleUtils.deleteScheduleJob(scheduler, id);
        ScheduleJob scheduleJob = new ScheduleJob();
        scheduleJob.setId(id);
        scheduleJobDao.remove(scheduleJob);
    }

    /**
     * 暂停任务
     * @param id
     */
    @Transactional(readOnly = false)
    public void pause(String id) {
        ScheduleUtils.pauseJob(scheduler, id);
        ScheduleJob scheduleJob = new ScheduleJob();
        scheduleJob.setId(id);
        scheduleJob.setJobStatus(Constant.PAUSE);
        scheduleJob.setUpdateDate(new Date());
        scheduleJobDao.update(scheduleJob);
    }

    /**
     * 恢复任务
     * @param id
     */
    @Transactional(readOnly = false)
    public void resume(String id) {
        ScheduleUtils.resumeJob(scheduler, id);
        ScheduleJob scheduleJob = new ScheduleJob();
        scheduleJob.setId(id);
        scheduleJob.setJobStatus(Constant.NORMAL);
        scheduleJob.setUpdateDate(new Date());
        scheduleJobDao.update(scheduleJob);
    }
}
