package com.example.springboot.model;

import lombok.Data;
import java.io.Serializable;
import java.util.Date;

/**
 * 定时任务表
 */
@Data
public class ScheduleJob implements Serializable {

    private static final long serialVersionUID = 1L;
    private String id;
    private String beanName; //spring bean名称
    private String methodName; //方法名
    private String methodParams; //参数
    private String cron; //cron表达式
    private Integer jobStatus;//任务状态
    private Date createDate;
    private Date updateDate;

}
