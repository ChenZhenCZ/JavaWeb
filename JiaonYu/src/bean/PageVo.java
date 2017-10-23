package bean;

import java.io.Serializable;

public class PageVo implements Serializable{

	//每页显示的记录数
	private int pageSize=5;
	//记录总数
	private int textCount;
	//页数
	private int pageCount;
	//当前页
	private int pageDaen;
	//起始位置
	private int pageInt;
	
	//操作
	private String por;
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTextCount() {
		return textCount;
	}

	public void setTextCount(int textCount) {
		pageCount=(int)Math.ceil((float)textCount/(float)pageSize);
		this.textCount = textCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageDaen() {
		
		return pageDaen;
	}

	public void setPageDaen(int pageDaen) {
		this.pageDaen = pageDaen;
	}

	public String getPor() {
		return por;
	}

	public void setPor(String por) {
		/*点击首页链接：first
		 *点击上一页链接：piror;
		 *点击下一页链接：next
		 *点击末页链接：last 
		 * 
		 * */
		if(por.equals("first")){//首页
			pageDaen=1;
		}else if(por.equals("last")){//末页
			pageDaen=pageCount;
		}else if(por.equals("piror")){//上一页
			if(pageDaen>1){
				pageDaen--;
			}else{
				pageDaen=1;
			}
		}else if(por.equals("next")){//下一页
			if(pageDaen<pageCount){
				pageDaen++;
			}else{
				pageDaen=pageDaen;
			}
		}
		this.por = por;
	}
	public int getPageInt() {
		pageInt=(pageDaen-1)*pageSize;
		return pageInt;
	}

	public void setPageInt(int pageInt) {
		this.pageInt = pageInt;
	}
}