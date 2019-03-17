package com.common.system.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "type")
public class TypeMgrController extends BaseController {


    @RequestMapping(value = "in", method = RequestMethod.GET)
    public ModelAndView day(ModelAndView modelAndView) {
        modelAndView.setViewName("/type/in/list");
        return modelAndView;
    }

    @RequestMapping(value = "out", method = RequestMethod.GET)
    public ModelAndView month(ModelAndView modelAndView) {
        modelAndView.setViewName("/type/out/list");
        return modelAndView;
    }


}
