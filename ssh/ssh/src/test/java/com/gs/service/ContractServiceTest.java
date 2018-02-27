package com.gs.service;

import com.gs.bean.Clazz;
import com.gs.bean.Contract;
import com.gs.bean.Stu;
import com.gs.bean.StuDetail;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2017/11/22.
 */
public class ContractServiceTest extends BaseTest {

    @Autowired
    private ContractService contractService;

    @Test
    public void testSave() {
        Contract contract = new Contract();
        contract.setPhone("13666666666");
        contract.setRealName("张三他妈");
        Set<Stu> stuSet = new HashSet<>();
        Stu stu = new Stu();
        stu.setId(1L);
        stuSet.add(stu);
        Stu stu1 = new Stu();
        stu1.setId(3L);
        stuSet.add(stu1);
        contract.setStuSet(stuSet);
        contractService.save(contract);
    }

}
