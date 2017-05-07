package ir.arcinc;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class WebServer {

    public void start() {
        ServerSocket s;

        System.out.println("Webserver starting up on port 8080");
        try {

            s = new ServerSocket(8080);
        } catch (Exception e) {
            System.out.println("Error: " + e);
            return;
        }

        System.out.println("Waiting for connection");
        for (; ; ) {
            try {

                Socket remote = s.accept();

                System.out.println("Connection, sending data.");
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        remote.getInputStream()));
                PrintWriter out = new PrintWriter(remote.getOutputStream());

                String str = ".";
                while (!str.equals("")) {
                    str = in.readLine();
                    System.out.println(str);
                }

                out.println("HTTP/1.0 200 OK");
                out.println("Content-Type: text/html");
                out.println("Server: Arc-Server");

                out.println("");

                out.println("<H1>Hello World</H2>");
                out.flush();
                remote.close();

            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }
    }

    public static void main(String[] args) {
        new WebServer().start();
    }
}