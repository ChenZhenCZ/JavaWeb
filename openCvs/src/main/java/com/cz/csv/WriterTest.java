package com.cz.csv;

import com.cz.bean.Contract;
import com.opencsv.CSVWriter;
import com.opencsv.bean.StatefulBeanToCsv;
import com.opencsv.bean.StatefulBeanToCsvBuilder;
import com.opencsv.exceptions.CsvDataTypeMismatchException;
import com.opencsv.exceptions.CsvRequiredFieldEmptyException;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

public class WriterTest {

    public static void main(String[] args) throws IOException, CsvDataTypeMismatchException, CsvRequiredFieldEmptyException {
        // 从字符中数组写出到csv文件
        CSVWriter writer = new CSVWriter(new FileWriter("src/main/resources/stu.csv"), ',');
        String[][] stus = new String[][]{
                {"1", "stu1", "male"},
                {"2", "stu2", "female"},
        };
        for (String[] stu : stus) {
            writer.writeNext(stu);
        }
        writer.close();

        // 从bean的集合中写出到csv文件
        Writer writer1 = new FileWriter("src/main/resources/stu1.csv");
        StatefulBeanToCsv beanToCsv = new StatefulBeanToCsvBuilder(writer1).build();
        List<Contract> list = new ArrayList<>();
        list.add(new Contract("1", "as", "asss", "sasa", "address"));
        list.add(new Contract("2", "as", "asss", "sasa", "address"));
        beanToCsv.write(list);
        writer1.close();
    }

}
