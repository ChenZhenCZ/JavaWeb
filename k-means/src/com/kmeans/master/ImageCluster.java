package com.kmeans.master;

import static com.kmeans.master.Constant.*;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;


public class ImageCluster {
    //主要功能就是读取一副图像，再对图像进行分割
    //需要分类的簇数
    private int k;
    //迭代次数
    private int m;
    //数据集合
    private DateElement[][] source;
    //中心集合
    private DateElement[] center;
    //统计每个簇的各项数据的总和，用于计算新的点数
    private DateElement[] centerSum;

    //读取指定目录的图片数据，并且写入数组，这个数据要继续处理
    private int[][] getImageData(String path) {
        BufferedImage bi = null;
        try {
            bi = ImageIO.read(new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        int width = bi.getWidth();
        int height = bi.getHeight();
        int[][] data = new int[width][height];
        for (int i = 0; i < width; i++)
            for (int j = 0; j < height; j++)
                data[i][j] = bi.getRGB(i, j);
        return data;
    }

    //用来处理获取的像素数据，提取我们需要的写入dataItem数组
    private DateElement[][] InitData(int[][] data) {
        DateElement[][] dateElements = new DateElement[data.length][data[0].length];
        for (int i = 0; i < data.length; i++) {
            for (int j = 0; j < data[0].length; j++) {
                DateElement di = new DateElement();
                Color c = new Color(data[i][j]);
                di.red = (double) c.getRed();
                di.green = (double) c.getGreen();
                di.blue = (double) c.getBlue();
                di.group = 1;
                dateElements[i][j] = di;
            }
        }
        return dateElements;
    }

    //生成随机的初始中心
    private void initCenters(int k) {
        center = new DateElement[k];
        centerSum = new DateElement[k];//用来统计每个聚类里面的RGB分别之和，方便计算均值
        int width, height;
        for (int i = 0; i < k; i++) {
            DateElement cent = new DateElement();
            DateElement cent2 = new DateElement();

            width = (int) (Math.random() * source.length);
            height = (int) (Math.random() * source[0].length);
            cent.group = i;
            cent.red = (double) source[width][height].red;
            cent.green = (double) source[width][height].green;
            cent.blue = (double) source[width][height].blue;
            center[i] = cent;


            cent2.red = cent.red;
            cent2.green = cent.green;
            cent2.blue = cent.blue;
            cent2.group = 0;
            centerSum[i] = cent2;

            width = 0;
            height = 0;
        }
        System.out.println("初始4个中心");
        for (int i = 0; i < center.length; i++) {
            System.out.println("(" + center[i].red + "," + center[i].green + "," + center[i].blue + ")");
        }
    }

    //计算两个像素之间的欧式距离，用RGB作为三维坐标
    private double distance(DateElement first, DateElement second) {
        double distance = 0;
        distance = Math.sqrt(Math.pow((first.red - second.red), 2) + Math.pow((first.green - second.green), 2) +
                Math.pow((first.blue - second.blue), 2));
        return distance;
    }

    //返回一个数组中最小的坐标
    private int minDistance(double[] distance) {
        double minDistance = distance[0];
        int minLocation = 0;
        for (int i = 0; i < distance.length; i++) {
            if (distance[i] < minDistance) {
                minDistance = distance[i];
                minLocation = i;
            } else if (distance[i] == minDistance) {
                if ((Math.random() * 10) < 5) {
                    minLocation = i;
                }
            }
        }
        return minLocation;
    }

    //每个点进行分类
    private void clusterSet() {
        int group = -1;
        double distance[] = new double[k];
        for (int i = 0; i < source.length; i++) {
            for (int j = 0; j < source[0].length; j++) {
                //求出距离中心点最短的中心
                for (int q = 0; q < center.length; q++) {
                    distance[q] = distance(center[q], source[i][j]);
                }
                group = minDistance(distance);//寻找该点最近的中心
                source[i][j].group = group;//把该点进行分类
                centerSum[group].red += source[i][j].red;//分类完求出该类的RGB和
                centerSum[group].green += source[i][j].green;
                centerSum[group].blue += source[i][j].blue;
                centerSum[group].group += 1;//这个就是用来统计聚类里有几个点
                group = -1;
            }
        }
    }

    //设置新的中心
    public void setNewCenter() {
        for (int i = 0; i < centerSum.length; i++) {
            System.out.println(i + ":" + centerSum[i].group + ":" + centerSum[i].red + ":" + centerSum[i].green + ":" + centerSum[i].blue);
            //取平均值为新的中心
            center[i].red = (int) (centerSum[i].red / centerSum[i].group);
            center[i].green = (int) (centerSum[i].green / centerSum[i].group);
            center[i].blue = (int) (centerSum[i].blue / centerSum[i].group);
            //重置之前的求和结果
            centerSum[i].red = center[i].red;
            centerSum[i].green = center[i].green;
            centerSum[i].blue = center[i].blue;
            centerSum[i].group = 0;
        }
    }

    //输出聚类好的数据
    private void ImagedataOut(String path) {
        Color c0 = new Color(255, 0, 0);
        Color c1 = new Color(0, 255, 0);
        Color c2 = new Color(0, 0, 255);
        Color c3 = new Color(128, 128, 128);
        BufferedImage nbi = new BufferedImage(source.length, source[0].length, BufferedImage.TYPE_INT_RGB);
        for (int i = 0; i < source.length; i++) {
            for (int j = 0; j < source[0].length; j++) {
                if (source[i][j].group == 0)
                    nbi.setRGB(i, j, c0.getRGB());
                else if (source[i][j].group == 1)
                    nbi.setRGB(i, j, c1.getRGB());
                else if (source[i][j].group == 2)
                    nbi.setRGB(i, j, c2.getRGB());
                else if (source[i][j].group == 3)
                    nbi.setRGB(i, j, c3.getRGB());

            }
        }
        try {
            ImageIO.write(nbi, "jpg", new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //进行kmeans计算的核心函数
    public void kmeans(String path, int k, int m, String outputPath) {
        source = InitData(getImageData(path));

        this.k = k;
        this.m = m;
        //初始化聚类中心
        initCenters(k);

        //进行m次聚类
        for (int level = 0; level < m; level++) {
            clusterSet();
            setNewCenter();
            for (int i = 0; i < center.length; i++) {
                System.out.println("(" + center[i].red + "," + center[i].green + "," + center[i].blue + ")");
            }
        }
        clusterSet();
        System.out.println("第" + m + "次迭代完成，聚类中心为：");
        for (int i = 0; i < center.length; i++) {
            System.out.println("(" + center[i].red + "," + center[i].green + "," + center[i].blue + ")");
        }
        System.out.println("迭代总次数：" + m);//进行图像输出，这个随意改
        ImagedataOut(outputPath);
    }

    public static void main(String[] args) {
        ImageCluster imageCluster = new ImageCluster();
        PicturePathUtil picturePathUtil = new PicturePathUtil();
        //在这里指定文件夹路径以及读取的图片格式，DIRCTORY_PATH是定义在Constant工具类中的常量
        List<String> picturePaths = picturePathUtil.getPictures(DIRCTORY_PATH, ".jpg");
       long time=System.currentTimeMillis();
        for (String picturePath :
                picturePaths) {
            System.out.println("-------------------------------");
            System.out.println(picturePath+"：开始进行分割");
            String rawPath = picturePath.substring(0, picturePath.indexOf("."));
            String outputPath = rawPath + "_keams.jpg";
            imageCluster.kmeans(picturePath, 4, 10, outputPath);
            System.out.println("-------------------------------");
        }
        long time1=System.currentTimeMillis();
        long d=time1-time;
        System.out.println("一共用了"+(d/1000)%60+"秒");
    }


}
