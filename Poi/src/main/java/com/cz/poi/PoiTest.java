package com.cz.poi;

import org.apache.poi.hssf.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class PoiTest {
    public static void main(String[] arge){
        try {
            HSSFWorkbook workbook =new HSSFWorkbook(new FileInputStream(
                    new File("src/main/resources/poi_1.xls")));

           HSSFSheet sheet= workbook.getSheet("Sheet1");
           HSSFRow row=sheet.getRow(0);
           HSSFCell cell=row.getCell(0);
            System.out.println(cell.getStringCellValue());
            HSSFCellStyle cellStyle = cell.getCellStyle();//列
            System.out.println(cellStyle.getDataFormat());
            HSSFFont cellFont = cellStyle.getFont(workbook);//取得字体
            System.out.println(cellFont.getFontName());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
