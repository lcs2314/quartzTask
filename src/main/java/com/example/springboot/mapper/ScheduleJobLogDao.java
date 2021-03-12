package com.example.springboot.mapper;

import com.example.springboot.model.ScheduleJobLog;

/**
 * 定时任务结果mapper
 */
public interface ScheduleJobLogDao {
    void insert(ScheduleJobLog jobLog);
}