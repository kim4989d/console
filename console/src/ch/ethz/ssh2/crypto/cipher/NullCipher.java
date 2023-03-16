package ch.ethz.ssh2.crypto.cipher;

/**
 * NullCipher.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: NullCipher.java,v 1.1 2009/02/09 06:57:29 kim4989 Exp $
 */
public class NullCipher implements BlockCipher
{
	private int blockSize = 8;
	
	public NullCipher()
	{
	}

	public NullCipher(int blockSize)
	{
		this.blockSize = blockSize;
	}
	
	public void init(boolean forEncryption, byte[] key)
	{
	}

	public int getBlockSize()
	{
		return blockSize;
	}

	public void transformBlock(byte[] src, int srcoff, byte[] dst, int dstoff)
	{
		System.arraycopy(src, srcoff, dst, dstoff, blockSize);
	}
}
