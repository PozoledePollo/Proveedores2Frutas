/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.proveedoresfrutas2.service;

/**
 *
 * @author bruni
 */
import com.mycompany.proveedoresfrutas2.dao.UsuarioDAO;
import com.mycompany.proveedoresfrutas2.model.Usuario;

public class UsuarioService {
    private UsuarioDAO usuarioDAO;

    public UsuarioService() {
        this.usuarioDAO = new UsuarioDAO();
    }

    public boolean autenticar(String username, String password) {
        Usuario usuario = usuarioDAO.buscarPorUsername(username);
        if (usuario != null && usuario.getPassword().equals(password)) {
            return true;
        }
        return false;
    }
}
