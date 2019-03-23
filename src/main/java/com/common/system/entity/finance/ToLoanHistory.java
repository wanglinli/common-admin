package com.common.system.entity.finance;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 还贷记录
 */
public class ToLoanHistory {

    /**
     * id
     */
    private String id;

    /**
     * 借贷项目
     */
    private String toLoan;

    /**
     * 还款金额
     */
    private String returnMoney;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 还款时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date returnTime;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getToLoan() {
        return toLoan;
    }

    public void setToLoan(String toLoan) {
        this.toLoan = toLoan;
    }

    public String getReturnMoney() {
        return returnMoney;
    }

    public void setReturnMoney(String returnMoney) {
        this.returnMoney = returnMoney;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }
}
