package com.common.system.controller;

import com.common.system.entity.finance.Bill;
import com.common.system.entity.finance.DealType;
import com.common.system.entity.finance.count.MonthData;
import com.common.system.entity.finance.count.WeekData;
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
        monthData.setOne(billService.getDataByParamsIn(year+"-01"));
        monthData.setTwo(billService.getDataByParamsIn(year+"-02"));
        monthData.setThree(billService.getDataByParamsIn(year+"-03"));
        monthData.setFour(billService.getDataByParamsIn(year+"-04"));
        monthData.setFive(billService.getDataByParamsIn(year+"-05"));
        monthData.setSix(billService.getDataByParamsIn(year+"-06"));
        monthData.setSeven(billService.getDataByParamsIn(year+"-07"));
        monthData.setEight(billService.getDataByParamsIn(year+"-08"));
        monthData.setNine(billService.getDataByParamsIn(year+"-09"));
        monthData.setTen(billService.getDataByParamsIn(year+"-10"));
        monthData.setEleven(billService.getDataByParamsIn(year+"-11"));
        monthData.setTwelve(billService.getDataByParamsIn(year+"-12"));
        return monthData;
    }


    @RequestMapping(value = "weekIn", method = RequestMethod.POST)
    @ResponseBody
    public WeekData getWeekDataIn(@RequestParam(value = "week") String week){
        WeekData weekData = new WeekData();
        String[] data = week.split(",");
        weekData.setOne(billService.getDataByParamsIn(data[0]) +" ");
        weekData.setTwo(billService.getDataByParamsIn(data[1]) +" ");
        weekData.setThree(billService.getDataByParamsIn(data[2]) +" ");
        weekData.setFour(billService.getDataByParamsIn(data[3]) +" ");
        weekData.setFive(billService.getDataByParamsIn(data[4]) +" ");
        weekData.setSix(billService.getDataByParamsIn(data[5]) +" ");
        weekData.setSeven(billService.getDataByParamsIn(data[6]) +" ");

        return weekData;
    }

    @RequestMapping(value = "weekOut", method = RequestMethod.POST)
    @ResponseBody
    public WeekData getWeekDataOut(@RequestParam(value = "week") String week){
        WeekData weekData = new WeekData();
        String[] data = week.split(",");
        weekData.setOne(billService.getDataByParamsOut(data[0]) +" ");
        weekData.setTwo(billService.getDataByParamsOut(data[1]) +" ");
        weekData.setThree(billService.getDataByParamsOut(data[2]) +" ");
        weekData.setFour(billService.getDataByParamsOut(data[3]) +" ");
        weekData.setFive(billService.getDataByParamsOut(data[4]) +" ");
        weekData.setSix(billService.getDataByParamsOut(data[5]) +" ");
        weekData.setSeven(billService.getDataByParamsOut(data[6]) +" ");
        return weekData;
    }

    @RequestMapping(value = "yearAndMonthOut", method = RequestMethod.POST)
    @ResponseBody
    public MonthData getYearAndMonthDataOut(@RequestParam(value = "year") String year){
        MonthData monthData = new MonthData();
        monthData.setOne(billService.getDataByParamsOut(year+"-01"));
        monthData.setTwo(billService.getDataByParamsOut(year+"-02"));
        monthData.setThree(billService.getDataByParamsOut(year+"-03"));
        monthData.setFour(billService.getDataByParamsOut(year+"-04"));
        monthData.setFive(billService.getDataByParamsOut(year+"-05"));
        monthData.setSix(billService.getDataByParamsOut(year+"-06"));
        monthData.setSeven(billService.getDataByParamsOut(year+"-07"));
        monthData.setEight(billService.getDataByParamsOut(year+"-08"));
        monthData.setNine(billService.getDataByParamsOut(year+"-09"));
        monthData.setTen(billService.getDataByParamsOut(year+"-10"));
        monthData.setEleven(billService.getDataByParamsOut(year+"-11"));
        monthData.setTwelve(billService.getDataByParamsOut(year+"-12"));
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
