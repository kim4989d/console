
package ch.ethz.ssh2.packets;

/**
 * PacketUserauthRequestInteractive.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: PacketUserauthRequestInteractive.java,v 1.1 2009/02/09 06:57:30 kim4989 Exp $
 */
public class PacketUserauthRequestInteractive
{
	byte[] payload;

	String userName;
	String serviceName;
	String[] submethods;

	public PacketUserauthRequestInteractive(String serviceName, String user, String[] submethods)
	{
		this.serviceName = serviceName;
		this.userName = user;
		this.submethods = submethods;
	}

	public byte[] getPayload()
	{
		if (payload == null)
		{
			TypesWriter tw = new TypesWriter();
			tw.writeByte(Packets.SSH_MSG_USERAUTH_REQUEST);
			tw.writeString(userName);
			tw.writeString(serviceName);
			tw.writeString("keyboard-interactive");
			tw.writeString(""); // draft-ietf-secsh-newmodes-04.txt says that
			// the language tag should be empty.
			tw.writeNameList(submethods);

			payload = tw.getBytes();
		}
		return payload;
	}
}
