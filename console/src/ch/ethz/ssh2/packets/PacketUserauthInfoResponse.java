
package ch.ethz.ssh2.packets;

/**
 * PacketUserauthInfoResponse.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: PacketUserauthInfoResponse.java,v 1.1 2009/02/09 06:57:30 kim4989 Exp $
 */
public class PacketUserauthInfoResponse
{
	byte[] payload;

	String[] responses;

	public PacketUserauthInfoResponse(String[] responses)
	{
		this.responses = responses;
	}

	public byte[] getPayload()
	{
		if (payload == null)
		{
			TypesWriter tw = new TypesWriter();
			tw.writeByte(Packets.SSH_MSG_USERAUTH_INFO_RESPONSE);
			tw.writeUINT32(responses.length);
			for (int i = 0; i < responses.length; i++)
				tw.writeString(responses[i]);

			payload = tw.getBytes();
		}
		return payload;
	}
}
