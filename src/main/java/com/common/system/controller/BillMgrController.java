package com.common.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("bills")
public class BillMgrController extends BaseController{

    @RequestMapping(value = "history",method = RequestMethod.GET)
    public ModelAndView history_list(ModelAndView modelAndView){
        modelAndView.setViewName("/bills/history_list");
        return modelAndView;
    }

    @RequestMapping(value = "income",method = RequestMethod.GET)
    public ModelAndView income_list(ModelAndView modelAndView){
        modelAndView.setViewName("/bills/income_list");
        return modelAndView;
    }

    @RequestMapping(value = "outcome",method = RequestMethod.GET)
    public ModelAndView outcome_list(ModelAndView modelAndView){
        modelAndView.setViewName("/bills/outcome_list");
        return modelAndView;
    }
}
