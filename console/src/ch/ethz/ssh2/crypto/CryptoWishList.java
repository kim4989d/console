
package ch.ethz.ssh2.crypto;

import ch.ethz.ssh2.crypto.cipher.BlockCipherFactory;
import ch.ethz.ssh2.crypto.digest.MAC;
import ch.ethz.ssh2.transport.KexManager;

/**
 * CryptoWishList.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: CryptoWishList.java,v 1.1 2009/02/09 06:57:29 kim4989 Exp $
 */
public class CryptoWishList
{
	public String[] kexAlgorithms = KexManager.getDefaultKexAlgorithmList();
	public String[] serverHostKeyAlgorithms = KexManager.getDefaultServerHostkeyAlgorithmList();
	public String[] c2s_enc_algos = BlockCipherFactory.getDefaultCipherList();
	public String[] s2c_enc_algos = BlockCipherFactory.getDefaultCipherList();
	public String[] c2s_mac_algos = MAC.getMacList();
	public String[] s2c_mac_algos = MAC.getMacList();
}
