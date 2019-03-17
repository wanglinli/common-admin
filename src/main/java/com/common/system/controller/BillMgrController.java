package com.common.system.controller;

import com.common.system.entity.BillIncome;
import com.common.system.entity.RcUser;
import com.common.system.service.BillService;
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
@RequestMapping("bills")
public class BillMgrController extends BaseController{
    @Autowired
    private BillService billService;

    /**
     * 历史账单查询
     * @param modelAndView
     * @return
     */
    @RequestMapping(value = "history",method = RequestMethod.GET)
    public ModelAndView history_list(ModelAndView modelAndView){
        modelAndView.setViewName("/bills/history_list");
        return modelAndView;
    }

    /**
     * 收入列表
     * @param modelAndView
     * @return
     */
    @RequestMapping(value = "income",method = RequestMethod.GET)
    public ModelAndView income_list(ModelAndView modelAndView){
        modelAndView.setViewName("/bills/income_list");
        return modelAndView;
    }

    /**
     * 支出列表
     * @param modelAndView
     * @return
     */
    @RequestMapping(value = "outcome",method = RequestMethod.GET)
    public ModelAndView outcome_list(ModelAndView modelAndView){
        modelAndView.setViewName("/bills/outcome_list");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "page")
    public PageBean<BillIncome> queryForPage(@RequestParam(value = "start", defaultValue = "1") int start,
                                         @RequestParam(value = "length", defaultValue = "10") int pageSize) {
            PageInfo<BillIncome> pageInfo = billService.listForPage((start / pageSize) + 1, pageSize);
        return new PageBean<BillIncome>(pageInfo);
    }
}
