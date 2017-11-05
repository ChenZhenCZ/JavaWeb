package com.cz.poi;

import com.cz.bean.Stutden;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.junit.Test;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ContacaWriter {

    @Test
    public void testReaderContaca(){
    creContacaReader("d:/a.xls");
    }

    public void creContacaReader(String path){
        HSSFWorkbook workbook =new HSSFWorkbook();
        HSSFSheet hssfSheet=workbook.createSheet("所有同学的通讯录");
        createTitleRow(workbook,hssfSheet);
        createHraRow(workbook,hssfSheet);
        List<Stutden> stutdenList=new ArrayList<Stutden>();
        stutdenList.add(new Stutden(1,"李四","男","1548547898"));
        stutdenList.add(new Stutden(2,"李四1","男","1548547898"));
        stutdenList.add(new Stutden(3,"李四2","男","1548547898"));
        stutdenList.add(new Stutden(4,"李四3","男","1548547898"));
        createStuden(workbook,hssfSheet,stutdenList);
        try {
            workbook.write(new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void createTitleRow(HSSFWorkbook workbook,HSSFSheet sheet){
        HSSFRow  hssfRow = sheet.createRow(0);
        HSSFCell titleCell= hssfRow.createCell(0);
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,4));
        titleCell.setCellStyle(createTitleCellStyle(workbook));//设置属性
        titleCell.setCellValue("同学通讯录");
    }

    private CellStyle createTitleCellStyle(Workbook workbook) {
        CellStyle titleStyle = workbook.createCellStyle();//创建列
        titleStyle.setAlignment(HorizontalAlignment.CENTER);//集中
        Font titleFont = workbook.createFont();//设置字体属性
        titleFont.setBold(true);//加粗
        titleFont.setItalic(true);//斜体
        titleFont.setFontHeight((short) 280);//字体高度
        titleStyle.setFont(titleFont);
        return titleStyle;
    }

    public void createHraRow(HSSFWorkbook workbook,HSSFSheet sheet){
        HSSFRow harfRow= sheet.createRow(1);
        HSSFCell noCell=harfRow.createCell(0);
        noCell.setCellStyle(createTitleCellStyle(workbook));
        noCell.setCellValue("编号");
        HSSFCell nameCell=harfRow.createCell(1);
        nameCell.setCellStyle(createTitleCellStyle(workbook));
        nameCell.setCellValue("姓名");
        HSSFCell gerderCell=harfRow.createCell(2);
        gerderCell.setCellStyle(createTitleCellStyle(workbook));
        gerderCell.setCellValue("性别");
        HSSFCell phoneCell=harfRow.createCell(3);
        phoneCell.setCellStyle(createTitleCellStyle(workbook));
        phoneCell.setCellValue("手机号");

    }

    public void createStuden(HSSFWorkbook workbook,HSSFSheet sheet,List<Stutden> stutdenList){
        int i=2;
        for(Stutden stutden:stutdenList){
            HSSFRow studRow=sheet.createRow(i);
            studRow.setHeight((short)600);
            for (int j=0;j<=3;j++){
               HSSFCell cell= studRow.createCell(j);
               if (j==0){
                    cell.setCellValue(stutden.getNo());
               }else  if (j==1){
                    cell.setCellValue(stutden.getName());
               }else  if (j==2){
                    cell.setCellValue(stutden.getGender());
               }else  if (j==3){
                    cell.setCellValue(stutden.getPhone());
               }
            }
            HSSFPatriarch patriarch =  (HSSFPatriarch) sheet.createDrawingPatriarch(); // 创建图片的绘制对象
            HSSFPicture picture = patriarch.createPicture(
                    // 第一个参数：左顶点的距离
                    // 第二个参数：左顶点的y
                    // 第三个参数：宽
                    // 第四个参数：高
                    // 第5个参数：图片左边开始于哪个列
                    // 第6个参数：图片上边开始于哪个行
                    // 第7个参数：图片右边结束列
                    // 第8个参数 图片下边结束行
                    new HSSFClientAnchor(0, 0, 100, 100, (short) 4, i, (short) 5, i + 1),
                    workbook.addPicture(getImageData("src/main/resources/9536.jpg"), Workbook.PICTURE_TYPE_PNG));
            picture.resize();
            i++;
        }

    }

    //图片导出
    private byte[] getImageData(String imagePath) {
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream(); // 字节输出流
            BufferedImage image = ImageIO.read(new FileInputStream(new File(imagePath))); // ImageIO是专门处理图片的io流
            ImageIO.write(image, "jpg", baos); // 把指定图片写出到字节输出流
            return baos.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}