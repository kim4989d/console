package console.qadb.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gs.qadb.dao.LoginDao;
import gs.x.cmd.BaseCommand;
import gs.x.execption.AppException;
import gs.x.tray.ResultSetTray;
import gs.x.tray.Tray;

public class GoodsClassTreeCmd extends BaseCommand {
	
	public GoodsClassTreeCmd() {
		setNextPage("qa_goodsClassTree.jsp");
	}

	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {
		GoodsClassTreeDao goodsClassTreeDao = null;
		ResultSetTray  rsTray   = null;

		try {
			goodsClassTreeDao = new GoodsClassTreeDao();
			rsTray = goodsClassTreeDao.findGoodsClassInfo(getConnection(), reqTray)
			if ( rsTray.getRowCount() > 0 ) {
				request.setAttribute("goods_class_tree", rsTray);
			}
		}
		catch (AppException ex) {
			throw ex;
		}
		catch (Exception ex) {
			throw new AppException("GoodsClassTreeCmd에서 일반예외 발생", ex);
		}
	}
}
