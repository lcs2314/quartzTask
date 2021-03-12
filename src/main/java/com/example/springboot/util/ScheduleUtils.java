package com.example.springboot.util;

import com.example.springboot.common.Constant;
import com.example.springboot.model.ScheduleJob;
import org.quartz.*;

/**
 * 定时任务工具类
 */
public class ScheduleUtils {
    private final static String JOB_NAME = "TASK_";

    /**
     * 获取触发器key
     */
    public static TriggerKey getTriggerKey(String jobId) {
        return TriggerKey.triggerKey(JOB_NAME + jobId);
    }

    /**
     * 获取jobKey
     */
    public static JobKey getJobKey(String jobId) {
        return JobKey.jobKey(JOB_NAME + jobId);
    }

    /**
     * 获取表达式触发器
     */
    public static CronTrigger getCronTrigger(Scheduler scheduler, String jobId) {
        try {
            return (CronTrigger) scheduler.getTrigger(getTriggerKey(jobId));
        } catch (SchedulerException e) {
            throw new RuntimeException("获取定时任务失败");
        }
    }

    /**
     * 创建定时任务
     */
    public static void createScheduleJob(Scheduler scheduler, ScheduleJob scheduleJob) {
        try {
            //构建job信息
            JobDetail jobDetail = JobBuilder.newJob(ScheduleJobUtils.class).withIdentity(getJobKey(scheduleJob.getId())).build();

            //表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCron())
                    .withMisfireHandlingInstructionDoNothing();

            //按新的cronExpression表达式构建一个新的trigger
            CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(getTriggerKey(scheduleJob.getId())).withSchedule(scheduleBuilder).build();

            //放入参数，运行时的方法可以获取
            jobDetail.getJobDataMap().put(Constant.JOB_PARAM_KEY, scheduleJob);

            scheduler.scheduleJob(jobDetail, trigger);

        } catch (SchedulerException e) {
            throw new RuntimeException("创建定时任务失败");
        }
    }

    /**
     * 更新定时任务
     */
    public static void updateScheduleJob(Scheduler scheduler, ScheduleJob scheduleJob) {
        try {
            TriggerKey triggerKey = getTriggerKey(scheduleJob.getId());

            //表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCron())
                    .withMisfireHandlingInstructionDoNothing();

            CronTrigger trigger = getCronTrigger(scheduler, scheduleJob.getId());

            //按新的cronExpression表达式重新构建trigger
            trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

            //参数
            trigger.getJobDataMap().put(Constant.JOB_PARAM_KEY, scheduleJob);

            scheduler.rescheduleJob(triggerKey, trigger);

            //暂停任务
            if(scheduleJob.getJobStatus() == Constant.PAUSE){
                pauseJob(scheduler,scheduleJob.getId() );
            }

        } catch (SchedulerException e) {
            throw new RuntimeException("更新定时任务失败");
        }
    }

    /**
     * 立即执行任务
     */
    public static void run(Scheduler scheduler, ScheduleJob scheduleJob) {
        try {
            //参数
            JobDataMap dataMap = new JobDataMap();
            dataMap.put(Constant.JOB_PARAM_KEY, scheduleJob);

            scheduler.triggerJob(getJobKey(scheduleJob.getId()), dataMap);
        } catch (SchedulerException e) {
            throw new RuntimeException("立即执行定时任务失败");
        }
    }

    /**
     * 暂停任务
     */
    public static void pauseJob(Scheduler scheduler, String jobId) {
        try {
            scheduler.pauseJob(getJobKey(jobId));
        } catch (SchedulerException e) {
            throw new RuntimeException("暂停定时任务失败");
        }
    }

    /**
     * 恢复任务
     */
    public static void resumeJob(Scheduler scheduler, String jobId) {
        try {
            scheduler.resumeJob(getJobKey(jobId));
        } catch (SchedulerException e) {
            throw new RuntimeException("恢复定时任务失败");
        }
    }

    /**
     * 删除定时任务
     */
    public static void deleteScheduleJob(Scheduler scheduler, String jobId) {
        try {
            scheduler.deleteJob(getJobKey(jobId));
        } catch (SchedulerException e) {
            throw new RuntimeException("删除定时任务失败");
        }
    }
}
