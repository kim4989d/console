package console.admin_backup.cmd;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import console.common.cmd.BaseCommand;
import console.common.tray.Tray;




public class QaConfirmCmd extends BaseCommand {

	public QaConfirmCmd() {
		setNextPage("qa_A_confirm.jsp");
	}

	protected void doExecute(Tray reqTray, HttpServletRequest request, HttpServletResponse response) {

	}

}
