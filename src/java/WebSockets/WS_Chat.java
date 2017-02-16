/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebSockets;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/endpointChat")
public class WS_Chat {

    Session session;

    private static Set<Session> clients
            = Collections.synchronizedSet(new HashSet<>());

    @OnMessage
    public void onMessage(String message) throws IOException {

        synchronized (clients) {
            
            for (Session client : clients) {
                client.getBasicRemote().sendText(message);
            }
        }
    }

    @OnOpen
    public void onOpen(Session session) throws IOException {
        this.session = session;
        clients.add(session);
        
        String msg = "<span class='warningChat'>Bienvenue sur le chat d\'Assurance Voiture. <br>"
                + "Vous pouvez discuter et demander de l\'aide aux autres utilisateurs de ce chat."
                + " Merci de rester courtois.</span>";
        
        this.session.getBasicRemote().sendText(msg);
        
        synchronized (clients) {
            
            for (Session client : clients) {
                String message = "<span class='infoChat'>Un utilisateur à rejoins le chat.";
                message += " Il y a " + clients.size() + " personne(s) dans le chat !</span>";
                
                client.getBasicRemote().sendText(message);
            }
        }
        
        System.out.println(">> Connexion ouverte !");
    }

    @OnClose
    public void onClose(Session session) throws IOException {
        System.out.println("<< Connexion fermée !");
        clients.remove(session);

        synchronized (clients) {
            
            for (Session client : clients) {
                String message = "<span class='userleft'>Un utilisateur à quitté le chat.";
                message += " Il y a " + clients.size() + " personne(s) dans le chat !</span>";
                
                client.getBasicRemote().sendText(message);
            }
        }
        
        
    }
}
