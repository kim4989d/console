
package ch.ethz.ssh2.crypto;

/**
 * Parsed PEM structure.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: PEMStructure.java,v 1.1 2009/02/09 06:57:29 kim4989 Exp $
 */

public class PEMStructure
{
	int pemType;
	String dekInfo[];
	String procType[];
	byte[] data;
}