package com.example.springboot.util;

import org.apache.commons.lang3.StringUtils;
import org.springframework.util.ReflectionUtils;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;

/**
 * 执行定时任务实现
 */
public class ScheduleRunnable implements Runnable {
    private Object target;
    private Method method;
    private String params;

    public ScheduleRunnable(String beanName, String methodName, String params) throws NoSuchMethodException, SecurityException {
        this.target = ApplicationContextHelper.getBean(beanName);
        this.params = params;

        if(StringUtils.isNotBlank(params)){
            this.method = target.getClass().getDeclaredMethod(methodName, String.class);
        }else{
            this.method = target.getClass().getDeclaredMethod(methodName);
        }
    }

    @Override
    public void run() {
        try {
            ReflectionUtils.makeAccessible(method);
            if(StringUtils.isNotBlank(params)){
                method.invoke(target, params);
            }else{
                method.invoke(target);
            }
        }catch (Exception e) {
            e.printStackTrace();
            StringWriter sw=new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            throw new RuntimeException("执行定时任务失败,"+sw.toString());
        }
    }

}
