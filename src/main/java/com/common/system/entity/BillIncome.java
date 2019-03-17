package com.common.system.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

@TableName("common_income")
public class BillIncome extends Model<BillIncome> implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value="id", type= IdType.AUTO)
    private Integer id;
    @Excel(name="收入时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date incomeTime;
    @Excel(name="收入金额")
    private String incomeMoney;
    @Excel(name="收款方式")
    private String incomeType;
    @Excel(name="收入人")
    private String incomeUser;
    @Excel(name="收入说明")
    private String incomeNote;
    @Excel(name="创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public Integer getId() {
        return id;
    }

    public Date getIncomeTime() {
        return incomeTime;
    }

    public String getIncomeMoney() {
        return incomeMoney;
    }

    public String getIncomeType() {
        return incomeType;
    }

    public String getIncomeUser() {
        return incomeUser;
    }

    public String getIncomeNote() {
        return incomeNote;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setIncomeTime(Date incomeTime) {
        this.incomeTime = incomeTime;
    }

    public void setIncomeMoney(String incomeMoney) {
        this.incomeMoney = incomeMoney;
    }

    public void setIncomeType(String incomeType) {
        this.incomeType = incomeType;
    }

    public void setIncomeUser(String incomeUser) {
        this.incomeUser = incomeUser;
    }

    public void setIncomeNote(String incomeNote) {
        this.incomeNote = incomeNote;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
