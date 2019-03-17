package com.common.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "comparison")
public class ComparisonMgrController extends BaseController {


    @RequestMapping(value = "day", method = RequestMethod.GET)
    public ModelAndView day(ModelAndView modelAndView) {
        modelAndView.setViewName("/comparison/day/list");
        return modelAndView;
    }

    @RequestMapping(value = "month", method = RequestMethod.GET)
    public ModelAndView month(ModelAndView modelAndView) {
        modelAndView.setViewName("/comparison/month/list");
        return modelAndView;
    }

    @RequestMapping(value = "year", method = RequestMethod.GET)
    public ModelAndView year(ModelAndView modelAndView) {
        modelAndView.setViewName("/comparison/year/list");
        return modelAndView;
    }
}

