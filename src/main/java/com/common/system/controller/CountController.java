package com.common.system.controller;

import com.common.system.entity.finance.Bill;
import com.common.system.entity.finance.DealType;
import com.common.system.entity.finance.count.MonthData;
import com.common.system.service.BillService;
import com.common.system.service.DealTypeService;
import com.common.system.shiro.ShiroUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("analysis")
public class CountController  extends BaseController{

    private final BillService billService;

    private final DealTypeService typeService;

    @Autowired
    public CountController(BillService billService, DealTypeService typeService) {
        this.billService = billService;
        this.typeService = typeService;
    }


    @RequestMapping(value = "yearAndMonthIn", method = RequestMethod.POST)
    @ResponseBody
    public MonthData getYearAndMonthDataIn(@RequestParam(value = "year") String year){
        MonthData monthData = new MonthData();
        monthData.setOne(billService.getDataByMonthAndYearIn(year+"-01"));
        monthData.setTwo(billService.getDataByMonthAndYearIn(year+"-02"));
        monthData.setThree(billService.getDataByMonthAndYearIn(year+"-03"));
        monthData.setFour(billService.getDataByMonthAndYearIn(year+"-04"));
        monthData.setFive(billService.getDataByMonthAndYearIn(year+"-05"));
        monthData.setSix(billService.getDataByMonthAndYearIn(year+"-06"));
        monthData.setSeven(billService.getDataByMonthAndYearIn(year+"-07"));
        monthData.setEight(billService.getDataByMonthAndYearIn(year+"-08"));
        monthData.setNine(billService.getDataByMonthAndYearIn(year+"-09"));
        monthData.setTen(billService.getDataByMonthAndYearIn(year+"-10"));
        monthData.setEleven(billService.getDataByMonthAndYearIn(year+"-11"));
        monthData.setTwelve(billService.getDataByMonthAndYearIn(year+"-12"));
        return monthData;
    }

    @RequestMapping(value = "yearAndMonthOut", method = RequestMethod.POST)
    @ResponseBody
    public MonthData getYearAndMonthDataOut(@RequestParam(value = "year") String year){
        MonthData monthData = new MonthData();
        monthData.setOne(billService.getDataByMonthAndYearOut(year+"-01"));
        monthData.setTwo(billService.getDataByMonthAndYearOut(year+"-02"));
        monthData.setThree(billService.getDataByMonthAndYearOut(year+"-03"));
        monthData.setFour(billService.getDataByMonthAndYearOut(year+"-04"));
        monthData.setFive(billService.getDataByMonthAndYearOut(year+"-05"));
        monthData.setSix(billService.getDataByMonthAndYearOut(year+"-06"));
        monthData.setSeven(billService.getDataByMonthAndYearOut(year+"-07"));
        monthData.setEight(billService.getDataByMonthAndYearOut(year+"-08"));
        monthData.setNine(billService.getDataByMonthAndYearOut(year+"-09"));
        monthData.setTen(billService.getDataByMonthAndYearOut(year+"-10"));
        monthData.setEleven(billService.getDataByMonthAndYearOut(year+"-11"));
        monthData.setTwelve(billService.getDataByMonthAndYearOut(year+"-12"));
        return monthData;
    }

    @RequestMapping(value = "types", method = RequestMethod.POST)
    @ResponseBody
    public List getTypeAll(HttpSession session){
        ShiroUser user = (ShiroUser) session.getAttribute("user");
        List<DealType> types_in =  typeService.queryAllByUser(user.getUsername(),0);
        List<DealType> types_out =  typeService.queryAllByUser(user.getUsername(),1);
        List<DealType> types = new ArrayList<>();
        types.addAll(types_in);
        types.addAll(types_out);
        return types;
    }




    @RequestMapping(value = "count",method = RequestMethod.GET)
    public ModelAndView history_list(ModelAndView modelAndView){
        modelAndView.setViewName("/analysis/count");
        return modelAndView;
    }
}
