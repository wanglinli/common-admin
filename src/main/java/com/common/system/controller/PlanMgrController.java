package com.common.system.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "plan")
public class PlanMgrController extends BaseController {


    @RequestMapping(value = "remind", method = RequestMethod.GET)
    public ModelAndView day(ModelAndView modelAndView) {
        modelAndView.setViewName("/plan/remind/list");
        return modelAndView;
    }

    @RequestMapping(value = "borrow", method = RequestMethod.GET)
    public ModelAndView month(ModelAndView modelAndView) {
        modelAndView.setViewName("/plan/borrow/list");
        return modelAndView;
    }

    @RequestMapping(value = "toloan", method = RequestMethod.GET)
    public ModelAndView year(ModelAndView modelAndView) {
        modelAndView.setViewName("/plan/toloan/list");
        return modelAndView;
    }

}
