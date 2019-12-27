package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;

public class NoticeService {

	public List<Notice> selectNoticeAll(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Notice> list = new NoticeDAO().selectNoticeAll(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int selectNoticeCount() {
		Connection conn = getConnection();
		int totalContent = new NoticeDAO().selectNoticeCount(conn);
		close(conn);
		return totalContent;
	}

	public Notice selectNoticeOne(int noticeNo, boolean hasRead) {
		Connection conn = getConnection();
		int result = 0;
		Notice n = new NoticeDAO().selectNoticeOne(conn, noticeNo);
		if(!hasRead) {
			result = new NoticeDAO().increaseReadCount(conn, noticeNo);
		}
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		return n;
	}

}
