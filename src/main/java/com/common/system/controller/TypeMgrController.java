package com.common.system.controller;


import com.common.system.entity.DealType;
import com.common.system.entity.RcUser;
import com.common.system.service.DealTypeService;
import com.common.system.util.PageBean;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "type")
public class TypeMgrController extends BaseController {

    private final DealTypeService service;

    @Autowired
    public TypeMgrController(DealTypeService service) {
        this.service = service;
    }

    @RequestMapping(value = "in", method = RequestMethod.GET)
    public ModelAndView day(ModelAndView modelAndView) {
        modelAndView.setViewName("/type/in/list");
        return modelAndView;
    }


    @ResponseBody
    @RequestMapping(value = "page")
    public PageBean<DealType> queryForPage(@RequestParam(value = "start", defaultValue = "1") int start,
                                         @RequestParam(value = "length", defaultValue = "10") int pageSize,
                                           @RequestParam(value = "inOrOut", defaultValue = "0") int inOrOut) {
        PageInfo<DealType> pageInfo = service.listForPage((start / pageSize) + 1, pageSize,inOrOut);
        return new PageBean<>(pageInfo);
    }

    @RequestMapping(value = "out", method = RequestMethod.GET)
    public ModelAndView month(ModelAndView modelAndView) {
        modelAndView.setViewName("/type/out/list");
        return modelAndView;
    }


}
