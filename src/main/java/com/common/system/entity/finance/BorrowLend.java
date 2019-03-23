package com.common.system.entity.finance;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 借入借出
 */
public class BorrowLend {
    private int id;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date borrowLendTime;

    private String money;

    private String note;

    private String borrowUser;

    private String lendUser;

    private int status;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getBorrowLendTime() {
        return borrowLendTime;
    }

    public void setBorrowLendTime(Date borrowLendTime) {
        this.borrowLendTime = borrowLendTime;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getBorrowUser() {
        return borrowUser;
    }

    public void setBorrowUser(String borrowUser) {
        this.borrowUser = borrowUser;
    }

    public String getLendUser() {
        return lendUser;
    }

    public void setLendUser(String lendUser) {
        this.lendUser = lendUser;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
