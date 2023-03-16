package application;
public class CmdExecutor
{

    public CmdExecutor()
    {
    }

    public static void execute(String command)
    {
        try
        {
          //  String cmd[] = new String[3];
        	String  cmd = command;
           // cmd[1] = "/C";
           // cmd[2] = command;
            Runtime rt = Runtime.getRuntime();
           // System.out.println("Execing " + cmd[0] + " " + cmd[1] + " " + cmd[2]);
            Process proc = rt.exec(cmd);
            StreamGobbler errorGobbler = new StreamGobbler(proc.getErrorStream(), "ERROR");
            StreamGobbler outputGobbler = new StreamGobbler(proc.getInputStream(), "OUTPUT");
            errorGobbler.start();
            outputGobbler.start();
            int exitVal = proc.waitFor();
            System.out.println("ExitValue: " + exitVal);
        }
        catch(Throwable t)
        {
            t.printStackTrace();
        }
    }
}

