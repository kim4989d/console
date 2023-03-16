package ch.ethz.ssh2.signature;

import java.math.BigInteger;

/**
 * DSASignature.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: DSASignature.java,v 1.1 2009/02/09 06:57:29 kim4989 Exp $
 */
public class DSASignature
{
	private BigInteger r;
	private BigInteger s;

	public DSASignature(BigInteger r, BigInteger s)
	{
		this.r = r;
		this.s = s;
	}

	public BigInteger getR()
	{
		return r;
	}

	public BigInteger getS()
	{
		return s;
	}
}
