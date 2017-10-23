package bean;

import java.io.Serializable;

public class PageVo implements Serializable{

	//ÿҳ��ʾ�ļ�¼��
	private int pageSize=5;
	//��¼����
	private int textCount;
	//ҳ��
	private int pageCount;
	//��ǰҳ
	private int pageDaen;
	//��ʼλ��
	private int pageInt;
	
	//����
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
		/*�����ҳ���ӣ�first
		 *�����һҳ���ӣ�piror;
		 *�����һҳ���ӣ�next
		 *���ĩҳ���ӣ�last 
		 * 
		 * */
		if(por.equals("first")){//��ҳ
			pageDaen=1;
		}else if(por.equals("last")){//ĩҳ
			pageDaen=pageCount;
		}else if(por.equals("piror")){//��һҳ
			if(pageDaen>1){
				pageDaen--;
			}else{
				pageDaen=1;
			}
		}else if(por.equals("next")){//��һҳ
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