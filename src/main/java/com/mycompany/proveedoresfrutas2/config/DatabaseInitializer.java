 package com.mycompany.proveedoresfrutas2.config;

import com.mongodb.client.MongoDatabase;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import com.mycompany.proveedoresfrutas2.model.User;
import com.mycompany.proveedoresfrutas2.repository.UserRepository;

@WebListener
public class DatabaseInitializer implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        MongoDatabase db = MongoDBConfig.getDatabase();
        UserRepository userRepository = new UserRepository();

        // Verificar si la colección "users" tiene datos, si no, crear usuarios
        if (userRepository.countUsers() == 0) {
            // Crear usuarios administradores
            User bruno = new User("Bruno", "bruno123", "Admin");
            bruno.setName("Bruno Mejia");
            userRepository.save(bruno);

            User bryan = new User("bryan", "brayan123", "Admin");
            bryan.setName("Bryan Hernandez");
            userRepository.save(bryan);

            User luis = new User("luis", "luis123", "Admin");
            luis.setName("Luis Gerardo");
            userRepository.save(luis);

            System.out.println("Base de datos inicializada con 3 usuarios administradores.");
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Limpieza si es necesario
    }
}