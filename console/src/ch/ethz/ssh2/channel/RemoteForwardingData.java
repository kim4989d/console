
package ch.ethz.ssh2.channel;

/**
 * RemoteForwardingData. Data about a requested remote forwarding.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: RemoteForwardingData.java,v 1.1 2009/02/09 06:57:30 kim4989 Exp $
 */
public class RemoteForwardingData
{
	public String bindAddress;
	public int bindPort;

	String targetAddress;
	int targetPort;
}
