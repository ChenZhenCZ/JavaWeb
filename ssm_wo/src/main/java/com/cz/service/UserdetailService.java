package com.cz.service;


import com.cz.bean.Userdetail;

public interface UserdetailService extends BaseService{
    Userdetail getById(Long id);
}
