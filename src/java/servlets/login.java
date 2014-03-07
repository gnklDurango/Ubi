/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.sql.*;
import conn.*;// package que contiene la Clase ConectionDBS
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author wence
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ConectionDB obj = new ConectionDB();
    private String nombre, pass, //En pass se guarda la que ingreso el usuario
            AttNombre = "", AttAppe = "",
            SQLEx = "", EX = "", otra_var = "",
            nombre_bdd = "", contra_bdd = "", bandera = "", qry = "";
    private boolean exito;
    private int ban;
    private int insertar;
    String id_clave_med, hora_inv, equi, integran, lugar, id_pro;
    java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.text.DateFormat df2 = new java.text.SimpleDateFormat("hh:mm:ss");

    private void lectorBD(Boolean estado, String aviso) {
        if (estado) {
            try {
                String qry_cons = "select id_usuario, nombre, apellido, contra from usuarios where nombre='" + this.nombre + "' and contra='" + this.pass + "'";
                obj.conectar();
                ResultSet consulta = null;
                consulta = obj.consulta(qry_cons);
                if (consulta.next()) {
                    exito = true;
                    this.AttNombre = consulta.getString("nombre");
                    this.AttAppe = consulta.getString("apellido");

                } else {
                    exito = false;
                }
                obj.cierraConexion();
                /*   if(this.passMatch(passMD5)){
                 rs = query.executeQuery(selectDatos + IDpass +"'");
                 rs.first();
                 this.AttNombre = rs.getString(1);
                 this.AttAppe = rs.getString(2);
                 rs.close();
                 }else {

                 }
                 query.close(); conexion.close();*/
            } catch (SQLException ex) {
                this.SQLEx = "Se produjo una excepción durante la conexión: " + ex.toString();
            } catch (Exception ex) {
                this.EX = "Se produjo una excepción: " + ex.toString();
            }
        }
    }

    private Boolean passMatch(String passMD5) {
        if (this.pass.equals(passMD5)) {
            return true;
        } else {
            return false;
        }
    }

    private void validar(String parNom, String parPass) {

        Boolean estado = false;
        String falta = null;

        if (!parNom.isEmpty()) {
            if (!parPass.isEmpty()) {
                estado = true;
                this.nombre = parNom;
                this.pass = parPass;
            } else {
                exito = false;
                falta = "No se ingresó la contraseña";
            }
        } else {
            exito = false;
            falta = "No se ingresó el Nombre de Usuario";
        }
        if (estado == true) {
            this.lectorBD(estado, falta);
        } else {
            exito = false;
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession(true);
        PrintWriter out = response.getWriter();
        ban = Integer.parseInt(request.getParameter("ban"));
        switch (ban) {
            case 0:
                this.validar(request.getParameter("nombre"), request.getParameter("hash"));
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());

                try {
                    String rol = "";
                    obj.conectar();
                    ResultSet rset = obj.consulta("select rol from usuarios where nombre = '" + request.getParameter("nombre") + "' ");
                    while (rset.next()) {
                        rol = rset.getString(1);
                    }
                    obj.cierraConexion();
                    sesion.setAttribute("rol", rol);
                } catch (Exception e) {
                }

                sesion.setAttribute("otra_var", request.getParameter("hash"));
                response.setContentType("text/html;charset=UTF-8");

                if (exito == true) {
                    try {
                        obj.conectar();
                        qry = "insert into entradas values('0','" + request.getParameter("nombre") + "','" + df.format(new java.util.Date()) + "','" + df2.format(new java.util.Date()) + "','1');";
                        insertar = obj.insertar(qry);
                        obj.cierraConexion();
                    } catch (SQLException ex) {
                        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    response.sendRedirect(response.encodeRedirectURL("ubi_dgo.jsp"));
                } else {
                    try {
                        obj.conectar();
                        qry = "insert into entradas values('0','" + request.getParameter("nombre") + "','" + df.format(new java.util.Date()) + "','" + df2.format(new java.util.Date()) + "','0');";
                        insertar = obj.insertar(qry);
                        obj.cierraConexion();
                    } catch (SQLException ex) {
                        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    sesion.setAttribute("info", "Datos no validos");
                    response.sendRedirect(response.encodeRedirectURL("index.jsp"));
                }
                break;
            case 1:

                break;
            case 3:

                break;
            case 4:

                break;
            case 5:

                break;
            case 6:

                break;
            default:

                break;
        }

    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession(true);
        PrintWriter out = response.getWriter();
        ban = Integer.parseInt(request.getParameter("ban"));
        // id_clave_med=request.getParameter("id_clave");
        switch (ban) {
            case 1:
                AttNombre = request.getParameter("nombre");
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());

                sesion.setAttribute("otra_var", request.getParameter("hash"));
                response.setContentType("text/html;charset=UTF-8");

                request.setAttribute("message", "");
                //request.getRequestDispatcher("ubic_dis1_CON.jsp").forward(request, response);
                response.sendRedirect(response.encodeRedirectURL("ubic_dis1_CON.jsp"));
                break;
            case 2:
                AttNombre = request.getParameter("nombre");
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());

                response.sendRedirect(response.encodeRedirectURL("equipo_alm_dgo.jsp"));
                break;
            case 3:
                AttNombre = request.getParameter("nombre");
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());

                response.sendRedirect(response.encodeRedirectURL("equipo_alm_dgo_farm.jsp"));
                break;
            case 4:
                AttNombre = request.getParameter("nombre");
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());

                response.sendRedirect(response.encodeRedirectURL("entrega.jsp"));
                break;
            case 5:
                AttNombre = request.getParameter("nombre");
                id_clave_med = request.getParameter("id_clave");
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());
                sesion.setAttribute("id_clave", this.id_clave_med);
                sesion.setAttribute("cb", request.getParameter("cb"));

                response.sendRedirect(response.encodeRedirectURL("modifica_inv_alm_cb.jsp"));

                break;
            case 6:
                AttNombre = request.getParameter("nombre");
                hora_inv = request.getParameter("hora_ini_vi");
                equi = request.getParameter("equi_vi");
                integran = request.getParameter("integran_vi");
                lugar = request.getParameter("lugar_vi");
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());
                sesion.setAttribute("hora_ini_vi", this.hora_inv);
                sesion.setAttribute("equi_vi", this.equi);
                sesion.setAttribute("integran_vi", this.integran);
                sesion.setAttribute("lugar_vi", this.lugar);

                response.sendRedirect(response.encodeRedirectURL("consulta2_inv2.jsp"));
                break;
            case 7:
                AttNombre = request.getParameter("nombre");
                id_pro = request.getParameter("id_prov");
                hora_inv = request.getParameter("hora_ini_vi");
                equi = request.getParameter("equi_vi");
                integran = request.getParameter("integran_vi");
                lugar = request.getParameter("lugar_vi");
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());
                sesion.setAttribute("id_prov", this.id_pro);
                sesion.setAttribute("hora_ini_vi", this.hora_inv);
                sesion.setAttribute("equi_vi", this.equi);
                sesion.setAttribute("integran_vi", this.integran);
                sesion.setAttribute("lugar_vi", this.lugar);

                response.sendRedirect(response.encodeRedirectURL("modifica_inv_alm_dgo.jsp"));

                break;
            case 8:
                AttNombre = request.getParameter("nombre");
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());

                sesion.setAttribute("ban", "1");
                sesion.setAttribute("Submit", "Buscar");
                sesion.setAttribute("txtf_cb", request.getParameter("cb"));

                sesion.setAttribute("otra_var", request.getParameter("hash"));
                response.sendRedirect(response.encodeRedirectURL("ubi_dgo.jsp"));
                break;
            case 9:
                AttNombre = request.getParameter("nombre");
                sesion.setAttribute("nombre", this.AttNombre);
                sesion.setAttribute("ape", this.AttAppe);
                sesion.setAttribute("valida", "valida");
                sesion.setAttribute("id", sesion.getId());
                sesion.setAttribute("ban", "1");
                sesion.setAttribute("Submit", "Por Clave");
                sesion.setAttribute("txtf_clave1", request.getParameter("clave"));

                sesion.setAttribute("otra_var", request.getParameter("hash"));
                response.setContentType("text/html;charset=UTF-8");

                request.setAttribute("message", "");
                //request.getRequestDispatcher("ubic_dis1_CON.jsp").forward(request, response);
                response.sendRedirect(response.encodeRedirectURL("ubic_dis1_CON.jsp"));
                break;
            case 10:

                break;
            case 11:

                break;
            default:

                break;
        }

    }// end of doGet
}// end of the Class
