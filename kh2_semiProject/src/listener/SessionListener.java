package listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import beans.VisitDao;


public class SessionListener implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		if (arg0.getSession().isNew()) {
			execute(arg0);
		}
	}

	private void execute(HttpSessionEvent arg0) {
		VisitDao dao = VisitDao.getInstance();

		try {
			dao.setVisitTotalCount();
			
			int totalCount = dao.getVisitTotalCount();

			int todayCount = dao.getVisitTodayCount();

			HttpSession session = arg0.getSession();

			session.setAttribute("totalCount", totalCount);
			session.setAttribute("todayCount", todayCount);

		} catch (Exception e) {
			
			e.printStackTrace();
		}

	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
	}
}
