package com.common.system.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

@TableName("common_bill")
public class Bill extends Model<Bill> implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value="id", type= IdType.AUTO)
    private Integer id;
    @Excel(name="交易时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date billTime;
    @Excel(name="交易金额")
    private String billMoney;
    @Excel(name="交易方式")
    private String billType;
    @Excel(name="交易人")
    private String billUser;
    @Excel(name="交易说明")
    private String billNote;
    /**
     * 支出还是收入 0出：１入
     */
    private int billFlag;
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

    public Date getBillTime() {
        return billTime;
    }

    public String getBillMoney() {
        return billMoney;
    }

    public String getBillType() {
        return billType;
    }

    public String getBillUser() {
        return billUser;
    }

    public String getBillNote() {
        return billNote;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setBillTime(Date billTime) {
        this.billTime = billTime;
    }

    public void setBillMoney(String billMoney) {
        this.billMoney = billMoney;
    }

    public void setBillType(String billType) {
        this.billType = billType;
    }

    public void setBillUser(String billUser) {
        this.billUser = billUser;
    }

    public void setBillNote(String billNote) {
        this.billNote = billNote;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getBillFlag() {
        return billFlag;
    }

    public void setBillFlag(int billFlag) {
        this.billFlag = billFlag;
    }
}
