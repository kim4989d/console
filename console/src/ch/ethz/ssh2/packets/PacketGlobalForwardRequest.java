
package ch.ethz.ssh2.packets;

/**
 * PacketGlobalForwardRequest.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: PacketGlobalForwardRequest.java,v 1.1 2009/02/09 06:57:30 kim4989 Exp $
 */
public class PacketGlobalForwardRequest
{
	byte[] payload;

	public boolean wantReply;
	public String bindAddress;
	public int bindPort;

	public PacketGlobalForwardRequest(boolean wantReply, String bindAddress, int bindPort)
	{
		this.wantReply = wantReply;
		this.bindAddress = bindAddress;
		this.bindPort = bindPort;
	}

	public byte[] getPayload()
	{
		if (payload == null)
		{
			TypesWriter tw = new TypesWriter();
			tw.writeByte(Packets.SSH_MSG_GLOBAL_REQUEST);
			
			tw.writeString("tcpip-forward");
			tw.writeBoolean(wantReply);
			tw.writeString(bindAddress);
			tw.writeUINT32(bindPort);

			payload = tw.getBytes();
		}
		return payload;
	}
}
