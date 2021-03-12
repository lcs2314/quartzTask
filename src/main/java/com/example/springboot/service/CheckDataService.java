package com.example.springboot.service;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * 任务执行类
 */
@Component("checkData")
@Slf4j
public class CheckDataService {

    /**
     * 任务执行方法
     * @param params 参数
     */
    public void testAction(String params){
        log.info("我是带参数的testAction方法，正在被执行，参数为：" + params);
    }

}
