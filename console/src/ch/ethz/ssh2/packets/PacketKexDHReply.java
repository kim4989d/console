package ch.ethz.ssh2.packets;

import java.io.IOException;

import java.math.BigInteger;

/**
 * PacketKexDHReply.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: PacketKexDHReply.java,v 1.1 2009/02/09 06:57:30 kim4989 Exp $
 */
public class PacketKexDHReply
{
	byte[] payload;

	byte[] hostKey;
	BigInteger f;
	byte[] signature;
	
	public PacketKexDHReply(byte payload[], int off, int len) throws IOException
	{
		this.payload = new byte[len];
		System.arraycopy(payload, off, this.payload, 0, len);

		TypesReader tr = new TypesReader(payload, off, len);

		int packet_type = tr.readByte();

		if (packet_type != Packets.SSH_MSG_KEXDH_REPLY)
			throw new IOException("This is not a SSH_MSG_KEXDH_REPLY! ("
					+ packet_type + ")");

		hostKey = tr.readByteString();
		f = tr.readMPINT();
		signature = tr.readByteString();

		if (tr.remain() != 0) throw new IOException("PADDING IN SSH_MSG_KEXDH_REPLY!");
	}

	public BigInteger getF()
	{
		return f;
	}
	
	public byte[] getHostKey()
	{
		return hostKey;
	}

	public byte[] getSignature()
	{
		return signature;
	}
}
