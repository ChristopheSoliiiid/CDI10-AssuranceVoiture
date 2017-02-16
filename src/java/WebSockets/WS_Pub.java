/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebSockets;

import java.io.IOException;
import java.util.Random;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/endpointPub")
public class WS_Pub {

    private Session session;
    private int lastNumPub = 0;

    @OnOpen
    public void onOpen(Session sess) throws InterruptedException, IOException {
        /*Logger logger = Logger.getLogger(WS_Pub.class.getName());
        FileHandler fileLog = null;

        fileLog = new FileHandler("logger.txt");
        // create a TXT formatter
        SimpleFormatter formatterTxt = new SimpleFormatter();
        fileLog.setFormatter(formatterTxt);
        logger.addHandler(fileLog);

        logger.setLevel(Level.INFO);

        this.session = sess;

        while (session.isOpen()) {
            // Génération d'un nombre aléatoire
            Random rand = new Random();
            int numPub = rand.nextInt(9) + 1;

            // Tant que le nombre et le même que celui de la pub d'avant
            // On génère un nouveau nombre
            while (numPub == lastNumPub) {
                numPub = rand.nextInt(9) + 1;
            }

            String pub = "pub_l" + numPub + ".jpg";

            try {
                session.getBasicRemote().sendText(pub);
            } catch (IOException ex) {
                logger.log(Level.FINEST, null, ex);
            }

            lastNumPub = numPub;
            Thread.sleep(5000);
        }*/

    }
}
