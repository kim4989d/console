package ch.ethz.ssh2.packets;
import java.io.IOException;

/**
 * PacketDisconnect.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: PacketDisconnect.java,v 1.1 2009/02/09 06:57:31 kim4989 Exp $
 */
public class PacketDisconnect
{
	byte[] payload;

	int reason;
	String desc;
	String lang;

	public PacketDisconnect(byte payload[], int off, int len) throws IOException
	{
		this.payload = new byte[len];
		System.arraycopy(payload, off, this.payload, 0, len);

		TypesReader tr = new TypesReader(payload, off, len);

		int packet_type = tr.readByte();

		if (packet_type != Packets.SSH_MSG_DISCONNECT)
			throw new IOException("This is not a Disconnect Packet! ("
					+ packet_type + ")");

		reason = tr.readUINT32();
		desc = tr.readString();
		lang = tr.readString();
	}

	public PacketDisconnect(int reason, String desc, String lang)
	{
		this.reason = reason;
		this.desc = desc;
		this.lang = lang;
	}
	
	public byte[] getPayload()
	{
		if (payload == null)
		{
			TypesWriter tw = new TypesWriter();
			tw.writeByte(Packets.SSH_MSG_DISCONNECT);
			tw.writeUINT32(reason);
			tw.writeString(desc);
			tw.writeString(lang);
			payload = tw.getBytes();
		}
		return payload;
	}
}
