package com.example.springboot.model;

import lombok.Data;
import java.io.Serializable;
import java.util.Date;

/**
 * 定时任务执行日志表
 */
@Data
public class ScheduleJobLog implements Serializable {

    private static final long serialVersionUID = 1L;
    private String id;
    private String jobId;   //任务id
    private String beanName;   //spring bean名称
    private String methodName;   //方法名
    private String methodParams;   //参数
    private Integer result;   //任务状态    0：成功    1：失败
    private String error;   //失败信息
    private Integer times;   //耗时(单位：毫秒)
    private Date createDate;
    private Date updateDate;


}
