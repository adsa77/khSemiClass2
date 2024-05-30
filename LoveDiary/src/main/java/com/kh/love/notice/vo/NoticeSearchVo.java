package com.kh.love.notice.vo;

public class NoticeSearchVo extends NoticePageVo {
    private String searchCol;    // 검색 컬럼 (title, content)
    private String value;        // 검색어
    private int boardLimit;      // 한 페이지에 보여줄 게시글 갯수

    public NoticeSearchVo() {
        super();
    }

    public NoticeSearchVo(int listCount, int currentPage, int pageLimit, int boardLimit) {
        super(listCount, currentPage, pageLimit, boardLimit);
        this.boardLimit = boardLimit;
    }

    public String getSearchCol() {
        return searchCol;
    }

    public void setSearchCol(String searchCol) {
        this.searchCol = searchCol;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getBoardLimit() {
        return boardLimit;
    }

    public void setBoardLimit(int boardLimit) {
        this.boardLimit = boardLimit;
    }

    @Override
    public String toString() {
        return "NoticeSearchVo [searchCol=" + searchCol + ", value=" + value + ", boardLimit=" + boardLimit
                + ", listCount=" + getListCount() + ", currentPage=" + getCurrentPage() + ", pageLimit=" + getPageLimit()
                + ", maxPage=" + getMaxPage() + ", startPage=" + getStartPage() + ", endPage=" + getEndPage()
                + ", startNum=" + getStartNum() + ", endNum=" + getEndNum() + "]";
    }
}
