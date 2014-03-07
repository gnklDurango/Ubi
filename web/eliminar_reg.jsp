<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" session="true"%>

<%
    HttpSession sesion = request.getSession();
//out.print("Id de sesion: "+sesion.getId());
    String val1 = "", user = "", id_sesion = "";

    String recibe_id_jv = (String) session.getAttribute("id_clave");
//out.print(recibe_id_jv);

//out.print(sesion.getAttribute("valida"));
    if (sesion.getAttribute("valida") != null) {
        val1 = (String) sesion.getAttribute("valida");
        user = (String) sesion.getAttribute("nombre");
        id_sesion = (String) sesion.getAttribute("id");
        out.print(val1 + "---" + user);
    }

//out.print(user);
    if (!val1.equals("valida")) {
        //out.print("regresa al index");
%>
<script>self.location = 'index.jsp';</script>
<%
    }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% java.util.Calendar currDate = new java.util.GregorianCalendar();
    // add 1 to month because Calendar's months start at 0, not 1
    int month = currDate.get(currDate.MONTH) + 1;
    int day = currDate.get(currDate.DAY_OF_MONTH);
    int year = currDate.get(currDate.YEAR);
    String date = "";
    String res = "";

    if (month >= 1 && month <= 9) {
        res = "0" + month;
// month=Integer.parseInt(res);
        date = " " + day;
        date = date + "/" + res;
        date = date + "/" + year;

        //out.print(""+res); 
    } else {
        date = " " + day;
        date = date + "/" + month;
        date = date + "/" + year;
        res += month;
    }

%>
<%
    /*---------------------------------------------------------------------------------
     Nombre del Archivo: eliminar_reg.jsp
     Fecha:2010
     Autor: RHW
     ---------------------------------------------------------------------------------*/
    String usu_jv = "";
    try {
        usu_jv = request.getParameter("usuario");
        //only = request.getParameter("id_only");      			   
    } catch (Exception e) {
    }

    String id_prov_jv = "0";
    try {
        id_prov_jv = request.getParameter("id_clave");
    } catch (Exception e) {
    }
    String fol2_jv = "";
    try {
        fol2_jv = request.getParameter("fol_vi");
    } catch (Exception e) {
    }

    String provee_jv = "";
    try {
        provee_jv = request.getParameter("prove_vi");
    } catch (Exception e) {
    }

    String folgnk_vi_jv = "";
    try {
        folgnk_vi_jv = request.getParameter("fol_gnk_vi");
    } catch (Exception e) {
    }

    String recibe_jv = "";
    try {
        recibe_jv = request.getParameter("recib_vi");
    } catch (Exception e) {
    }

    String entrega_jv = "";
    try {
        entrega_jv = request.getParameter("entreg_vi");
    } catch (Exception e) {
    }

    String capturar_jv = "";
    try {
        capturar_jv = request.getParameter("captu_vi");
    } catch (Exception e) {
    }

    String ubic_jv = "";
    try {
        ubic_jv = request.getParameter("ubic_vi");
    } catch (Exception e) {
    }

    String origen_jv = "";
    try {
        origen_jv = request.getParameter("orig_vi");
    } catch (Exception e) {
    }

    String obser_jv = "";
    try {
        obser_jv = request.getParameter("obser_vi");
    } catch (Exception e) {
    }

    String boolDocRem_jv = "";
    try {
        boolDocRem_jv = request.getParameter("boolDocRem_vi");
    } catch (Exception e) {
    }

    ResultSet rset = null;
    Statement stmt = null;
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection conn_001 = DriverManager.getConnection("jdbc:mysql://localhost/dgo", "root", "eve9397");
    stmt = conn_001.createStatement();

    rset = stmt.executeQuery("SELECT STR_TO_DATE('" + date + "', '%d/%m/%Y')");
    while (rset.next()) {
        date = rset.getString("STR_TO_DATE('" + date + "', '%d/%m/%Y')");
    }

%>
<%!
    String clave1_jv = "", descrip1_jv = "", lote21_jv = "", cad21_jv = "", ubi1_jv = "", cajas1_jv = "", pzas1_jv = "", resto1_jv = "", exi1_jv = "";

    String pass_jv = "";
    int correct1 = 0;

    public int ban = 0;

    public void eliminarReg(String id_rem, int ban) {

        System.out.print("valor" + id_rem);
        //int aux=0;
        //aux=Integer.parseInt(request.getParameter("id_dat_aux"));
        if (ban == 1) {
            System.out.print("dato eliminado" + id_rem);
            String idDS = "0";
            idDS = id_rem;

            //veces=1;
            ResultSet rset__002 = null;
            Statement stmt__001 = null;

            ResultSet rset_elimDS = null;
            Statement stmt_elimDS = null;
            try {

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/dgo", "root", "eve9397");

                stmt_elimDS = conn.createStatement();
                stmt__001 = conn.createStatement();
                System.out.print("id2" + idDS);

                rset__002 = stmt__001.executeQuery("select clave,descr,lote,cadu,ubi,cant,cajas,piezas,resto from datos_inv_cod where id_cap_inv='" + id_rem + "'");

                //out.print("clave"+folgnk_jv);
                while (rset__002.next()) {
                    clave1_jv = rset__002.getString("clave");
                    descrip1_jv = rset__002.getString("descr");
                    lote21_jv = rset__002.getString("lote");
                    //lote_aux1_jv=rset__002.getString("lote");
                    cad21_jv = rset__002.getString("cadu");
                    ubi1_jv = rset__002.getString("ubi");
                    exi1_jv = rset__002.getString("cant");
                    cajas1_jv = rset__002.getString("cajas");
                    pzas1_jv = rset__002.getString("piezas");
                    resto1_jv = rset__002.getString("resto");
                }
                try {
                    stmt_elimDS.execute("update datos_inv_cod set cant='0', cajas='0', piezas='0', resto='0' WHERE id_cap_inv='" + id_rem + "'");
                    while (rset_elimDS.next()) {
                        rset_elimDS.deleteRow();
                    }
                    //System.out.println("update datos_inv_cod set cant='0', cajas='0', piezas='0', resto='0' WHERE id_cap_inv='" + id_rem + "'");
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }
                //
                //System.out.print("Entra");

                conn.close();

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

        }
    }%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Untitled Document</title>
    </head>

    <body>
        <form action="ubi_dgo.jsp">
            <%                out.println(id_prov_jv);
                eliminarReg(id_prov_jv, 1);
                try {
                    if (!id_prov_jv.equals("0")) {
                        correct1 = 4;

                        stmt.execute("insert into eliminar_dgo values ('" + user + "','" + correct1 + "','" + date + "','" + clave1_jv + "','" + descrip1_jv + "','" + lote21_jv + "','" + cad21_jv + "','" + ubi1_jv + "','" + cajas1_jv + "','" + pzas1_jv + "','" + resto1_jv + "','" + exi1_jv + "',0)");

            %>
            <script>
                alert("El dato a sido Eliminado");
                self.location = 'ubi_dgo.jsp'
            </script>
            <%} else {%><script>
                self.location = 'http://localhost/gnk/u_bi.jsp'
                self.location = 'ubi_dgo.jsp'

            </script>
            <%
                    }
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>

        </form>
    </body>

</html>
