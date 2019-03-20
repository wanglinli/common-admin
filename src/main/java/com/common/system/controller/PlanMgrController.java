package com.common.system.controller;


import com.common.system.entity.finance.Remind;
import com.common.system.entity.finance.ToLoan;
import com.common.system.service.RemindService;
import com.common.system.service.ToLoanService;
import com.common.system.shiro.ShiroUser;
import com.common.system.util.PageBean;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "plan")
public class PlanMgrController extends BaseController {


    private final RemindService remindService;

    private final ToLoanService toLoanService;

    @Autowired
    public PlanMgrController(RemindService remindService, ToLoanService toLoanService) {
        this.remindService = remindService;
        this.toLoanService = toLoanService;
    }

    @RequestMapping(value = "remind", method = RequestMethod.GET)
    public ModelAndView day(ModelAndView modelAndView) {
        modelAndView.setViewName("/plan/remind/list");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "remind/page")
    public PageBean<Remind> queryForPage(@RequestParam(value = "start", defaultValue = "1") int start,
                                         @RequestParam(value = "length", defaultValue = "10") int pageSize, HttpSession session) {
        ShiroUser user = getShiroUser(session);
        PageInfo<Remind> pageInfo = remindService.listForPage((start / pageSize) + 1, pageSize,user.getUsername());
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



    @RequestMapping(value = "toloan", method = RequestMethod.GET)
    public ModelAndView year(ModelAndView modelAndView) {
        modelAndView.setViewName("/plan/toloan/list");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "toloan/page")
    public PageBean<ToLoan> queryForPageToLoan(@RequestParam(value = "start", defaultValue = "1") int start,
                                         @RequestParam(value = "length", defaultValue = "10") int pageSize,
                                         HttpSession session) {
        ShiroUser user = getShiroUser(session);
        PageInfo<ToLoan> pageInfo = toLoanService.listForPage((start / pageSize) + 1, pageSize,user.getUsername());
        return new PageBean<>(pageInfo);
    }

    @RequestMapping(value = "toloan/add", method = RequestMethod.GET)
    public ModelAndView addToLoan(ModelAndView modelAndView) {
        modelAndView.setViewName("/plan/toloan/add_view");
        return modelAndView;
    }

    @RequestMapping(value = "toloan/edit/{id}",method = RequestMethod.GET)
    public ModelAndView editToLoan(ModelAndView modelAndView,@PathVariable Integer id){
        Result<ToLoan> result = toLoanService.selectById(id);
        modelAndView.addObject("toLoan",result.getData());
        modelAndView.setViewName("/plan/toloan/edit");
        return modelAndView;
    }


    @RequestMapping(value = "toloan/save")
    public @ResponseBody
    Result saveToLoan(String startTime,String life, String interest,String money,String toLoan,HttpSession session){
        ToLoan obj = new ToLoan();
        SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ShiroUser user = getShiroUser(session);
        try {
            obj.setStartTime(sDateFormat.parse(startTime));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        obj.setToLoan(toLoan);
        obj.setInterest(interest);
        obj.setMoney(money);
        obj.setLife(life);
        obj.setAlreadyRepaid("0");
        obj.setSurplus(String.valueOf(Long.parseLong(money) + Long.parseLong(interest)));
        obj.setCreateTime(new Date());
        obj.setUser(user.getUsername());
        return toLoanService.save(obj);
    }

    @RequestMapping(value = "toloan/update")
    public @ResponseBody
    Result updateToLoan(String id,String startTime,String life, String interest,String money,String toLoan,String alreadyRepaid){
        ToLoan obj = toLoanService.selectById(Integer.parseInt(id)).getData();
        SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            obj.setStartTime(sDateFormat.parse(startTime));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        obj.setMoney(money);
        obj.setLife(life);
        if ((new Double(obj.getMoney())+ new Double(obj.getInterest()))< new Double(alreadyRepaid)){
            obj.setSurplus("0");
        }else {
            obj.setSurplus(String.valueOf(new Double(money) + new Double(interest) - new Double(alreadyRepaid)));
        }
        obj.setAlreadyRepaid(alreadyRepaid);
        obj.setToLoan(toLoan);
        obj.setInterest(interest);
        return toLoanService.update(obj);
    }

    @RequestMapping(value = "toloan/delete/{id}",method = RequestMethod.GET)
    public @ResponseBody
    Result deleteToLoan(@PathVariable Integer id){
        return toLoanService.deleteById(id);
    }

    private ShiroUser getShiroUser(HttpSession session) {
        return (ShiroUser) session.getAttribute("user");
    }


    @RequestMapping(value = "borrow", method = RequestMethod.GET)
    public ModelAndView month(ModelAndView modelAndView) {
        modelAndView.setViewName("/plan/borrow/list");
        return modelAndView;
    }



}
