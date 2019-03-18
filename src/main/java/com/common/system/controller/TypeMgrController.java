package com.common.system.controller;


import com.common.system.entity.DealType;
import com.common.system.entity.RcUser;
import com.common.system.service.DealTypeService;
import com.common.system.util.Convert;
import com.common.system.util.PageBean;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "type")
public class TypeMgrController extends BaseController {

    private final DealTypeService service;

    @Autowired
    public TypeMgrController(DealTypeService service) {
        this.service = service;
    }

    @RequestMapping(value = "in", method = RequestMethod.GET)
    public ModelAndView in(ModelAndView modelAndView) {
        modelAndView.setViewName("/type/in/list");
        return modelAndView;
    }

    @RequestMapping(value = "out", method = RequestMethod.GET)
    public ModelAndView month(ModelAndView modelAndView) {
        modelAndView.setViewName("/type/out/list");
        return modelAndView;
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public ModelAndView add(ModelAndView modelAndView) {
        modelAndView.setViewName("/type/add");
        return modelAndView;
    }

    @RequestMapping(value = "edit/{id}",method = RequestMethod.GET)
    public ModelAndView edit(ModelAndView modelAndView,@PathVariable Integer id){
        Result<DealType> result = service.selectById(id);
        modelAndView.addObject("type",result.getData());
        modelAndView.setViewName("/type/edit");
        return modelAndView;
    }


    @RequestMapping(value = "view/{id}", method = RequestMethod.GET)
    public ModelAndView view(@PathVariable Integer id, ModelAndView modelAndView) {
        Result<DealType> result = service.selectById(id);
        modelAndView.addObject("bean", result.getData());
        modelAndView.setViewName("/type/view");
        return modelAndView;
    }

    @RequestMapping(value = "save")
    public @ResponseBody
    Result save(String id,String type, String note,String inOrOut){
        DealType dealType = getDealType(id,type, note, Integer.valueOf(inOrOut));
        return service.save(dealType);
    }

    @RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
    public @ResponseBody
    Result delete(@PathVariable Integer id){
        return service.deleteById(id);
    }

    @RequestMapping(value = "update")
    public @ResponseBody
    Result update(String id,String type, String note,int inOrOut){
        DealType dealType = getDealType(id,type, note, inOrOut);
        return service.update(dealType);
    }



    private DealType getDealType(String id,String type, String note, int inOrOut) {
        DealType dealType = new DealType();
        dealType.setId(id);
        dealType.setNote(note);
        dealType.setType(type);
        dealType.setInOrOut(inOrOut);
        dealType.setCreateTime(new Date());
        return dealType;
    }


    @ResponseBody
    @RequestMapping(value = "page")
    public PageBean<DealType> queryForPage(@RequestParam(value = "start", defaultValue = "1") int start,
                                         @RequestParam(value = "length", defaultValue = "10") int pageSize,
                                           @RequestParam(value = "inOrOut") int inOrOut) {
        PageInfo<DealType> pageInfo = service.listForPage((start / pageSize) + 1, pageSize,inOrOut);
        return new PageBean<>(pageInfo);
    }




}
