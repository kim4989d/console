package ch.ethz.ssh2.transport;

import java.io.IOException;

/**
 * MessageHandler.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: MessageHandler.java,v 1.1 2009/02/09 06:57:30 kim4989 Exp $
 */
public interface MessageHandler
{
	public void handleMessage(byte[] msg, int msglen) throws IOException;
}
