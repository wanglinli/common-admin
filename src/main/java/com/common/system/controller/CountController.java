package com.common.system.controller;

import com.common.system.entity.finance.Bill;
import com.common.system.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("analysis")
public class CountController  extends BaseController{

    @Autowired
    private BillService billService;

    @RequestMapping(value = "money", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, List> countAll(){
        List<Integer> incomes = new ArrayList<Integer>();
        List<Integer> outcomes = new ArrayList<Integer>();
        Map<String,List>  map = new HashMap<String,List>();
        List<Bill>   bills =  billService.queryAll().getList();
        if (bills!=null && bills.size()>0){
            for (Bill  bill : bills){
                if(bill.getBillFlag()==1){
                    incomes.add(Integer.valueOf(bill.getBillMoney()));
                }else outcomes.add(Integer.valueOf(bill.getBillMoney()));
            }
            map.put("incomes",incomes);
            map.put("outcomes",outcomes);

        }
                return map;
    }


    @RequestMapping(value = "count",method = RequestMethod.GET)
    public ModelAndView history_list(ModelAndView modelAndView){
        modelAndView.setViewName("/analysis/count");
        return modelAndView;
    }
}
