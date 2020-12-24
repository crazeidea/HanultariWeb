package command;

public class PageDTO {
	private int totalList; //총 글건수 
	private int pageList = 10; //페이지당 목록 갯수
	private int blockPage = 10; //블럭당 페이지 갯수
	private int totalPage; //총 페이지수
	private int totalBlock; //총 블럭수
	private int curPage; //현재 페이지번호
	private int beginList, endList; //현재페이지의 시작/끝 목록번호
	private int curBlock; //현재 블럭번호
	private int beginPage, endPage; //현재블럭의 시작/끝 페이지번호
	private String search, keyword; //검색조건, 검색키워드
	private String viewType = "list"; //보기형태:리스트/그리드
	
	public String getViewType() {
		return viewType;
	}
	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
	public int getTotalList() {
		return totalList;
	}
	public void setTotalList(int totalList) {
		this.totalList = totalList;
		
		//총페이지수
		totalPage = totalList / pageList;
		if( totalList % pageList >0 ) ++totalPage;
		
		//총블럭수
		totalBlock = totalPage / blockPage;
		if( totalPage % blockPage >0 ) ++totalBlock;
		
		//현재 페이지번호에 따라 보여지는 목록 시작/끝 목록번호가 결정
		//끝 목록번호 = 총글건수 - (페이지번호-1) * 페이지당목록수
		endList = totalList - (curPage-1)*pageList;
		//시작 목록번호 = 끝 목록번호 - (페이지당목록수-1) 503 ~ 512
		beginList = endList - (pageList-1);
		
		//현재 블럭번호에 따라 보여질 페이지번호들이 결정된다
		//현재 블럭번호 = 페이지번호 / 블럭당 보여질 페이지수
		//  1~10 : 1, 11~20: 2, 21~26: 3
		curBlock = curPage / blockPage;
		if( curPage % blockPage > 0 ) ++curBlock;
		
		//끝페이지번호 = 현재 블럭번호 * 블럭당 페이지수
		endPage = curBlock * blockPage;
		//시작페이지번호 = 끝페이지번호 - (블럭당 페이지수-1);
		beginPage = endPage - (blockPage-1);

		if( endPage > totalPage ) endPage = totalPage;
		
	}
	public int getPageList() {
		return pageList;
	}
	public void setPageList(int pageList) {
		this.pageList = pageList;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getBeginList() {
		return beginList;
	}
	public void setBeginList(int beginList) {
		this.beginList = beginList;
	}
	public int getEndList() {
		return endList;
	}
	public void setEndList(int endList) {
		this.endList = endList;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
