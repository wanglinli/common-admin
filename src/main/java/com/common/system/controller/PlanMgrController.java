package com.common.system.controller;


import com.common.system.entity.Remind;
import com.common.system.service.RemindService;
import com.common.system.util.PageBean;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "plan")
public class PlanMgrController extends BaseController {


    private final RemindService remindService;

    @Autowired
    public PlanMgrController(RemindService remindService) {
        this.remindService = remindService;
    }

    @RequestMapping(value = "remind", method = RequestMethod.GET)
    public ModelAndView day(ModelAndView modelAndView) {
        modelAndView.setViewName("/plan/remind/list");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "remind/page")
    public PageBean<Remind> queryForPage(@RequestParam(value = "start", defaultValue = "1") int start,
                                         @RequestParam(value = "length", defaultValue = "10") int pageSize,
                                         @RequestParam(value = "user") String user) {
        PageInfo<Remind> pageInfo = remindService.listForPage((start / pageSize) + 1, pageSize,user);
        return new PageBean<>(pageInfo);
    }

    @RequestMapping(value = "remind/add", method = RequestMethod.GET)
    public ModelAndView add(ModelAndView modelAndView) {
        modelAndView.setViewName("/plan/remind/add_view");
        return modelAndView;
    }

    @RequestMapping(value = "remind/edit/{id}",method = RequestMethod.GET)
    public ModelAndView edit(ModelAndView modelAndView,@PathVariable Integer id){
        Result<Remind> result = remindService.selectById(id);
        modelAndView.addObject("remind",result.getData());
        modelAndView.setViewName("/plan/remind/edit");
        return modelAndView;
    }


    @RequestMapping(value = "remind/view/{id}", method = RequestMethod.GET)
    public ModelAndView view(@PathVariable Integer id, ModelAndView modelAndView) {
        Result<Remind> result = remindService.selectById(id);
        modelAndView.addObject("bean", result.getData());
        modelAndView.setViewName("/plan/remind/view");
        return modelAndView;
    }

    @RequestMapping(value = "remind/save")
    public @ResponseBody
    Result save(String time,String content, int status,String user){
        Remind remind = getRemind(null,time,content, status, user);
        return remindService.save(remind);
    }

    @RequestMapping(value = "remind/delete/{id}",method = RequestMethod.GET)
    public @ResponseBody
    Result delete(@PathVariable Integer id){
        return remindService.deleteById(id);
    }

    @RequestMapping(value = "remind/update")
    public @ResponseBody
    Result update(String id,String time,String content, int status,String user){
        Remind remind = getRemind(id,time,content, status, user);
        return remindService.update(remind);
    }



    private Remind getRemind(String id,String time,String content, int status,String user) {
        Remind remind = new Remind();
        remind.setContent(content);
        remind.setId(id);
        remind.setStatus(status);
        SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            remind.setTime(sDateFormat.parse(time));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        remind.setUser(user);
        return remind;
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
