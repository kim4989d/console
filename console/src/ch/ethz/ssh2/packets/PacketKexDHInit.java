package ch.ethz.ssh2.packets;

import java.math.BigInteger;

/**
 * PacketKexDHInit.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: PacketKexDHInit.java,v 1.1 2009/02/09 06:57:30 kim4989 Exp $
 */
public class PacketKexDHInit
{
	byte[] payload;

	BigInteger e;

	public PacketKexDHInit(BigInteger e)
	{
		this.e = e;
	}

	public byte[] getPayload()
	{
		if (payload == null)
		{
			TypesWriter tw = new TypesWriter();
			tw.writeByte(Packets.SSH_MSG_KEXDH_INIT);
			tw.writeMPInt(e);
			payload = tw.getBytes();
		}
		return payload;
	}
}
