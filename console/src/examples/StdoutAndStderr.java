package examples;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.InputStreamReader;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;

public class StdoutAndStderr
{
	public static void main(String[] args)
	{
		String hostname = "172.18.185.196";
		String username = "suser";
		String password = "mccenter!05";

		try
		{
			/* Create a connection instance */

			Connection conn = new Connection(hostname);

			/* Now connect */

			conn.connect();

			/* Authenticate */

			boolean isAuthenticated = conn.authenticateWithPassword(username, password);

			if (isAuthenticated == false)
				throw new IOException("Authentication failed.");

			/* Create a session */

			Session sess = conn.openSession();

			sess.startShell();

			InputStream in = sess.getStdout();
			OutputStream out = sess.getStdin();
			
			
			
			//OutputStream out=new StreamGobbler(sess.getStdin());
			//InputStream	in=			 sess.getStdout();
			
			
			//InputStream stdout = new StreamGobbler(sess.getStdout());
			//InputStream stderr = new StreamGobbler(sess.getStderr());
	
			//BufferedReader stdoutReader = new BufferedReader(new InputStreamReader(in));
			//BufferedReader stderrReader = new BufferedReader(new InputStreamReader(stderr));
			
			System.out.println("Here is the output from stdout:");
			byte[] b=new byte[8192];
			while (true)
			{
				int c= in.read(b);
				System.out.println((char) c);
				if (c == -1){
					return;
				}	
			
			}
			
		//	sess.close();

			/* Close the connection */

		//	conn.close();

		}
		catch (IOException e)
		{
			e.printStackTrace(System.err);
			System.exit(2);
		}
	}
}
