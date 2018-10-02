package kr.co.moviemovit.review;

import org.springframework.stereotype.Component;

@Component
public class Criteria {

  private int page;         // 보여줄 페이지 번호
  private int perPageNum;   // 페이지당 보여줄 게시글의 개수
  
  public Criteria() {
    //최초 게시판에 진입할 때를 위해서 기본 값을 설정 해야 한다.
    this.page = 1;
    this.perPageNum = 10;
  }

  public int getPage() {
    return page;
  }

  public void setPage(int page) {
    if(page <= 0) {
      this.page = 1;
      return;
    }
    
    this.page = page;
  }

  public int getPerPageNum() {
    return perPageNum;
  }

  public void setPerPageNum(int perPageNum) {
    
    if(perPageNum <= 0 || perPageNum > 100) {
      this.perPageNum = 10;
      return;
    }
    
    this.perPageNum = perPageNum;
  }
  
  /* limit 구문에서 시작 위치를 지정할 때 사용된다. 예를 들어 10개씩 출력하는 경우 3페이지의 데이터는 linit 20, 10 과 같은 형태가 되어야 한다. */
  /* this.page 가 1이면 0이 되어야 한다 mysql limit 0, 10 해야 처음부터 10개씩 나온다. */
  /* 마이바티스 조회쿼리의 #{pageStart}에 전달된다. */
  public int getPageStart() {
    return (this.page -1) * perPageNum;
  }
  

  @Override
  public String toString() {
    return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
  }
} // class end