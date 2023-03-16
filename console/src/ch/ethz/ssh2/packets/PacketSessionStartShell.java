
package ch.ethz.ssh2.packets;

/**
 * PacketSessionStartShell.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: PacketSessionStartShell.java,v 1.1 2009/02/09 06:57:30 kim4989 Exp $
 */
public class PacketSessionStartShell
{
	byte[] payload;

	public int recipientChannelID;
	public boolean wantReply;

	public PacketSessionStartShell(int recipientChannelID, boolean wantReply)
	{
		this.recipientChannelID = recipientChannelID;
		this.wantReply = wantReply;
	}

	public byte[] getPayload()
	{
		if (payload == null)
		{
			TypesWriter tw = new TypesWriter();
			tw.writeByte(Packets.SSH_MSG_CHANNEL_REQUEST);
			tw.writeUINT32(recipientChannelID);
			tw.writeString("shell");
			tw.writeBoolean(wantReply);
			payload = tw.getBytes();
		}
		return payload;
	}
}
