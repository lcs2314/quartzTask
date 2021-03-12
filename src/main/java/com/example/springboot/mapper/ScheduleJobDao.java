package com.example.springboot.mapper;

import com.example.springboot.model.ScheduleJob;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * 定时任务mapper
 */
public interface ScheduleJobDao {

    /**
     * 查找id
     * @param job
     * @return
     */
    String findId(ScheduleJob job);

    List<ScheduleJob> findList();

    void insert(ScheduleJob scheduleJob);

    void update(ScheduleJob scheduleJob);

    ScheduleJob get(@Param("id") String id);

    void remove(ScheduleJob scheduleJob);
}
