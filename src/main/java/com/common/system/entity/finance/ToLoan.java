package com.common.system.entity.finance;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 借贷
 */
public class ToLoan {

    /**
     * id
     */
    private String id;

    /**
     * 接借贷项目
     */
    private String toLoan;

    /**
     * 金额
     */
    private String money;

    /**
     * 利息
     */
    private String interest;

    /**
     * 年限
     */
    private String life;

    /**
     * 已还金额
     */
    private String alreadyRepaid;

    /**
     * 剩余金额
     */
    private String surplus;

    /**
     * 用户
     */
    private String user;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 借贷时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

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

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    public String getLife() {
        return life;
    }

    public void setLife(String life) {
        this.life = life;
    }

    public String getAlreadyRepaid() {
        return alreadyRepaid;
    }

    public void setAlreadyRepaid(String alreadyRepaid) {
        this.alreadyRepaid = alreadyRepaid;
    }

    public String getSurplus() {
        return surplus;
    }

    public void setSurplus(String surplus) {
        this.surplus = surplus;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
}
