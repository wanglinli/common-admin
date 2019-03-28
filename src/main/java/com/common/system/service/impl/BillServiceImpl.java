package com.common.system.service.impl;

import com.common.system.entity.finance.Bill;
import com.common.system.entity.finance.count.WeekData;
import com.common.system.mapper.BillMapper;
import com.common.system.service.BillService;
import com.common.system.util.Result;
import com.common.system.util.SafeDouble;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class BillServiceImpl implements BillService {

    @Resource
    private BillMapper mapper;

    @Override
    public PageInfo<Bill> listForPage(Integer pageNum, Integer pageSize,Bill bill) {
        if (pageNum != null && pageSize != null){
            PageHelper.startPage(pageNum,pageSize);
        }
        List<Bill> roleList = mapper.getbillBill(bill);

        return new PageInfo<>(roleList);
    }

    @Override
    public PageInfo<Bill> queryAll() {
        List<Bill> roleList = mapper.queryAll();
        return new PageInfo<>(roleList);
    }


    @Override
    public Result<Integer> deleteById(Integer id) {
        Result<Integer> result = new Result<Integer>();
        int res =  mapper.delete(id);
        getIntegerResult(result,res);
        return result;
    }

    @Override
    public Result<Bill> selectById(Integer id) {
        Result<Bill> result = new Result<Bill>();
        Bill bill =  mapper.getByID(id);
        if(bill!=null){
            result.setStatus(true);
            result.setCode(0);
            result.setMsg("SUCCESS!");
            result.setData(bill);
        }
        return result;
    }


    @Override
    public Result<Integer> save(Bill bill) {
        int res = mapper.save(bill);
        return getIntegerResult(new Result<Integer>(),res);
    }

    @Override
    public Result<Integer> update(Bill type) {
        int res = mapper.update(type);
        return getIntegerResult(new Result<Integer>(),res);
    }

    @Override
    public String getDataByParamsIn(String param) {
        List<Bill> list = mapper.getDataByParam(param+"%");
        double res = 0;
        for (Bill money:list) {
            if (1 == money.getBillFlag()){
                res = res + new SafeDouble().pi(money.getBillMoney());
            }
        }
        return String.valueOf(res);
    }

    @Override
    public String getDataByParamsOut(String param) {
        List<Bill> list = mapper.getDataByParam(param+"%");
        double res = 0;
        for (Bill money:list) {
            if (0 == money.getBillFlag()){
                SafeDouble safeDouble = new SafeDouble();
                res = res + safeDouble.pi(money.getBillMoney());
            }
        }
        return String.valueOf(res);
    }

    @Override
    public List getDataByType(String month,String[] types) {
        List<Bill> list = mapper.getDataByParam(month + "%");
        return getList(types, list);
    }

    @Override
    public List getDataByTypeWeek(String[] week, String[] types) {
        WeekData weekData = new WeekData();
        weekData.setOne(week[0] + "%");
        weekData.setTwo(week[1] + "%");
        weekData.setThree(week[2] + "%");
        weekData.setFour(week[3] + "%");
        weekData.setFive(week[4] + "%");
        weekData.setSix(week[5] + "%");
        weekData.setSeven(week[6] + "%");
        List<Bill> bills = mapper.getDataByTypeWeek(weekData);
//        bills.addAll(mapper.getDataByParam(week[1] + "%"));
//        bills.addAll(mapper.getDataByParam(week[2] + "%"));
//        bills.addAll(mapper.getDataByParam(week[3] + "%"));
//        bills.addAll(mapper.getDataByParam(week[4] + "%"));
//        bills.addAll(mapper.getDataByParam(week[5] + "%"));
//        bills.addAll(mapper.getDataByParam(week[6] + "%"));
        return getList(types, bills);
    }

    private List getList(String[] types, List<Bill> bills) {
        List<Double> result = new ArrayList<>();
        double res = 0;
        for (String type:types) {
            for (Bill money:bills) {
                if (type.equals(money.getBillNote())){
                    SafeDouble safeDouble = new SafeDouble();
                    res = res + safeDouble.pi(money.getBillMoney());
                }
            }
            result.add(res);
            res = 0;
        }
        return result;
    }

    @Override
    public PageInfo<Bill> queryByDate(Bill bill) {
        return new PageInfo<>(mapper.queryByDate(bill));
    }


    private Result<Integer> getIntegerResult(Result<Integer> result, int res) {
        if (res > 0){
            result.setData(res);
            result.setStatus(true);
            result.setCode(0);
            result.setMsg("成功!");
        }
        return result;
    }
}
