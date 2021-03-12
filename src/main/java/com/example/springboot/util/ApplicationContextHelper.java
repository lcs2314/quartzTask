package com.example.springboot.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * @Classname ApplicationContextHelper
 * @Description TODO
 * @Date 2021/3/12 16:16
 * @Author lichengshuai
 */
@Slf4j
@Component
public class ApplicationContextHelper implements ApplicationContextAware , DisposableBean {

    private static ApplicationContext applicationContext = null;

    /**
     * 从静态变量applicationContext中取得Bean, 自动转型为所赋值对象的类型.
     */
    public static <T> T getBean(String name) {
        assertContextInjected();
        return (T) applicationContext.getBean(name);
    }

    @Override
    public void destroy() throws Exception {
        clearHolder();
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        ApplicationContextHelper.applicationContext = applicationContext;
    }

    private static void assertContextInjected() {
        Validate.validState(applicationContext != null, "applicaitonContext属性未注入, 请在applicationContext.xml中定义ApplicationContextHelper", new Object[0]);
    }

    public static void clearHolder() {
        if (log.isDebugEnabled()) {
            log.debug("清除SpringContextHolder中的ApplicationContext:" + applicationContext);
        }
        applicationContext = null;
    }
}
