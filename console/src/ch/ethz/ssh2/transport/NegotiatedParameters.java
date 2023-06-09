package ch.ethz.ssh2.transport;

/**
 * NegotiatedParameters.
 * 
 * @author Christian Plattner, plattner@inf.ethz.ch
 * @version $Id: NegotiatedParameters.java,v 1.1 2009/02/09 06:57:30 kim4989 Exp $
 */
public class NegotiatedParameters
{
	public boolean guessOK;
	public String kex_algo;
	public String server_host_key_algo;
	public String enc_algo_client_to_server;
	public String enc_algo_server_to_client;
	public String mac_algo_client_to_server;
	public String mac_algo_server_to_client;
	public String comp_algo_client_to_server;
	public String comp_algo_server_to_client;
	public String lang_client_to_server;
	public String lang_server_to_client;
}
