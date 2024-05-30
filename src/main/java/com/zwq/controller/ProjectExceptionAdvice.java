package com.zwq.controller;

import com.zwq.result.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class ProjectExceptionAdvice {
    @ExceptionHandler(Exception.class)
    public Result doException(Exception ex){
        System.out.println("66666666666666666666666666666666666666666666666666666666666666666666666666666666");
        return Result.error("6666");
    }
}
