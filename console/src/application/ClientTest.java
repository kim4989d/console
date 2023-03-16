package application;
import java.net.*;
import java.io.*;
public class ClientTest {
    public static void main(String[] args)throws IOException{
        //[1]���� ����(Ŭ:port�� ���� ������ ��Ʈ, IP�� �ڱ�IP)
        String ip="172.18.165.242";
        int port=23;             //��Ʈ��ȣ�� ������ ��ġ
        Socket socket= new Socket(ip,port);
        //Socket�� ���ߴ� == ��� ����� ��Ȯ�� ����.
 
        //[2]Stream���ϱ�(in, out)
        InputStream is = socket.getInputStream();
 
        OutputStream os = socket.getOutputStream();
        OutputStreamWriter osw = new OutputStreamWriter(os);
        PrintWriter pw = new PrintWriter(osw);
 
        //Ű����� �Է¹ڰ� ��Ʈ��ũ�� ���ױ�
        InputStreamReader isr = new InputStreamReader(System.in);
        BufferedReader br = new BufferedReader(isr);
 
        System.out.print("���ڿ� �Է� : ");
        String line = null;
       
        while((line = br.readLine())!=null){
            if(line.equals("quit")){break;}
            System.out.print("���ڿ� �Է� : ");
            pw.println(line);
            pw.flush();
        }
      //������
        br.close();
        pw.close();
        socket.close();
    }
}