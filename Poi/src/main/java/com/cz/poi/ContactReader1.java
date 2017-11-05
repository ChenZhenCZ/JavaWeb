package com.cz.poi;

import com.cz.bean.Stutden;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ContactReader1 {

    @Test
    public void testReaderContact(){
        String path="src/main/resources/poi_2.xls";
        List<Stutden> stutdenList=null;
        if(path.endsWith(".xls")){
            stutdenList= readerContact(path);
        }else  if(path.endsWith("xlsx")){
            stutdenList= readerxlsxContact(path);
        }

        for(Stutden stutden : stutdenList){
            System.out.println(stutden);
        }
    }

    public List<Stutden> readerContact(String xlspath){
        List<Stutden> StudenList=new ArrayList<Stutden>();
        try {
            HSSFWorkbook workbook=new HSSFWorkbook(new FileInputStream(new File(xlspath)));
            HSSFSheet sheet= workbook.getSheet("Sheet1");
            System.out.println(sheet.getLastRowNum());
            for (int row=2;row<=sheet.getLastRowNum();row++){
                HSSFRow hssfRow=sheet.getRow(row);
                Stutden stutden =new Stutden();
                for (int cell=0;cell<=hssfRow.getLastCellNum();cell++){
                    HSSFCell hssfCell=hssfRow.getCell(cell);
                    if (cell==0){
                        stutden.setNo((int)hssfCell.getNumericCellValue());
                    }else if (cell==1){
                        stutden.setName(hssfCell.getStringCellValue());
                    }else if (cell==2){
                        stutden.setGender(hssfCell.getStringCellValue());
                    }else if (cell==3){
                        stutden.setPhone(hssfCell.getStringCellValue());
                    }
                    StudenList.add(stutden);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return StudenList;
    }
    public List<Stutden> readerxlsxContact(String xlsxpath){
        List<Stutden> StudenList=new ArrayList<Stutden>();
        try {
            XSSFWorkbook workbook=new XSSFWorkbook(new FileInputStream(new File(xlsxpath)));
            XSSFSheet sheet= workbook.getSheet("Sheet1");
            System.out.println(sheet.getLastRowNum());
            for (int row=2;row<=sheet.getLastRowNum();row++){
                XSSFRow hssfRow=sheet.getRow(row);
                Stutden stutden =new Stutden();
                for (int cell=0;cell<=hssfRow.getLastCellNum();cell++){
                    XSSFCell hssfCell=hssfRow.getCell(cell);
                    if (cell==0){
                        stutden.setNo((int)hssfCell.getNumericCellValue());
                    }else if (cell==1){
                        stutden.setName(hssfCell.getStringCellValue());
                    }else if (cell==2){
                        stutden.setGender(hssfCell.getStringCellValue());
                    }else if (cell==3){
                        stutden.setPhone(hssfCell.getStringCellValue());
                    }
                    StudenList.add(stutden);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return StudenList;
    }
}
