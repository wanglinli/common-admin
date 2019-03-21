package com.common.system.controller;

import cn.afterturn.easypoi.entity.vo.NormalExcelConstants;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.afterturn.easypoi.view.PoiBaseView;
import com.common.system.entity.finance.Bill;
import com.common.system.service.BillService;
import com.common.system.service.DealTypeService;
import com.common.system.shiro.ShiroUser;
import com.common.system.util.PageBean;
import com.common.system.util.Result;
import com.github.pagehelper.PageInfo;
import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("bills")
public class BillMgrController extends BaseController{
    @Autowired
    private BillService billService;

    @Autowired
    private DealTypeService dealTypeService;

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
    public PageBean<Bill> queryForPage(@RequestParam(value = "start", defaultValue = "1") int start,
                                       @RequestParam(value = "length", defaultValue = "10") int pageSize,
                                       @RequestParam(value = "billFlag", defaultValue = "10") int billFlag,HttpSession session) {
        ShiroUser shiroUser = (ShiroUser) session.getAttribute("user");
        Bill bill = new Bill();
        bill.setBillUser(shiroUser.getUsername());
        bill.setBillFlag(billFlag);
        PageInfo<Bill> pageInfo;
        if (billFlag == 0 || billFlag ==1){
            pageInfo = billService.listForPage((start / pageSize) + 1, pageSize,bill);
        }else {
            pageInfo = billService.queryAll();
        }
        return new PageBean<>(pageInfo);
    }


    @RequestMapping(value = "exportExcel", method = RequestMethod.GET)
    public void exportExcel(ModelMap modelMap, HttpServletRequest request,
                            HttpServletResponse response) {
        PageInfo<Bill> result = billService.queryAll();
        ExportParams params = new ExportParams("支出信息", null, ExcelType.XSSF);
        modelMap.put(NormalExcelConstants.DATA_LIST, result.getList());
        modelMap.put(NormalExcelConstants.CLASS, Bill.class);
        modelMap.put(NormalExcelConstants.PARAMS, params);
        String fileName = DateUtil.format(new Date(), DateUtil.NORM_DATETIME_PATTERN);
        modelMap.put(NormalExcelConstants.FILE_NAME, "支出信息表:" + fileName);
        PoiBaseView.render(modelMap, request, response, NormalExcelConstants.EASYPOI_EXCEL_VIEW);
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id, ModelAndView modelAndView, HttpSession session) {
        String idStr = id.split("-")[0];
        String flag = id.split("-")[1];
        Result<Bill> result = billService.selectById(Integer.parseInt(idStr));
        ShiroUser user = (ShiroUser) session.getAttribute("user");
        modelAndView.addObject("bean", result.getData());
        if ("in".equals(flag)){
            modelAndView.addObject("type", dealTypeService.queryAllByUser(user.getUsername(),0));
        }else {
            modelAndView.addObject("type", dealTypeService.queryAllByUser(user.getUsername(),1));
        }
        modelAndView.setViewName("/bills/edit");
        return modelAndView;
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Result update(Integer id, String billTime, String billMoney, String billType, String billNote) {
        Bill bill = new Bill();
        bill.setId(id);
        bill.setBillMoney(billMoney);
        bill.setBillNote(billNote);
        bill.setBillType(billType);
        try {
            bill.setBillTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(billTime));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        bill.setCreateTime(new Date());
        return  billService.update(bill);
    }


    @RequestMapping(value = "add/{billFlag}", method = RequestMethod.GET)
    public ModelAndView add(@PathVariable String billFlag,ModelAndView modelAndView, HttpSession session) {
        ShiroUser user = (ShiroUser) session.getAttribute("user");
        if("in".equalsIgnoreCase(billFlag)){
            modelAndView.addObject("type", dealTypeService.queryAllByUser(user.getUsername(),0));
            modelAndView.addObject("inOrOut",1);
        } else {
            modelAndView.addObject("type", dealTypeService.queryAllByUser(user.getUsername(),1));
            modelAndView.addObject("inOrOut",0);
        }
        modelAndView.setViewName("/bills/add");
        return modelAndView;
    }


    @RequestMapping(value = "save")
    @ResponseBody
    public  Result save(String billTime, String billMoney, String billType, String billNote, String billFlag, HttpSession session){
        ShiroUser user = (ShiroUser) session.getAttribute("user");
        Bill bill  = getBill(billTime,billMoney,billType,billNote,user.getUsername(),billFlag);
        return billService.save(bill);
    }


    @RequestMapping(value = "view/{id}", method = RequestMethod.GET)
    public ModelAndView view(@PathVariable String id, ModelAndView modelAndView){
        Result<Bill> result =   billService.selectById(Integer.parseInt(id));
        modelAndView.addObject("bean",result.getData());
        modelAndView.setViewName("/bills/view");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping(value = "delete/{id}")
    public Result<Integer> delteByID(@PathVariable String id){
        return billService.deleteById(Integer.parseInt(id));
    }

    public  static Bill  getBill(String billTime,String billMoney, String billType, String billNote, String userName,String billFlag){
        Bill bill = new Bill();
        if(!StringUtils.isEmpty(billTime)){
            try {
                bill.setBillTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(billTime));
            } catch (ParseException e) {
                e.printStackTrace();
                }
        }

        if(!StringUtils.isEmpty(billMoney)) bill.setBillMoney(billMoney);
        if(!StringUtils.isEmpty(billType)) bill.setBillType(billType);
        if (!StringUtils.isEmpty(billNote)) bill.setBillNote(billNote);
        if(!StringUtils.isEmpty(userName)) bill.setBillUser(userName);
        if(!StringUtils.isEmpty(billFlag)) bill.setBillFlag(Integer.parseInt(billFlag));
        bill.setCreateTime(new Date());
        return bill;
    }


}
