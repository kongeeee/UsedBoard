function del(idx) {
    if (confirm("게시글을 삭제하시겠습니까?") == 1) {
        location.href = '/delete.jsp?idx=' + idx;
    }
}