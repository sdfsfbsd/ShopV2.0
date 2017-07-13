package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.User;

public class SessionFilter implements Filter {
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		checkSession((HttpServletRequest) request, (HttpServletResponse) response);
		chain.doFilter(request, response);

	}

	/** У��SESSION�Ƿ���Ч���ж�session�����Ƿ���user */
	private void checkSession(HttpServletRequest request, HttpServletResponse response) {
		// ���SessionʧЧ�����ص�¼ҳ��
		HttpSession session = request.getSession();
		try {
			if (session == null) {
				System.out.println("*****У�鵽sessionʧЧ*****");
				response.sendRedirect("/ShopV2.0");
			} else {
				User user = (User) session.getAttribute("User");
				if (user == null) {
					System.out.println("*****У�鵽�û�δ��¼*****");
					response.sendRedirect("/ShopV2.0");
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
