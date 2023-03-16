package examples;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.KnownHosts;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;

public class UsingKnownHosts
{
	static KnownHosts database = new KnownHosts();

	public static void main(String[] args) throws IOException
	{
		String hostname = "172.18.185.196";
		String username = "suser";
		String password = "mccenter!05";

		File knownHosts = new File("~/.ssh/known_hosts");

		try
		{
			/* Load known_hosts file into in-memory database */

			if (knownHosts.exists())
				database.addHostkeys(knownHosts);

			/* Create a connection instance */

			Connection conn = new Connection(hostname);

			/* Now connect and use the SimpleVerifier */

			conn.connect(new SimpleVerifier(database));

			/* Authenticate */

			boolean isAuthenticated = conn.authenticateWithPassword(username, password);

			if (isAuthenticated == false)
				throw new IOException("Authentication failed.");

			/* Create a session */

			Session sess = conn.openSession();

			sess.startShell();

			InputStream stdout = new StreamGobbler(sess.getStdout());
			//BufferedReader br = new BufferedReader(new InputStreamReader(stdout));
			
			System.out.println("Here is some information about the remote host:");

			while (true)
			{
				
				int c=stdout.read();
				System.out.print((char) c);
				if (c == -1)
					break;
			}

			
			while (true)
			{
				
				int c=stdout.read();
				System.out.print((char) c);
				if (c == -1)
					break;
			}

			int key;
		      while (true) {
			key=System.in.read();
			if (key==(']'-64)) break;
			out.write(key);
		      }
		      System.out.println(key);
			
			
			
			
			
			/* Close this session */

			sess.close();

			/* Close the connection */

			conn.close();

		}
		catch (IOException e)
		{
			e.printStackTrace(System.err);
			System.exit(2);
		}
	}
}
