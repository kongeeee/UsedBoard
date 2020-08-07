package ezen;

/*
 * https://diaryofgreen.tistory.com/83 ����
 */
public class Paging 
{ 
    int recordsPerPage;       // �������� ���ڵ� ��
    int firstPageNo;          // ù��° ������ ��ȣ
    int prevPageNo;           // ���� ������ ��ȣ
    int startPageNo;          // ���� ������ (����¡ �ʺ� ����)
    int currentPageNo;        // ������ ��ȣ
    int endPageNo;            // �� ������ (����¡ �ʺ� ����)
    int nextPageNo;           // ���� ������ ��ȣ
    int finalPageNo;          // ������ ������ ��ȣ
    int numberOfRecords;      // ��ü ���ڵ� ��
    int sizeOfPage;           // �������� ������ ���� (1,2,3,4,5 ����)
    
    public void Init(int currentPageNo, int recordsPerPage) 
    { 
        this.currentPageNo = currentPageNo;
        //�⺻ ������ : 5�� ���⸦ default�� ������
        this.sizeOfPage = 5;
        
        //recordsPerPage�� 0�� �ƴϸ� recordsPerPage, �ƴϸ� ������ 5(default : 5)
        this.recordsPerPage = (recordsPerPage != 0) ? recordsPerPage : 5;
        
        System.out.println("debug > paging sizeOfPage : " + this.sizeOfPage);
        System.out.println("debug > paging recordsPerPage : " + this.recordsPerPage);
        System.out.println("debug > paging currentPageNo : " + this.currentPageNo);
    }
    
    public int getRecordsPerPage() 
    {
        return recordsPerPage;
    }
 
    public void setRecordsPerPage(int recordsPerPage) 
    {
        this.recordsPerPage = recordsPerPage;
    }
 
    public int getFirstPageNo() 
    {
        return firstPageNo;
    }
 
    public void setFirstPageNo(int firstPageNo) 
    {
        this.firstPageNo = firstPageNo;
    }
 
    public int getPrevPageNo()
    {
        return prevPageNo;
    }
 
    public void setPrevPageNo(int prevPageNo)
    {
        this.prevPageNo = prevPageNo;
    }
 
    public int getStartPageNo() 
    {
        return startPageNo;
    }
 
    public void setStartPageNo(int startPageNo) 
    {
        this.startPageNo = startPageNo;
    }
 
    public int getCurrentPageNo() 
    {
        return currentPageNo;
    }
 
    public void setCurrentPageNo(int currentPageNo) 
    {
        this.currentPageNo = currentPageNo;
    }
 
    public int getEndPageNo()
    {
        return endPageNo;
    }
 
    public void setEndPageNo(int endPageNo)
    {
        this.endPageNo = endPageNo;
    }
 
    public int getNextPageNo() 
    {
        return nextPageNo;
    }
 
    public void setNextPageNo(int nextPageNo)
    {
        this.nextPageNo = nextPageNo;
    }
 
    public int getFinalPageNo() 
    {
        return finalPageNo;
    }
 
    public void setFinalPageNo(int finalpageNo)
    {
        this.finalPageNo = finalpageNo;
    }
 
    public int getNumberOfRecords()
    {
        return numberOfRecords;
    }
 
    public void setNumberOfRecords(int numberOfRecords) 
    {
        this.numberOfRecords = numberOfRecords;
    }
 
    /**
     * ����¡ ����
     */
    public void makePaging() 
    {
        if (numberOfRecords == 0)        // �Խñ� ��ü ���� ���� ���
            return;
        
        if (currentPageNo == 0)
            setCurrentPageNo(1);        // �⺻ �� ����
        
        if (recordsPerPage == 0)
            setRecordsPerPage(10);        // �⺻ �� ����
        
                                        // ������ ������
        int finalPage = (numberOfRecords + (recordsPerPage - 1)) / recordsPerPage;
        
        if (currentPageNo > finalPage)
            setCurrentPageNo(finalPage);// �⺻ �� ����
        
        if (currentPageNo < 0 || currentPageNo > finalPage)
            currentPageNo = 1;            // ���� ������ ��ȿ�� üũ
                                        // ���� ������ (��ü)
        boolean isNowFirst = currentPageNo == 1 ? true : false;
        boolean isNowFinal = currentPageNo == finalPage ? true : false;
        
        int startPage = ((currentPageNo - 1) / sizeOfPage) * sizeOfPage + 1;
        int endPage = startPage + sizeOfPage - 1;        
        
        if (endPage > finalPage)
            endPage = finalPage;
        
        setFirstPageNo(1);                    // ù��° ������ ��ȣ
        
        if (isNowFirst)
            setPrevPageNo(1);                // ���� ������ ��ȣ
        else                                // ���� ������ ��ȣ
            setPrevPageNo(((currentPageNo - 1) < 1 ? 1 : (currentPageNo - 1)));
 
        setStartPageNo(startPage);            // ����������
        setEndPageNo(endPage);                // �� ������
        
        if (isNowFinal)
            setNextPageNo(finalPage);        // ���� ������ ��ȣ
        else
            setNextPageNo(((currentPageNo + 1) > finalPage ? finalPage : (currentPageNo + 1)));
        
        setFinalPageNo(finalPage);            // ������ ������ ��ȣ
    }
}


