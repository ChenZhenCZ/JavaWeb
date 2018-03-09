package com.cz.csv;

import com.cz.bean.Contract;
import com.cz.bean.Contract1;
import com.opencsv.CSVReader;
import com.opencsv.bean.ColumnPositionMappingStrategy;
import com.opencsv.bean.CsvToBean;
import com.opencsv.bean.CsvToBeanBuilder;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OpencsvTest {

    public static void main(String[] ager ) throws IOException {
        // 读取数据到字符串数组中
        CSVReader reader = new CSVReader(new FileReader("src/main/resources/contract.csv"));
        String [] contract;
        while ((contract = reader.readNext()) != null) {
            System.out.println(contract[0] + ", " + contract[1] + ", etc...");
        }
        // 读取数据到字符串数组中
        CSVReader reader1 =new CSVReader(new FileReader("src/main/resources/contract.csv"));
        List<String[]> contractList=reader1.readAll();
        for (String[] contract1:contractList){
            System.out.println(contract1[0] + ", " + contract1[1] + ",11 etc...");
        }

        // 读取到JavaBean， @CsvBindByName
        List<Contract> contractList1 = new CsvToBeanBuilder(
                                       new FileReader("src/main/resources/contract.csv"))
                                       .withType(Contract.class).build().parse();
        if (contractList1 != null && contractList1.size() > 0) {
            for (Contract contract1 : contractList1) {
                System.out.println(contract1);
            }
        }

        // 读取到JavaBean， @CsvBindByPosition
        List<Contract1> contractList2 = new CsvToBeanBuilder(new FileReader("src/main/resources/contract1.csv"))
                .withType(Contract1.class).build().parse();
        if (contractList2 != null && contractList2.size() > 0) {
            for (Contract1 contract1 : contractList2) {
                System.out.println(contract1);
            }
        }

        // 非注解读取到JavaBean中
        ColumnPositionMappingStrategy strategy = new ColumnPositionMappingStrategy();
        strategy.setType(Contract.class);
        // 配置与JavaBean中一致的列名
        String[] columns = new String[] {"id", "contract_name", "phone", "company", "address"};
        strategy.setColumnMapping(columns);
        CsvToBean csv = new CsvToBean();
        List<Contract> list = csv.parse(strategy, new FileReader("src/main/resources/contract.csv"));
        for (Contract contract1 : list) {
            System.out.println(contract1);
        }

    }
}
