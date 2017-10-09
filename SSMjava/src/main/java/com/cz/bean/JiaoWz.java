package com.cz.bean;

import java.util.Date;

public class JiaoWz {
    private  int id;
    private  UserWz userWz;
    private  DaoWz  daoWz;
    private Date jiaoTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserWz getUserWz() {
        return userWz;
    }

    public void setUserWz(UserWz userWz) {
        this.userWz = userWz;
    }

    public DaoWz getDaoWz() {
        return daoWz;
    }

    public void setDaoWz(DaoWz daoWz) {
        this.daoWz = daoWz;
    }

    public Date getJiaoTime() {
        return jiaoTime;
    }

    public void setJiaoTime(Date jiaoTime) {
        this.jiaoTime = jiaoTime;
    }
}
