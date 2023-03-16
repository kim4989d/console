
package ch.ethz.ssh2.crypto.digest;

/**
 * Digest.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: Digest.java,v 1.1 2009/02/09 06:57:28 kim4989 Exp $
 */
public interface Digest
{
	public int getDigestLength();

	public void update(byte b);

	public void update(byte[] b);

	public void update(byte b[], int off, int len);

	public void reset();

	public void digest(byte[] out);

	public void digest(byte[] out, int off);
}
