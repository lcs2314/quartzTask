package com.example.springboot.util;

import com.example.springboot.common.Constant;
import com.example.springboot.mapper.ScheduleJobLogDao;
import com.example.springboot.model.ScheduleJob;
import com.example.springboot.model.ScheduleJobLog;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;

import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;


/**
 * 定时任务工具
 */
@Slf4j
@Component
public class ScheduleJobUtils extends QuartzJobBean {

    ExecutorService threadPoolExecutor = Executors.newCachedThreadPool();

    @Autowired
    private ScheduleJobLogDao scheduleJobLogDao;

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        ScheduleJob scheduleJob = (ScheduleJob) context.getMergedJobDataMap()
                .get(Constant.JOB_PARAM_KEY);

        //数据库保存执行记录
        ScheduleJobLog jobLog = new ScheduleJobLog();
        jobLog.setId(String.valueOf(UUID.randomUUID()));
        jobLog.setJobId(scheduleJob.getId());
        jobLog.setBeanName(scheduleJob.getBeanName());
        jobLog.setMethodName(scheduleJob.getMethodName());
        jobLog.setMethodParams(scheduleJob.getMethodParams());

        //任务开始时间
        long startTime = System.currentTimeMillis();
        try {
            //执行任务
            log.info("任务准备执行，任务ID：" + scheduleJob.getId());
            ScheduleRunnable task = new ScheduleRunnable(scheduleJob.getBeanName(),
                    scheduleJob.getMethodName(), scheduleJob.getMethodParams());
            Future<?> future = threadPoolExecutor.submit(task);
            future.get();
            //任务执行总时长
            long times = System.currentTimeMillis() - startTime;
            jobLog.setTimes((int) times);
            //任务状态    0：成功    1：失败
            jobLog.setResult(Constant.SUCCESS);
            log.info("任务执行完毕，任务ID：" + scheduleJob.getId() + "  总共耗时：" + times + "毫秒");
        } catch (Exception e) {
            log.error("任务执行失败，任务ID：" + scheduleJob.getId(), e);
            //任务执行总时长
            long times = System.currentTimeMillis() - startTime;
            jobLog.setTimes((int) times);
            //任务状态    0：成功    1：失败
            jobLog.setResult(Constant.FAIL);
            jobLog.setError(StringUtils.substring(e.toString(), 0, 2000));
        } finally {
            scheduleJobLogDao.insert(jobLog);
        }
    }
}
