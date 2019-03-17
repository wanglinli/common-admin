package com.common.system.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "count")
public class CountMgrController extends BaseController {


    @RequestMapping(value = "day", method = RequestMethod.GET)
    public ModelAndView day(ModelAndView modelAndView) {
        modelAndView.setViewName("/count/day/list");
        return modelAndView;
    }

    @RequestMapping(value = "month", method = RequestMethod.GET)
    public ModelAndView month(ModelAndView modelAndView) {
        modelAndView.setViewName("/count/month/list");
        return modelAndView;
    }

    @RequestMapping(value = "year", method = RequestMethod.GET)
    public ModelAndView year(ModelAndView modelAndView) {
        modelAndView.setViewName("/count/year/list");
        return modelAndView;
    }

}
