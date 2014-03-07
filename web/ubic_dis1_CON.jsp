<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date"  import="java.text.NumberFormat" import="java.util.Locale" errorPage="" session="true"%>
<%
    final DecimalFormat df = new DecimalFormat("###,###,##0", DecimalFormatSymbols.getInstance(Locale.ENGLISH));
    HttpSession sesion = request.getSession();
//out.print("Id de sesion: "+sesion.getId());
    String val = "", user = "", id_sesion = "";
    int rol = 0;

//out.print(sesion.getAttribute("valida"));
    if (sesion.getAttribute("valida") != null) {
        val = (String) sesion.getAttribute("valida");
        user = (String) sesion.getAttribute("nombre");
        id_sesion = (String) sesion.getAttribute("id");
        //out.print(val + "---" + user);
        rol = Integer.parseInt(((String) sesion.getAttribute("rol")));
    }

//out.print(user);
    if (!val.equals("valida")) {
        //out.print("regresa al index");
%>
<script>self.location = 'index.jsp';</script>
<%
    }
%>
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

<%    /*------------------------------------------------------------------------------------
     Nombre del Archivo: ubic_dis1_CON.jsp
     Fecha:2010
     Diseño:DPSL
     Autor: RHW
     ------------------------------------------------------------------------------------*/
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection conn_001 = DriverManager.getConnection("jdbc:mysql://localhost/dgo", "root", "eve9397");
    Statement stmt_001 = conn_001.createStatement();
    Connection conn_sed = DriverManager.getConnection("jdbc:mysql://localhost/dgo", "root", "eve9397");
    Statement stmt_sed = conn_sed.createStatement();

    //stmt_001.execute("commit");
    String exis[] = new String[5000];//array for save the ubi
    ResultSet rset_001 = null;
//variable para POR UBICAR
    int pos_cla = 0, pos_lot = 0, cantm_int = 0, restoubi_int = 0, num_pzas = 0, exis_calc = 0, cajass = 0;
    String cla_ves[] = new String[5000];//array for store the claves	
    String cad1[] = new String[5000];

    String lot_es[] = new String[5000];//array for store the lotes
    String cantm = "", resto_ubicar = "0";
    int no_pzas_mov = 0, total_exis = 0, restoubicar_int = 0;
//variables para ubicar en dos posiciones
    String caj_a_mov = "0", resto_ubi = "0", cont_cant = "0", recibe_descr = "";
    String recibe_marca = "", recibe_um = "", recibe_cmarca = "", recibe_cum = "", codigo_jv = "", folio_gnkl = "", folio_remi = "", recibe_date = "", orden_compra = "", fec_fab = "", observaciones = "";

    rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('" + date + "', '%d/%m/%Y')");
    while (rset_001.next()) {
        date = rset_001.getString("STR_TO_DATE('" + date + "', '%d/%m/%Y')");
    }

//variables que se utilizan para cuando sean iguales lo que se va a mover con lo que haya en la ubicación, misma clave, lote, etc
    int iguales_porcamb = 0, iguales_resto = 0, totales_cajas = 0, totales_resto = 0, npzas_iguales = 0, exis_iguales = 0;
    String resto_porcamb = "";
//-------------		

    String clave = "", clave1 = "", ubi = "r";
    String but = "r";
    //variables para el calculo de la disminución de cant
    String recibe_cant = "", recibe_ubi = "", recibe_clave = "", recibe_lote = "", recibe_cadu = "", recibe_nocajas = "", recibe_resto = "", desdmed_jv = "", recibe_id = "", descripmed_jv = "", clave2_jv = "";

//variables para el segundo query del método de ubicar
    String recibe_cant2 = "", recibe_ubi2 = "", recibe_clave2 = "", recibe_lote2 = "", recibe_cadu2 = "", recibe_nocajas2 = "", recibe_npzas2 = "", recibe_resto2 = "", recibe_id2 = "";

//variables para realizar el cáculo cuando la datos concuerden en la misma ubicación
    int total_caj = 0, total_res = 0, total_exi = 0, suma_nocajas = 0, suma_resto = 0, suma_exi = 0, suma_nocajas2 = 0, suma_resto2 = 0, suma_exi2 = 0;

    int calcula = 0, total = 0, exist = 0, x1 = 0, tam2 = 0;
    int ban = 0, pos = 0, cont = 0;
    String lote = "", ubic = "", dis = "", ubicar = "";
    String resto_txtf = "", recibe_res = "";
    //toma el valor del resto en la tabla
    int restos_txtf = 0;
    //toma el valor del txtfield asociado
    int resto_valor = 0;
    //variable que toma el valor de la disminución entre el valor del resto de la tabla y lo que el usuario introduce
    int total_resto = 0;
    //variable que toma el valor de no pzas de la tabla
    String recibe_npzas = "";

    int npzas = 0, total_npzas = 0;
    String no_cajas = "";
    String var_resto = "", var_resto2 = "";
    int resto = 0, resto2 = 0;

    //suma para existencia
    int suma_existencia = 0, existencia_jv = 0;

    //variables para la bitacora
    ResultSet rset_002 = null;
    String clave1_jv = "", descrip1_jv = "", lote21_jv = "", cad21_jv = "", ubi1_jv = "", cajas1_jv = "", pzas1_jv = "", resto1_jv = "", exi1_jv = "", descrip_jv = "", cad2_jv = "";
    int correct1 = 0;
    String usu_jv = "";
    try {
        usu_jv = request.getParameter("usuario");
        //only = request.getParameter("id_only");      			   
    } catch (Exception e) {
    }
//fin de variables

    int cajas = 0;
    try {
        but = "" + request.getParameter("Submit");
        //altaOK="no";
    } catch (Exception e) {
        System.out.print("not");
    }

    try {
        if (sesion.getAttribute("ban").equals("1")) {
            but = (String) sesion.getAttribute("Submit");
        }
    } catch (Exception e) {
    }

    if (but.equals("Por Descripción")) {
        desdmed_jv = request.getParameter("txtf_descmed");

        rset_001 = stmt_001.executeQuery("select * from clave_med where descrip like'%" + desdmed_jv + "%' ");

        while (rset_001.next()) {
            cad1[tam2] = rset_001.getString("descrip");
            tam2++;
        }

    }
    if (but.equals("Ver")) {
        descripmed_jv = request.getParameter("select_servi2");

        rset_001 = stmt_001.executeQuery("select * from clave_med where descrip='" + descripmed_jv + "' ");

        while (rset_001.next()) {
            clave1 = rset_001.getString("clave");
            //cont2++;
        }
    }

    if (but.equals("Por Clave")) {

        clave1 = request.getParameter("txtf_clave1");

        try {
            if (sesion.getAttribute("ban").equals("1")) {
                clave1 = (String) sesion.getAttribute("txtf_clave1");
                sesion.setAttribute("ban", "0");
            }
        } catch (Exception e) {
        }

        if (clave1.equals("")) {
%>
<script>
    alert('CAMPO VACÍO, Ingrese una CLAVE por BUSCAR');
</script>
<%
        } else

            correct1 = 2;
        pos = 0;
        rset_001 = stmt_001.executeQuery("select ubi from datos_inv_cod where clave='" + clave1 + "';");
        while (rset_001.next()) {
            exis[pos] = rset_001.getString("ubi");
            System.out.print(exis[pos]);
            pos++;

        }
        stmt_001.execute("insert into consultas_dgo values ('" + user + "','" + correct1 + "','" + clave1 + "','" + date + "',0)");

        ban = 5;

    }

    if (but.equals("Buscar")) {
        clave = request.getParameter("txtf_clave");
        lote = request.getParameter("txtf_lote");
        if (clave.equals("") || lote.equals("")) {
%>
<script>
    alert('CAMPO VACÍO, Ingrese una CLAVE o LOTE por BUSCAR');
</script>
<%
        } else
            pos = 0;
        rset_001 = stmt_001.executeQuery("select ubi from datos_inv_cod where clave='" + clave + "' and lote='" + lote + "';");
        while (rset_001.next()) {
            exis[pos] = rset_001.getString("ubi");
            System.out.print(exis[pos]);
            pos++;

        }

        ban = 1;
    }
    if (but.equals("Mostrar por Clave")) {
        clave1 = request.getParameter("txtf_clave1");
        ubic = request.getParameter("txtf_ubi");
        if (clave1.equals("") || ubic.equals("")) {
%>
<script>
    alert('CAMPO VACÍO, Ingrese una CLAVE VÁLIDA');
</script>
<%
        } else {
            rset_001 = stmt_001.executeQuery("select resto from datos_inv_cod where clave='" + clave1 + "' and ubi='" + ubic + "';");
            while (rset_001.next()) {
                var_resto2 = rset_001.getString("resto");
                resto2 = Integer.parseInt(var_resto2);
            }
        }

        ban = 6;
    }

    if (but.equals("Mostrar Registro")) {
        clave = request.getParameter("txtf_clave");
        lote = request.getParameter("txtf_lote");
        ubic = request.getParameter("txtf_ubi");
        if (clave.equals("") || lote.equals("") || ubic.equals("")) {
%>
<script>
    alert('CAMPO VACÍO, Ingrese una UBICACIÓN VÁLIDA');
</script>
<%
        } else {
            rset_001 = stmt_001.executeQuery("select resto from datos_inv_cod where clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubic + "';");
            while (rset_001.next()) {
                var_resto2 = rset_001.getString("resto");
                resto2 = Integer.parseInt(var_resto2);
            }
        }
        ban = 2;
    }
    if (but.equals("Disminuir")) {

        correct1 = 7;

        clave = request.getParameter("txtf_clave");
        lote = request.getParameter("txtf_lote");
        ubic = request.getParameter("txtf_ubi");
        dis = request.getParameter("txtf_dis");
        resto_txtf = request.getParameter("txtf_resto");

        if (clave.equals("") || lote.equals("") || ubic.equals("") || dis.equals("") || resto_txtf.equals("")) {
%>
<script>
    alert('CAMPO VACÍO, Ingrese una CLAVE o LOTE por BUSCAR');
</script>
<%
} else {
    rset_001 = stmt_001.executeQuery("select cajas,piezas,resto,descr,cadu from datos_inv_cod where clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubic + "';");
    while (rset_001.next()) {
        recibe_cant = rset_001.getString("cajas");
        recibe_res = rset_001.getString("resto");
        recibe_npzas = rset_001.getString("piezas");
        descrip_jv = rset_001.getString("descr");
        cad2_jv = rset_001.getString("cadu");
    }
    npzas = Integer.parseInt(recibe_npzas);

    calcula = Integer.parseInt(recibe_cant);
    exist = Integer.parseInt(dis);
    total = calcula - exist;
    //calcula el resto

    restos_txtf = Integer.parseInt(recibe_res);//contiene el valor actual de la tabla
    resto_valor = Integer.parseInt(resto_txtf);//contiene el valor del txtfield que se va a dismuinuir
    total_resto = restos_txtf - resto_valor;//operación de disminución del resto, se asignará a la tabla por medio de un update

//calcula la existencia
    total_npzas = (total * npzas) + total_resto;

    if ((exist > calcula) || (resto_valor > restos_txtf)) {
%>
<script>
    alert('OPERACIÓN INVÁLIDA, CANTIDAD A DISMINUIR ES MAYOR QUE EXISTENCIAS');
</script>
<%
            } else {
                rset_002 = stmt_001.executeQuery("select clave,descr,lote,cadu,ubi,cant,cajas,piezas,resto from datos_inv_cod where clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubic + "'");

                //out.print("clave"+folgnk_jv);
                while (rset_002.next()) {
                    clave1_jv = rset_002.getString("clave");
                    descrip1_jv = rset_002.getString("descr");
                    lote21_jv = rset_002.getString("lote");
                    //lote_aux1_jv=rset_002.getString("lote");
                    cad21_jv = rset_002.getString("cadu");
                    ubi1_jv = rset_002.getString("ubi");
                    exi1_jv = rset_002.getString("cant");
                    cajas1_jv = rset_002.getString("cajas");
                    pzas1_jv = rset_002.getString("piezas");
                    resto1_jv = rset_002.getString("resto");

                }

                stmt_001.execute("update datos_inv_cod set cajas='" + total + "',resto='" + total_resto + "',cant='" + total_npzas + "' where clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubic + "';");
                System.out.print("el valor es:" + total);
                ban = 2;

                stmt_001.execute("insert into disminuir_dgo values ('" + user + "','" + correct1 + "','" + date + "','" + clave1_jv + "','" + descrip1_jv + "','" + lote21_jv + "','" + cad21_jv + "','" + ubi1_jv + "','" + cajas1_jv + "','" + pzas1_jv + "','" + resto1_jv + "','" + exi1_jv + "','" + clave + "','" + descrip_jv + "','" + lote + "','" + cad2_jv + "','" + ubic + "','" + total + "','" + recibe_npzas + "','" + total_resto + "','" + total_npzas + "',0)");
            }
        }//fin else 
    }

    if (but.equals("Ubicar")) {
        correct1 = 6;

        clave = request.getParameter("txtf_clave");
        lote = request.getParameter("txtf_lote");
        ubic = request.getParameter("txtf_ubi");
        dis = request.getParameter("txtf_dis");
        ubicar = request.getParameter("txtf_ubic");

        //nuevo proceso
        cantm = request.getParameter("txtf_cantm");
        resto_ubi = request.getParameter("txtf_resto3");

        if (clave.equals("") || lote.equals("") || ubic.equals("") || ubicar.equals("") || cantm.equals("") || resto_ubi.equals("")) {
%>
<script>
    alert('CAMPO VACÍO, Ingrese una CANTIDAD o RESTO por UBICAR, GRACIAS POR FAVOR');
</script>
<%
} else {

    rset_002 = stmt_001.executeQuery("select clave,descr,lote,cadu,ubi,cajas,piezas,resto,cant from datos_inv_cod where equipo like '%al%' and clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubicar + "';");

    //out.print("clave"+folgnk_jv);
    while (rset_002.next()) {
        clave1_jv = rset_002.getString("clave");
        descrip1_jv = rset_002.getString("descr");
        lote21_jv = rset_002.getString("lote");
        //lote_aux1_jv=rset_002.getString("lote");
        cad21_jv = rset_002.getString("cadu");
        ubi1_jv = rset_002.getString("ubi");
        exi1_jv = rset_002.getString("cant");
        cajas1_jv = rset_002.getString("cajas");
        pzas1_jv = rset_002.getString("piezas");
        resto1_jv = rset_002.getString("resto");

    }
    //**--toma los valores de la ubicación a donde se va a poner en el almacén -----------------------------//
    rset_001 = stmt_sed.executeQuery("select clave,lote,cadu,ubi,cajas,piezas,resto,cant,marca,um,origen,coincidir_um from datos_inv_cod where equipo like '%al%' and clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubicar + "';");
    while (rset_001.next()) {
        recibe_clave = rset_001.getString("clave");
        recibe_lote = rset_001.getString("lote");
        recibe_cadu = rset_001.getString("cadu");
        recibe_ubi = rset_001.getString("ubi");
        recibe_nocajas = rset_001.getString("cajas");
        recibe_npzas = rset_001.getString("piezas");
        recibe_res = rset_001.getString("resto");
        recibe_cant = rset_001.getString("cant");
        recibe_marca = rset_001.getString("marca");
        recibe_um = rset_001.getString("um");
        recibe_cmarca = rset_001.getString("origen");
        recibe_cum = rset_001.getString("coincidir_um");

    }
    if (!(recibe_nocajas.equals("")) && !(recibe_res.equals("")) && !(recibe_cant.equals(""))) {
        suma_nocajas = Integer.parseInt(recibe_nocajas);
        suma_resto = Integer.parseInt(recibe_res);
        suma_exi = Integer.parseInt(recibe_cant);
    }
//**--------------------------------------------------------------**//			  

    //query para tomar los valores que se van a ubicar
    rset_001 = stmt_sed.executeQuery("select * from datos_inv_cod where clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubic + "';");
    while (rset_001.next()) {
        codigo_jv = rset_001.getString("cod_bar");
        recibe_clave2 = rset_001.getString("clave");
        recibe_lote2 = rset_001.getString("lote");
        recibe_descr = rset_001.getString("descr");
        recibe_cadu2 = rset_001.getString("cadu");
        recibe_ubi2 = rset_001.getString("ubi");
        recibe_nocajas2 = rset_001.getString("cajas");
        recibe_npzas2 = rset_001.getString("piezas");
        recibe_resto2 = rset_001.getString("resto");
        recibe_cant2 = rset_001.getString("cant");
        recibe_id2 = rset_001.getString("id_cap_inv");
        recibe_marca = rset_001.getString("marca");
        recibe_um = rset_001.getString("um");
        recibe_cmarca = rset_001.getString("origen");
        recibe_cum = rset_001.getString("coincidir_um");
        recibe_date = rset_001.getString("date");
        folio_gnkl = rset_001.getString("folio_gnk");
        folio_remi = rset_001.getString("folio_remi");
        orden_compra = rset_001.getString("orden_compra");
        fec_fab = rset_001.getString("fec_fab");
        observaciones = rset_001.getString("observaciones");

    }
    suma_nocajas2 = Integer.parseInt(recibe_nocajas2);
    suma_resto2 = Integer.parseInt(recibe_resto2);
    suma_exi2 = Integer.parseInt(recibe_cant2);
//**--------------------------------------------------------------**//	
    cantm_int = Integer.parseInt(cantm);//toma el valor del textfield No cajas a mov
    restoubi_int = Integer.parseInt(resto_ubi);//toma el valor del resto a sumar
    //--- Condicionante para cuando sean iguales lo que se va a cambiar y lo que haya en la ubicación 
    if ((recibe_clave.equals(recibe_clave2)) && (recibe_lote.equals(recibe_lote2)) && (recibe_cadu.equals(recibe_cadu2)) && (recibe_ubi.equals(ubicar))) {
        //proceso para sumar hacia la ubi con datos iguales

        if ((cantm_int > suma_nocajas2) || (restoubi_int > suma_resto2)) {
%>  
<script>
    alert("ERROR DE CAPTURA, ESCOJA UNA CANTIDAD MENOR O IGUAL POR DISMINUIR,GRACIAS POR FAVOR");
</script>
<%
    }//fin del if mayor
    else {
        total_caj = suma_nocajas + cantm_int;
        total_res = suma_resto + restoubi_int;
        num_pzas = Integer.parseInt(recibe_npzas2);//toma el valor del num de pzas de lo que se va a mover
        exis_calc = (cantm_int * num_pzas) + restoubi_int;

        total_exi = suma_exi + exis_calc;
        stmt_sed.execute("update datos_inv_cod set cajas='" + total_caj + "',resto='" + total_res + "',cant='" + total_exi + "' where clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubicar + "';");
//resta la cantidad de cajas a mover de la ubicación

        iguales_porcamb = Integer.parseInt(cantm);//toma el valor del txtf_cantm (lo que se va a restar del total de la clave)
        totales_cajas = suma_nocajas2 - iguales_porcamb;

        //disminuye el resto
        iguales_resto = Integer.parseInt(resto_ubi);
        totales_resto = suma_resto2 - iguales_resto;

        //calcula la nueva existencia
        npzas_iguales = Integer.parseInt(recibe_npzas2);
        exis_iguales = (totales_cajas * npzas_iguales) + totales_resto;

        stmt_sed.execute("update datos_inv_cod set cajas='" + totales_cajas + "',resto='" + totales_resto + "',cant='" + exis_iguales + "' where id_cap_inv='" + recibe_id2 + "';");

        if ((totales_cajas == 0) && (totales_resto == 0) && (exis_iguales == 0)) {
            stmt_sed.execute("delete from datos_inv_cod where id_cap_inv='" + recibe_id2 + "';");
        }

    }//
    //stmt_001.execute("delete from datos_inv_cod where id_cap_inv='"+recibe_id2+"';");
} else {
//operación para calcular la existencia del nuevo registro
    cont_cant = request.getParameter("txtf_cantm");
    cajass = Integer.parseInt(cantm);
    no_pzas_mov = Integer.parseInt(recibe_npzas2);
    resto_ubicar = request.getParameter("txtf_resto3");
    restoubicar_int = Integer.parseInt(resto_ubicar);

    total_exis = (cajass * no_pzas_mov) + restoubicar_int;

    if ((cantm_int <= suma_nocajas2) && (suma_resto2 >= restoubicar_int)) {
//descontamos las cajas totales menos las cajas que van a salir
        int exis_new = suma_nocajas2 - cajass;
        int restoss = Integer.parseInt(resto_ubi);
        int rest_new = suma_resto2 - restoss;
        int total_exis2 = (exis_new * no_pzas_mov) + rest_new;

        stmt_001.execute("insert into ubica_dgo values ('" + user + "','" + correct1 + "','" + date + "','" + recibe_clave2 + "','" + recibe_descr + "','" + recibe_lote2 + "','" + recibe_cadu2 + "','" + recibe_ubi2 + "','" + recibe_nocajas2 + "','" + recibe_npzas2 + "','" + recibe_resto2 + "','" + recibe_cant2 + "','" + exis_new + "','" + recibe_npzas2 + "','" + rest_new + "','" + total_exis2 + "','" + ubicar + "','" + cont_cant + "','" + recibe_npzas2 + "','" + resto_ubi + "','" + total_exis + "',0)");
//insert para meter a la tabla la nueva ubicación pero como registro ubicar
        stmt_sed.execute("insert into datos_inv_cod values ('" + codigo_jv + "','" + recibe_clave2 + "','" + recibe_lote2 + "','" + recibe_descr + "','" + recibe_cadu2 + "','" + ubicar + "','" + total_exis + "','ALMACEN','" + user + "','" + recibe_date + "','BODEGA',0,'" + cont_cant + "','" + recibe_npzas2 + "','" + resto_ubi + "','" + recibe_marca + "','" + recibe_um + "','" + recibe_cmarca + "','" + recibe_cum + "','" + folio_gnkl + "','" + folio_remi + "','" + orden_compra + "','" + fec_fab + "','" + observaciones + "')");

        stmt_sed.execute("update datos_inv_cod set cajas='" + exis_new + "',resto='" + rest_new + "',cant='" + total_exis2 + "' where clave='" + recibe_clave2 + "' and lote='" + recibe_lote2 + "' and ubi='" + ubic + "';");

        if ((exis_new == 0) && (rest_new == 0) && (total_exis2 == 0)) {
            stmt_sed.execute("delete from datos_inv_cod where id_cap_inv='" + recibe_id2 + "';");
        }
        System.out.print("ubi:" + ubic);
        ban = 3;
    } else {
%>
<script>
    alert('Las cantidades a mover sin incorrectas');
</script>
<%
                }
            }
            ban = 3;
        }//fin else 
    }

    if (but.equals("Por Ubicar")) {
        ban = 4;
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <!-- DW6 -->
    <head>
        <script src="list02.js" type="text/javascript"></script>
        <!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
        <title>Ubicaci&oacute;n en ALMAC&Eacute;N</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="mm_entertainment.css" type="text/css" />
        <style type="text/css">
            <!--
            .style1 {color: #333333}
            .style5 {color: #003300;
                     font-family: Verdana, Arial, Helvetica, sans-serif;
                     font-size: 12px;
            }
            .style6 {font-size: 12px;
                     color: #003300;
                     font-weight: bold;
            }
            .style7 {color: #FFFFFF}
            -->
        </style>
    </head>
    <body bgcolor="#ffffff">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
            <tr bgcolor="02021e">
                <td height="25" nowrap="nowrap" bgcolor="#FFFFFF"><table width="91%" border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
                        <tr bgcolor="02021e">
                            <td colspan="2" rowspan="2" nowrap="nowrap" bgcolor="#FFFFFF">&nbsp;</td>
                            <td width="91%" height="50" colspan="3" valign="bottom" nowrap="nowrap" bgcolor="#FFFFFF" class="enc" id="logo"><div align="center"><img src="imagenes/logo_conjun.jpg" alt="hosp" width="343" height="91" /></div></td>
                        </tr>
                        <tr bgcolor="02021E">
                            <td height="44" colspan="3" align="center" valign="bottom" nowrap="nowrap" background="imagenes/fondo.jpg" bgcolor="#FFFFFF" id="tagline"><h2 align="center"><span class="di">SISTEMA DE UBICACI&Oacute;N Y DISMINUCIONES</span></h2></td>
                        </tr>
                        <tr>
                            <td colspan="5" bgcolor="#cc3300"></td>
                        </tr>
                        <tr>
                            <td height="21" colspan="5" bordercolor="#FFFFFF"><div align="center" class="subHeader style5"><span class="style6">&nbsp;ALMAC&Eacute;N GNK LOG&Iacute;STICA - CEDIS DURANGO </span></div></td>
                        </tr>
                        <tr>
                            <td colspan="5" id="dateformat"></td>
                        </tr>
                    </table></td>
            </tr>

            <tr>
                <td bgcolor="#cc3300"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
            </tr>
            <tr>
                <td id="dateformat"></td>
            </tr>
        </table>
        <table>



            <tr>
                <td colspan="5" bgcolor="#cc3300"></td>
            </tr>

            <tr>
                <!-- td colspan="5" id="dateformat">&nbsp;<br /-->
                &nbsp; &nbsp; <!--a href="javascript:;">home</a--><br />	</td>
            </tr>
            <tr>
                <td width="24" valign="top">&nbsp;</td>
                <td colspan="2" valign="top" bordercolor="#711321">
                    <form method="post" name="form" action="ubic_dis1_CON.jsp">
                        <table width="1189" height="496" border="1" bordercolor="#003300">
                            <tr>
                                <td width="1179" height="29" class="subHeader"><div align="center">Introduzca Clave para localizarla dentro del Almac&eacute;n  </div></td>
                            </tr>
                            <tr>
                                <td class="bodyText"><p style="margin-top: 0;"><a href="http://localhost:8088/SIE">SALIR AL SIE</a>
                                        <p><span class="style1">BÚSQUEDA POR:</span>
                                            <p>Ingrese Descripci&oacute;n:<input type="text" name="txtf_descmed" size="20" value="<%=desdmed_jv%>" />                <input name="Submit" type="submit" class="but" value="Por Descripción" onClick="getfocus()"/>             
                                                <p>Seleccione Descripci&oacute;n:
                                                    <select name="select_servi2" size="1"  class="style2"  onKeyPress="return document.form.txtf_med1.focus();">
                                                        <option selected="selected">-----Seleccione Descripción-----</option>
                                                        <%

                                                            for (x1 = 0; x1 < tam2; x1++) {

                                                        %>
                                                        <option value="<%=cad1[x1]%>"><%=cad1[x1]%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>&nbsp;&nbsp;&nbsp;<input name="Submit" type="submit" class="but" value="Ver" onClick="getfocus()"/><br /> 
                                                    <span class="style1">Clave:</span> 
                                                    <input name="txtf_clave1" type="text" size="20" value="<%=clave1%>" />
                                                    <input type="submit" name="Submit" value="Por Clave" />
                                                    <input type="submit" name="Submit3" value="Mostrar por Clave" />
                                                    &nbsp;&nbsp;<a href="ubi_dgo.jsp" title="REGRESA A PROGRAMA DE UBICACIONES">IR A PROGRAMA DE UBICACIONES CON CÓDIGO DE BARRAS</a> &nbsp;EXPORTAR UBICACIONES<img src="imagenes/icono_excel.gif" border="0" usemap="#Map2"/>
                                                    <hr />	  
                                                    <span class="style1">Clave:</span>
                                                    <label>
                                                        <input name="txtf_clave" type="text" size="10" value="<%=clave%>" />
                                                        <span class="style1">Lote:</span> 
                                                        <input name="txtf_lote" type="text" size="10" value="<%=lote%>" />
                                                    </label>
                                                    <label>
                                                        <input type="submit" name="Submit" value="Buscar" />
                                                        <span class="style1">Ubicación:</span> 
                                                        <input name="txtf_ubi" type="text" size="5" value="<%=ubic%>" />
                                                        <select name="slct_ubi" onChange="putUbic2(this.form)">
                                                            <option>Ubi</option>
                                                            <% for (int x = 0; x < pos; x++) {
                                                            %>
                                                            <option value="<%=exis[x]%>"><%=exis[x]%></option>
                                                            <%
                                                                }
                                                            %> 
                                                        </select>
                                                        <input type="submit" name="Submit" value="Mostrar Registro" />
                                                    </label>
                                                    <!--span class="style1"> Todas las claves</span>
                                                    <label>
                                                    <!--input type="submit" name="Submit2" value="TODAS" /-->
                                                    </label>
                                                    <br /> 
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style1">Mostrar Claves sin Ubicaci&oacute;n:</span>
                                                    <input type="submit" name="Submit" value="Por Ubicar" />
                                                    <hr />	 
                                                </p>

                                                <% if (ban == 2) {
                                                        if (1 == 1) {
                                                            if (1 == 2) {
                                                %>		  
                                                <span class="style1">Cantidad Entregada:</span>
                                                <input name="txtf_dis" type="text" size="10"/>
                                                <%
                                                //if(resto2!=0)
                                                    //{
                                                %>
                                                <span class="style1">Resto:</span>
                                                <input name="txtf_resto" type="text" size="10" value="<%=resto2%>"/>
                                                <%
                                                          //}
                                                %> 

                                                <input type="submit" name="Submit" value="Disminuir" />
                                                <%
                                                    }
                                                    if (rol > 1) {
                                                %>
                                                <hr />
                                                <span class="style1">No.Cajas a Mover:&nbsp;</span>&nbsp;
                                                <input name="txtf_cantm" type="text" size="10" value="<%=cantm%>"/>
                                                &nbsp;<span class="style1">Resto:</span>&nbsp;<input name="txtf_resto3" type="text" size="10" value="<%=resto2%>"/>&nbsp;
                                                <span class="style1">Nueva Ubicación:</span>
                                                <input name="txtf_ubic" type="text" size="10" value="<%=ubic%>" readonly />
                                                <select name="slct_u" onChange="putUb(this.form)">
                                                    <option>--UBICACI&Oacute;N-</option>
                                                    <option value="A-1-I">A-1-I </option>
                                                    <option value="A-1-D">A-1-D </option>
                                                    <option value="A-2-I">A-2-I </option>
                                                    <option value="A-2-D">A-2-D </option>
                                                    <option value="A-3-I">A-3-I </option>
                                                    <option value="A-3-D">A-3-D </option>
                                                    <option value="A-4-I">A-4-I </option>
                                                    <option value="A-4-D">A-4-D </option>
                                                    <option value="A-5-I">A-5-I </option>
                                                    <option value="A-5-D">A-5-D </option>
                                                    <option value="A-6-I">A-6-I </option>
                                                    <option value="A-6-D">A-6-D </option>
                                                    <option value="A-7-I">A-7-I </option>
                                                    <option value="A-7-D">A-7-D </option>
                                                    <option value="A-8-I">A-8-I </option>
                                                    <option value="A-8-D">A-8-D </option>
                                                    <option value="A-9-I">A-9-I </option>
                                                    <option value="A-9-D">A-9-D </option>
                                                    <option value="A-10-I">A-10-I </option>
                                                    <option value="A-10-D">A-10-D </option>
                                                    <option value="A-11-I">A-11-I </option>
                                                    <option value="A-11-D">A-11-D </option>
                                                    <option value="A-12-I">A-12-I </option>
                                                    <option value="A-12-D">A-12-D </option>
                                                    <option value="A-13-I">A-13-I </option>
                                                    <option value="A-13-D">A-13-D </option>
                                                    <option value="A-14-I">A-14-I </option>
                                                    <option value="A-14-D">A-14-D </option>
                                                    <option value="A-15-I">A-15-I </option>
                                                    <option value="A-15-D">A-15-D </option>
                                                    <option value="A-16-I">A-16-I </option>
                                                    <option value="A-16-D">A-16-D </option>
                                                    <option value="A-17-I">A-17-I </option>
                                                    <option value="A-17-D">A-17-D </option>
                                                    <option value="A-18-I">A-18-I </option>
                                                    <option value="A-18-D">A-18-D </option>
                                                    <option value="A-19-I">A-19-I </option>
                                                    <option value="A-19-D">A-19-D </option>
                                                    <option value="A-20-I">A-20-I </option>
                                                    <option value="A-20-D">A-20-D </option>
                                                    <option value="A-21-I">A-21-I </option>
                                                    <option value="A-21-D">A-21-D </option>
                                                    <option value="A-22-I">A-22-I </option>
                                                    <option value="A-22-D">A-22-D </option>
                                                    <option value="A-23-I">A-23-I </option>
                                                    <option value="A-23-D">A-23-D </option>
                                                    <option value="A-24-I">A-24-I </option>
                                                    <option value="A-24-D">A-24-D </option>
                                                    <option value="A-25-I">A-25-I </option>
                                                    <option value="A-25-D">A-25-D </option>
                                                    <option value="A-26-I">A-26-I </option>
                                                    <option value="A-26-D">A-26-D </option>
                                                    <option value="A-27-I">A-27-I </option>
                                                    <option value="A-27-D">A-27-D </option>
                                                    <option value="A-28-I">A-28-I </option>
                                                    <option value="A-28-D">A-28-D </option>
                                                    <option value="A-29-I">A-29-I </option>
                                                    <option value="A-29-D">A-29-D </option>
                                                    <option value="A-30-I">A-30-I </option>
                                                    <option value="A-30-D">A-30-D </option>
                                                    <option value="A-31-I">A-31-I </option>
                                                    <option value="A-31-D">A-31-D </option>
                                                    <option value="A-32-I">A-32-I </option>
                                                    <option value="A-32-D">A-32-D </option>
                                                    <option value="A-33-I">A-33-I </option>
                                                    <option value="A-33-D">A-33-D </option>
                                                    <option value="A-34-I">A-34-I </option>
                                                    <option value="A-34-D">A-34-D </option>
                                                    <option value="A-35-I">A-35-I </option>
                                                    <option value="A-35-D">A-35-D </option>
                                                    <option value="A-36-I">A-36-I </option>
                                                    <option value="A-36-D">A-36-D </option>
                                                    <option value="A-37-I">A-37-I </option>
                                                    <option value="A-37-D">A-37-D </option>
                                                    <option value="A-38-I">A-38-I </option>
                                                    <option value="A-38-D">A-38-D </option>
                                                    <option value="A-39-I">A-39-I </option>
                                                    <option value="A-39-D">A-39-D </option>
                                                    <option value="A-40-I">A-40-I </option>
                                                    <option value="A-40-D">A-40-D </option>
                                                    <option value="A-41-I">A-41-I </option>
                                                    <option value="A-41-D">A-41-D </option>
                                                    <option value="A-42-I">A-42-I </option>
                                                    <option value="A-42-D">A-42-D </option>
                                                    <option value="A-43-I">A-43-I </option>
                                                    <option value="A-43-D">A-43-D </option>
                                                    <option value="A-44-I">A-44-I </option>
                                                    <option value="A-44-D">A-44-D </option>
                                                    <option value="A-45-I">A-45-I </option>
                                                    <option value="A-45-D">A-45-D </option>
                                                    <option value="A-46-I">A-46-I </option>
                                                    <option value="A-46-D">A-46-D </option>
                                                    <option value="A-47-I">A-47-I </option>
                                                    <option value="A-47-D">A-47-D </option>
                                                    <option value="A-48-I">A-48-I </option>
                                                    <option value="B-1-I">B-1-I </option>
                                                    <option value="B-1-D">B-1-D </option>
                                                    <option value="B-2-I">B-2-I </option>
                                                    <option value="B-2-D">B-2-D </option>
                                                    <option value="B-3-I">B-3-I </option>
                                                    <option value="B-3-D">B-3-D </option>
                                                    <option value="B-4-I">B-4-I </option>
                                                    <option value="B-4-D">B-4-D </option>
                                                    <option value="B-5-I">B-5-I </option>
                                                    <option value="B-5-D">B-5-D </option>
                                                    <option value="B-6-I">B-6-I </option>
                                                    <option value="B-6-D">B-6-D </option>
                                                    <option value="B-7-I">B-7-I </option>
                                                    <option value="B-7-D">B-7-D </option>
                                                    <option value="B-8-I">B-8-I </option>
                                                    <option value="B-8-D">B-8-D </option>
                                                    <option value="B-9-I">B-9-I </option>
                                                    <option value="B-9-D">B-9-D </option>
                                                    <option value="B-10-I">B-10-I </option>
                                                    <option value="B-10-D">B-10-D </option>
                                                    <option value="B-11-I">B-11-I </option>
                                                    <option value="B-11-D">B-11-D </option>
                                                    <option value="B-12-I">B-12-I </option>
                                                    <option value="B-12-D">B-12-D </option>
                                                    <option value="B-13-I">B-13-I </option>
                                                    <option value="B-13-D">B-13-D </option>
                                                    <option value="B-14-I">B-14-I </option>
                                                    <option value="B-14-D">B-14-D </option>
                                                    <option value="B-15-I">B-15-I </option>
                                                    <option value="B-15-D">B-15-D </option>
                                                    <option value="B-16-I">B-16-I </option>
                                                    <option value="B-16-D">B-16-D </option>
                                                    <option value="B-17-I">B-17-I </option>
                                                    <option value="B-17-D">B-17-D </option>
                                                    <option value="B-18-I">B-18-I </option>
                                                    <option value="B-18-D">B-18-D </option>
                                                    <option value="B-19-I">B-19-I </option>
                                                    <option value="B-19-D">B-19-D </option>
                                                    <option value="B-20-I">B-20-I </option>
                                                    <option value="B-20-D">B-20-D </option>
                                                    <option value="B-21-I">B-21-I </option>
                                                    <option value="B-21-D">B-21-D </option>
                                                    <option value="B-22-I">B-22-I </option>
                                                    <option value="B-22-D">B-22-D </option>
                                                    <option value="B-23-I">B-23-I </option>
                                                    <option value="B-23-D">B-23-D </option>
                                                    <option value="B-24-I">B-24-I </option>
                                                    <option value="B-24-D">B-24-D </option>
                                                    <option value="B-25-I">B-25-I </option>
                                                    <option value="B-25-D">B-25-D </option>
                                                    <option value="B-26-I">B-26-I </option>
                                                    <option value="B-26-D">B-26-D </option>
                                                    <option value="B-27-I">B-27-I </option>
                                                    <option value="B-27-D">B-27-D </option>
                                                    <option value="B-28-I">B-28-I </option>
                                                    <option value="B-28-D">B-28-D </option>
                                                    <option value="B-29-I">B-29-I </option>
                                                    <option value="B-29-D">B-29-D </option>
                                                    <option value="B-30-I">B-30-I </option>
                                                    <option value="B-30-D">B-30-D </option>
                                                    <option value="B-31-I">B-31-I </option>
                                                    <option value="B-31-D">B-31-D </option>
                                                    <option value="B-32-I">B-32-I </option>
                                                    <option value="B-32-D">B-32-D </option>
                                                    <option value="B-33-I">B-33-I </option>
                                                    <option value="B-33-D">B-33-D </option>
                                                    <option value="B-34-I">B-34-I </option>
                                                    <option value="B-34-D">B-34-D </option>
                                                    <option value="B-35-I">B-35-I </option>
                                                    <option value="B-35-D">B-35-D </option>
                                                    <option value="B-36-I">B-36-I </option>
                                                    <option value="B-36-D">B-36-D </option>
                                                    <option value="B-37-I">B-37-I </option>
                                                    <option value="B-37-D">B-37-D </option>
                                                    <option value="B-38-I">B-38-I </option>
                                                    <option value="B-38-D">B-38-D </option>
                                                    <option value="B-39-I">B-39-I </option>
                                                    <option value="B-39-D">B-39-D </option>
                                                    <option value="B-40-I">B-40-I </option>
                                                    <option value="B-40-D">B-40-D </option>
                                                    <option value="B-41-I">B-41-I </option>
                                                    <option value="B-41-D">B-41-D </option>
                                                    <option value="B-42-I">B-42-I </option>
                                                    <option value="B-42-D">B-42-D </option>
                                                    <option value="B-43-I">B-43-I </option>
                                                    <option value="B-43-D">B-43-D </option>
                                                    <option value="B-44-I">B-44-I </option>
                                                    <option value="B-44-D">B-44-D </option>
                                                    <option value="B-45-I">B-45-I </option>
                                                    <option value="B-45-D">B-45-D </option>
                                                    <option value="B-46-I">B-46-I </option>
                                                    <option value="B-46-D">B-46-D </option>
                                                    <option value="B-47-I">B-47-I </option>
                                                    <option value="B-47-D">B-47-D </option>
                                                    <option value="B-48-I">B-48-I </option>
                                                    <option value="B-48-D">B-48-D </option>
                                                    <option value="C-1-I">C-1-I </option>
                                                    <option value="C-1-D">C-1-D </option>
                                                    <option value="C-2-I">C-2-I </option>
                                                    <option value="C-2-D">C-2-D </option>
                                                    <option value="C-3-I">C-3-I </option>
                                                    <option value="C-3-D">C-3-D </option>
                                                    <option value="C-4-I">C-4-I </option>
                                                    <option value="C-4-D">C-4-D </option>
                                                    <option value="C-5-I">C-5-I </option>
                                                    <option value="C-5-D">C-5-D </option>
                                                    <option value="C-6-I">C-6-I </option>
                                                    <option value="C-6-D">C-6-D </option>
                                                    <option value="C-7-I">C-7-I </option>
                                                    <option value="C-7-D">C-7-D </option>
                                                    <option value="C-8-I">C-8-I </option>
                                                    <option value="C-8-D">C-8-D </option>
                                                    <option value="C-9-I">C-9-I </option>
                                                    <option value="C-9-D">C-9-D </option>
                                                    <option value="C-10-I">C-10-I </option>
                                                    <option value="C-10-D">C-10-D </option>
                                                    <option value="C-11-I">C-11-I </option>
                                                    <option value="C-11-D">C-11-D </option>
                                                    <option value="C-12-I">C-12-I </option>
                                                    <option value="C-12-D">C-12-D </option>
                                                    <option value="C-13-I">C-13-I </option>
                                                    <option value="C-13-D">C-13-D </option>
                                                    <option value="C-14-I">C-14-I </option>
                                                    <option value="C-14-D">C-14-D </option>
                                                    <option value="C-15-I">C-15-I </option>
                                                    <option value="C-15-D">C-15-D </option>
                                                    <option value="C-16-I">C-16-I </option>
                                                    <option value="C-16-D">C-16-D </option>
                                                    <option value="C-17-I">C-17-I </option>
                                                    <option value="C-17-D">C-17-D </option>
                                                    <option value="C-18-I">C-18-I </option>
                                                    <option value="C-18-D">C-18-D </option>
                                                    <option value="C-19-I">C-19-I </option>
                                                    <option value="C-19-D">C-19-D </option>
                                                    <option value="C-20-I">C-20-I </option>
                                                    <option value="C-20-D">C-20-D </option>
                                                    <option value="C-21-I">C-21-I </option>
                                                    <option value="C-21-D">C-21-D </option>
                                                    <option value="C-22-I">C-22-I </option>
                                                    <option value="C-22-D">C-22-D </option>
                                                    <option value="C-23-I">C-23-I </option>
                                                    <option value="C-23-D">C-23-D </option>
                                                    <option value="C-24-I">C-24-I </option>
                                                    <option value="C-24-D">C-24-D </option>
                                                    <option value="C-25-I">C-25-I </option>
                                                    <option value="C-25-D">C-25-D </option>
                                                    <option value="C-26-I">C-26-I </option>
                                                    <option value="C-26-D">C-26-D </option>
                                                    <option value="C-27-I">C-27-I </option>
                                                    <option value="C-27-D">C-27-D </option>
                                                    <option value="C-28-I">C-28-I </option>
                                                    <option value="C-28-D">C-28-D </option>
                                                    <option value="C-29-I">C-29-I </option>
                                                    <option value="C-29-D">C-29-D </option>
                                                    <option value="C-30-I">C-30-I </option>
                                                    <option value="C-30-D">C-30-D </option>
                                                    <option value="C-31-I">C-31-I </option>
                                                    <option value="C-31-D">C-31-D </option>
                                                    <option value="C-32-I">C-32-I </option>
                                                    <option value="C-32-D">C-32-D </option>
                                                    <option value="C-33-I">C-33-I </option>
                                                    <option value="C-33-D">C-33-D </option>
                                                    <option value="C-34-I">C-34-I </option>
                                                    <option value="C-34-D">C-34-D </option>
                                                    <option value="C-35-I">C-35-I </option>
                                                    <option value="C-35-D">C-35-D </option>
                                                    <option value="C-36-I">C-36-I </option>
                                                    <option value="C-36-D">C-36-D </option>
                                                    <option value="C-37-I">C-37-I </option>
                                                    <option value="C-37-D">C-37-D </option>
                                                    <option value="C-38-I">C-38-I </option>
                                                    <option value="C-38-D">C-38-D </option>
                                                    <option value="C-39-I">C-39-I </option>
                                                    <option value="C-39-D">C-39-D </option>
                                                    <option value="C-40-I">C-40-I </option>
                                                    <option value="C-40-D">C-40-D </option>
                                                    <option value="D-1-I">D-1-I </option>
                                                    <option value="D-1-D">D-1-D </option>
                                                    <option value="D-2-I">D-2-I </option>
                                                    <option value="D-2-D">D-2-D </option>
                                                    <option value="D-3-I">D-3-I </option>
                                                    <option value="D-3-D">D-3-D </option>
                                                    <option value="D-4-I">D-4-I </option>
                                                    <option value="D-4-D">D-4-D </option>
                                                    <option value="D-5-I">D-5-I </option>
                                                    <option value="D-5-D">D-5-D </option>
                                                    <option value="D-6-I">D-6-I </option>
                                                    <option value="D-6-D">D-6-D </option>
                                                    <option value="D-7-I">D-7-I </option>
                                                    <option value="D-7-D">D-7-D </option>
                                                    <option value="D-8-I">D-8-I </option>
                                                    <option value="D-8-D">D-8-D </option>
                                                    <option value="D-9-I">D-9-I </option>
                                                    <option value="D-9-D">D-9-D </option>
                                                    <option value="D-10-I">D-10-I </option>
                                                    <option value="D-10-D">D-10-D </option>
                                                    <option value="D-11-I">D-11-I </option>
                                                    <option value="D-11-D">D-11-D </option>
                                                    <option value="D-12-I">D-12-I </option>
                                                    <option value="D-12-D">D-12-D </option>
                                                    <option value="D-13-I">D-13-I </option>
                                                    <option value="D-13-D">D-13-D </option>
                                                    <option value="D-14-I">D-14-I </option>
                                                    <option value="D-14-D">D-14-D </option>
                                                    <option value="D-15-I">D-15-I </option>
                                                    <option value="D-15-D">D-15-D </option>
                                                    <option value="D-16-I">D-16-I </option>
                                                    <option value="D-16-D">D-16-D </option>
                                                    <option value="D-17-I">D-17-I </option>
                                                    <option value="D-17-D">D-17-D </option>
                                                    <option value="D-18-I">D-18-I </option>
                                                    <option value="D-18-D">D-18-D </option>
                                                    <option value="D-19-I">D-19-I </option>
                                                    <option value="D-19-D">D-19-D </option>
                                                    <option value="D-20-I">D-20-I </option>
                                                    <option value="D-20-D">D-20-D </option>
                                                    <option value="D-21-I">D-21-I </option>
                                                    <option value="D-21-D">D-21-D </option>
                                                    <option value="D-22-I">D-22-I </option>
                                                    <option value="D-22-D">D-22-D </option>
                                                    <option value="D-23-I">D-23-I </option>
                                                    <option value="D-23-D">D-23-D </option>
                                                    <option value="D-24-I">D-24-I </option>
                                                    <option value="D-24-D">D-24-D </option>
                                                    <option value="D-25-I">D-25-I </option>
                                                    <option value="D-25-D">D-25-D </option>
                                                    <option value="D-26-I">D-26-I </option>
                                                    <option value="D-26-D">D-26-D </option>
                                                    <option value="D-27-I">D-27-I </option>
                                                    <option value="D-27-D">D-27-D </option>
                                                    <option value="D-28-I">D-28-I </option>
                                                    <option value="D-28-D">D-28-D </option>
                                                    <option value="D-29-I">D-29-I </option>
                                                    <option value="D-29-D">D-29-D </option>
                                                    <option value="D-30-I">D-30-I </option>
                                                    <option value="D-30-D">D-30-D </option>
                                                    <option value="D-31-I">D-31-I </option>
                                                    <option value="D-31-D">D-31-D </option>
                                                    <option value="D-32-I">D-32-I </option>
                                                    <option value="D-32-D">D-32-D </option>
                                                    <option value="D-33-I">D-33-I </option>
                                                    <option value="D-33-D">D-33-D </option>
                                                    <option value="D-34-I">D-34-I </option>
                                                    <option value="D-34-D">D-34-D </option>
                                                    <option value="D-35-I">D-35-I </option>
                                                    <option value="D-35-D">D-35-D </option>
                                                    <option value="D-36-I">D-36-I </option>
                                                    <option value="D-36-D">D-36-D </option>
                                                    <option value="D-37-I">D-37-I </option>
                                                    <option value="D-37-D">D-37-D </option>
                                                    <option value="D-38-I">D-38-I </option>
                                                    <option value="D-38-D">D-38-D </option>
                                                    <option value="D-39-I">D-39-I </option>
                                                    <option value="D-39-D">D-39-D </option>
                                                    <option value="D-40-I">D-40-I </option>
                                                    <option value="D-40-D">D-40-D </option>
                                                    <option value="E-1-I">E-1-I </option>
                                                    <option value="E-1-D">E-1-D </option>
                                                    <option value="E-2-I">E-2-I </option>
                                                    <option value="E-2-D">E-2-D </option>
                                                    <option value="E-3-I">E-3-I </option>
                                                    <option value="E-3-D">E-3-D </option>
                                                    <option value="E-4-I">E-4-I </option>
                                                    <option value="E-4-D">E-4-D </option>
                                                    <option value="E-5-I">E-5-I </option>
                                                    <option value="E-5-D">E-5-D </option>
                                                    <option value="E-6-I">E-6-I </option>
                                                    <option value="E-6-D">E-6-D </option>
                                                    <option value="E-7-I">E-7-I </option>
                                                    <option value="E-7-D">E-7-D </option>
                                                    <option value="E-8-I">E-8-I </option>
                                                    <option value="E-8-D">E-8-D </option>
                                                    <option value="E-9-I">E-9-I </option>
                                                    <option value="E-9-D">E-9-D </option>
                                                    <option value="E-10-I">E-10-I </option>
                                                    <option value="E-10-D">E-10-D </option>
                                                    <option value="E-11-I">E-11-I </option>
                                                    <option value="E-11-D">E-11-D </option>
                                                    <option value="E-12-I">E-12-I </option>
                                                    <option value="E-12-D">E-12-D </option>
                                                    <option value="E-13-I">E-13-I </option>
                                                    <option value="E-13-D">E-13-D </option>
                                                    <option value="E-14-I">E-14-I </option>
                                                    <option value="E-14-D">E-14-D </option>
                                                    <option value="E-15-I">E-15-I </option>
                                                    <option value="E-15-D">E-15-D </option>
                                                    <option value="E-16-I">E-16-I </option>
                                                    <option value="E-16-D">E-16-D </option>
                                                    <option value="E-17-I">E-17-I </option>
                                                    <option value="E-17-D">E-17-D </option>
                                                    <option value="E-18-I">E-18-I </option>
                                                    <option value="E-18-D">E-18-D </option>
                                                    <option value="E-19-I">E-19-I </option>
                                                    <option value="E-19-D">E-19-D </option>
                                                    <option value="E-20-I">E-20-I </option>
                                                    <option value="E-20-D">E-20-D </option>
                                                    <option value="E-21-I">E-21-I </option>
                                                    <option value="E-21-D">E-21-D </option>
                                                    <option value="E-22-I">E-22-I </option>
                                                    <option value="E-22-D">E-22-D </option>
                                                    <option value="E-23-I">E-23-I </option>
                                                    <option value="E-23-D">E-23-D </option>
                                                    <option value="E-24-I">E-24-I </option>
                                                    <option value="E-24-D">E-24-D </option>
                                                    <option value="E-25-I">E-25-I </option>
                                                    <option value="E-25-D">E-25-D </option>
                                                    <option value="E-26-I">E-26-I </option>
                                                    <option value="E-26-D">E-26-D </option>
                                                    <option value="E-27-I">E-27-I </option>
                                                    <option value="E-27-D">E-27-D </option>
                                                    <option value="E-28-I">E-28-I </option>
                                                    <option value="E-28-D">E-28-D </option>
                                                    <option value="E-29-I">E-29-I </option>
                                                    <option value="E-29-D">E-29-D </option>
                                                    <option value="E-30-I">E-30-I </option>
                                                    <option value="E-30-D">E-30-D </option>
                                                    <option value="E-31-I">E-31-I </option>
                                                    <option value="E-31-D">E-31-D </option>
                                                    <option value="E-32-I">E-32-I </option>
                                                    <option value="E-32-D">E-32-D </option>
                                                    <option value="E-33-I">E-33-I </option>
                                                    <option value="E-33-D">E-33-D </option>
                                                    <option value="E-34-I">E-34-I </option>
                                                    <option value="E-34-D">E-34-D </option>
                                                    <option value="E-35-I">E-35-I </option>
                                                    <option value="E-35-D">E-35-D </option>
                                                    <option value="E-36-I">E-36-I </option>
                                                    <option value="E-36-D">E-36-D </option>
                                                    <option value="E-37-I">E-37-I </option>
                                                    <option value="E-37-D">E-37-D </option>
                                                    <option value="E-38-I">E-38-I </option>
                                                    <option value="E-38-D">E-38-D </option>
                                                    <option value="F-1-I">F-1-I </option>
                                                    <option value="F-1-D">F-1-D </option>
                                                    <option value="F-2-I">F-2-I </option>
                                                    <option value="F-2-D">F-2-D </option>
                                                    <option value="F-3-I">F-3-I </option>
                                                    <option value="F-3-D">F-3-D </option>
                                                    <option value="F-4-I">F-4-I </option>
                                                    <option value="F-4-D">F-4-D </option>
                                                    <option value="F-5-I">F-5-I </option>
                                                    <option value="F-5-D">F-5-D </option>
                                                    <option value="F-6-I">F-6-I </option>
                                                    <option value="F-6-D">F-6-D </option>
                                                    <option value="F-7-I">F-7-I </option>
                                                    <option value="F-7-D">F-7-D </option>
                                                    <option value="F-8-I">F-8-I </option>
                                                    <option value="F-8-D">F-8-D </option>
                                                    <option value="F-9-I">F-9-I </option>
                                                    <option value="F-9-D">F-9-D </option>
                                                    <option value="F-10-I">F-10-I </option>
                                                    <option value="F-10-D">F-10-D </option>
                                                    <option value="F-11-I">F-11-I </option>
                                                    <option value="F-11-D">F-11-D </option>
                                                    <option value="F-12-I">F-12-I </option>
                                                    <option value="F-12-D">F-12-D </option>
                                                    <option value="F-13-I">F-13-I </option>
                                                    <option value="F-13-D">F-13-D </option>
                                                    <option value="F-14-I">F-14-I </option>
                                                    <option value="F-14-D">F-14-D </option>
                                                    <option value="F-15-I">F-15-I </option>
                                                    <option value="F-15-D">F-15-D </option>
                                                    <option value="F-16-I">F-16-I </option>
                                                    <option value="F-16-D">F-16-D </option>
                                                    <option value="F-17-I">F-17-I </option>
                                                    <option value="F-17-D">F-17-D </option>
                                                    <option value="F-18-I">F-18-I </option>
                                                    <option value="F-18-D">F-18-D </option>
                                                    <option value="F-19-I">F-19-I </option>
                                                    <option value="F-19-D">F-19-D </option>
                                                    <option value="F-20-I">F-20-I </option>
                                                    <option value="F-20-D">F-20-D </option>
                                                    <option value="F-21-I">F-21-I </option>
                                                    <option value="F-21-D">F-21-D </option>
                                                    <option value="F-22-I">F-22-I </option>
                                                    <option value="F-22-D">F-22-D </option>
                                                    <option value="F-23-I">F-23-I </option>
                                                    <option value="F-23-D">F-23-D </option>
                                                    <option value="F-24-I">F-24-I </option>
                                                    <option value="F-24-D">F-24-D </option>
                                                    <option value="F-25-I">F-25-I </option>
                                                    <option value="F-25-D">F-25-D </option>
                                                    <option value="F-26-I">F-26-I </option>
                                                    <option value="F-26-D">F-26-D </option>
                                                    <option value="F-27-I">F-27-I </option>
                                                    <option value="F-27-D">F-27-D </option>
                                                    <option value="F-28-I">F-28-I </option>
                                                    <option value="F-28-D">F-28-D </option>
                                                    <option value="F-29-I">F-29-I </option>
                                                    <option value="F-29-D">F-29-D </option>
                                                    <option value="F-30-I">F-30-I </option>
                                                    <option value="F-30-D">F-30-D </option>
                                                    <option value="F-31-I">F-31-I </option>
                                                    <option value="F-31-D">F-31-D </option>
                                                    <option value="F-32-I">F-32-I </option>
                                                    <option value="F-32-D">F-32-D </option>
                                                    <option value="F-33-I">F-33-I </option>
                                                    <option value="F-33-D">F-33-D </option>
                                                    <option value="F-34-I">F-34-I </option>
                                                    <option value="F-34-D">F-34-D </option>
                                                    <option value="F-35-I">F-35-I </option>
                                                    <option value="F-35-D">F-35-D </option>
                                                    <option value="F-36-I">F-36-I </option>
                                                    <option value="F-36-D">F-36-D </option>
                                                    <option value="F-37-I">F-37-I </option>
                                                    <option value="F-37-D">F-37-D </option>
                                                    <option value="F-38-I">F-38-I </option>
                                                    <option value="F-38-D">F-38-D </option>
                                                    <option value="G-1-I">G-1-I </option>
                                                    <option value="G-1-D">G-1-D </option>
                                                    <option value="G-2-I">G-2-I </option>
                                                    <option value="G-2-D">G-2-D </option>
                                                    <option value="G-3-I">G-3-I </option>
                                                    <option value="G-3-D">G-3-D </option>
                                                    <option value="G-4-I">G-4-I </option>
                                                    <option value="G-4-D">G-4-D </option>
                                                    <option value="G-5-I">G-5-I </option>
                                                    <option value="G-5-D">G-5-D </option>
                                                    <option value="G-6-I">G-6-I </option>
                                                    <option value="G-6-D">G-6-D </option>
                                                    <option value="G-7-I">G-7-I </option>
                                                    <option value="G-7-D">G-7-D </option>
                                                    <option value="G-8-I">G-8-I </option>
                                                    <option value="G-8-D">G-8-D </option>
                                                    <option value="G-9-I">G-9-I </option>
                                                    <option value="G-9-D">G-9-D </option>
                                                    <option value="G-10-I">G-10-I </option>
                                                    <option value="G-10-D">G-10-D </option>
                                                    <option value="G-11-I">G-11-I </option>
                                                    <option value="G-11-D">G-11-D </option>
                                                    <option value="G-12-I">G-12-I </option>
                                                    <option value="G-12-D">G-12-D </option>
                                                    <option value="G-13-I">G-13-I </option>
                                                    <option value="G-13-D">G-13-D </option>
                                                    <option value="G-14-I">G-14-I </option>
                                                    <option value="G-14-D">G-14-D </option>
                                                    <option value="G-15-I">G-15-I </option>
                                                    <option value="G-15-D">G-15-D </option>
                                                    <option value="G-16-I">G-16-I </option>
                                                    <option value="G-16-D">G-16-D </option>
                                                    <option value="G-17-I">G-17-I </option>
                                                    <option value="G-17-D">G-17-D </option>
                                                    <option value="G-18-I">G-18-I </option>
                                                    <option value="G-18-D">G-18-D </option>
                                                    <option value="G-19-I">G-19-I </option>
                                                    <option value="G-19-D">G-19-D </option>
                                                    <option value="G-20-I">G-20-I </option>
                                                    <option value="G-20-D">G-20-D </option>
                                                    <option value="G-21-I">G-21-I </option>
                                                    <option value="G-21-D">G-21-D </option>
                                                    <option value="G-22-I">G-22-I </option>
                                                    <option value="G-22-D">G-22-D </option>
                                                    <option value="G-23-I">G-23-I </option>
                                                    <option value="G-23-D">G-23-D </option>
                                                    <option value="G-24-I">G-24-I </option>
                                                    <option value="G-24-D">G-24-D </option>
                                                    <option value="G-25-I">G-25-I </option>
                                                    <option value="G-25-D">G-25-D </option>
                                                    <option value="G-26-I">G-26-I </option>
                                                    <option value="G-26-D">G-26-D </option>
                                                    <option value="G-27-I">G-27-I </option>
                                                    <option value="G-27-D">G-27-D </option>
                                                    <option value="G-28-I">G-28-I </option>
                                                    <option value="G-28-D">G-28-D </option>
                                                    <option value="G-29-I">G-29-I </option>
                                                    <option value="G-29-D">G-29-D </option>
                                                    <option value="G-30-I">G-30-I </option>
                                                    <option value="G-30-D">G-30-D </option>
                                                    <option value="G-31-I">G-31-I </option>
                                                    <option value="G-31-D">G-31-D </option>
                                                    <option value="G-32-I">G-32-I </option>
                                                    <option value="G-32-D">G-32-D </option>
                                                    <option value="G-33-I">G-33-I </option>
                                                    <option value="G-33-D">G-33-D </option>
                                                    <option value="G-34-I">G-34-I </option>
                                                    <option value="G-34-D">G-34-D </option>
                                                    <option value="G-35-I">G-35-I </option>
                                                    <option value="G-35-D">G-35-D </option>
                                                    <option value="G-36-I">G-36-I </option>
                                                    <option value="G-36-D">G-36-D </option>
                                                    <option value="G-37-I">G-37-I </option>
                                                    <option value="G-37-D">G-37-D </option>
                                                    <option value="G-38-I">G-38-I </option>
                                                    <option value="G-38-D">G-38-D </option>
                                                    <option value="H-1-I">H-1-I </option>
                                                    <option value="H-1-D">H-1-D </option>
                                                    <option value="H-2-I">H-2-I </option>
                                                    <option value="H-2-D">H-2-D </option>
                                                    <option value="H-3-I">H-3-I </option>
                                                    <option value="H-3-D">H-3-D </option>
                                                    <option value="H-4-I">H-4-I </option>
                                                    <option value="H-4-D">H-4-D </option>
                                                    <option value="H-5-I">H-5-I </option>
                                                    <option value="H-5-D">H-5-D </option>
                                                    <option value="H-6-I">H-6-I </option>
                                                    <option value="H-6-D">H-6-D </option>
                                                    <option value="H-7-I">H-7-I </option>
                                                    <option value="H-7-D">H-7-D </option>
                                                    <option value="H-8-I">H-8-I </option>
                                                    <option value="H-8-D">H-8-D </option>
                                                    <option value="H-9-I">H-9-I </option>
                                                    <option value="H-9-D">H-9-D </option>
                                                    <option value="H-10-I">H-10-I </option>
                                                    <option value="H-10-D">H-10-D </option>
                                                    <option value="H-11-I">H-11-I </option>
                                                    <option value="H-11-D">H-11-D </option>
                                                    <option value="H-12-I">H-12-I </option>
                                                    <option value="H-12-D">H-12-D </option>
                                                    <option value="H-13-I">H-13-I </option>
                                                    <option value="H-13-D">H-13-D </option>
                                                    <option value="H-14-I">H-14-I </option>
                                                    <option value="H-14-D">H-14-D </option>
                                                    <option value="H-15-I">H-15-I </option>
                                                    <option value="H-15-D">H-15-D </option>
                                                    <option value="H-16-I">H-16-I </option>
                                                    <option value="H-16-D">H-16-D </option>
                                                    <option value="H-17-I">H-17-I </option>
                                                    <option value="H-17-D">H-17-D </option>
                                                    <option value="H-18-I">H-18-I </option>
                                                    <option value="H-18-D">H-18-D </option>
                                                    <option value="H-19-I">H-19-I </option>
                                                    <option value="H-19-D">H-19-D </option>
                                                    <option value="H-20-I">H-20-I </option>
                                                    <option value="H-20-D">H-20-D </option>
                                                    <option value="H-21-I">H-21-I </option>
                                                    <option value="H-21-D">H-21-D </option>
                                                    <option value="H-22-I">H-22-I </option>
                                                    <option value="H-22-D">H-22-D </option>
                                                    <option value="H-23-I">H-23-I </option>
                                                    <option value="H-23-D">H-23-D </option>
                                                    <option value="H-24-I">H-24-I </option>
                                                    <option value="H-24-D">H-24-D </option>
                                                    <option value="H-25-I">H-25-I </option>
                                                    <option value="H-25-D">H-25-D </option>
                                                    <option value="H-26-I">H-26-I </option>
                                                    <option value="H-26-D">H-26-D </option>
                                                    <option value="H-27-I">H-27-I </option>
                                                    <option value="H-27-D">H-27-D </option>
                                                    <option value="H-28-I">H-28-I </option>
                                                    <option value="H-28-D">H-28-D </option>
                                                    <option value="H-29-I">H-29-I </option>
                                                    <option value="H-29-D">H-29-D </option>
                                                    <option value="H-30-I">H-30-I </option>
                                                    <option value="H-30-D">H-30-D </option>
                                                    <option value="H-31-I">H-31-I </option>
                                                    <option value="H-31-D">H-31-D </option>
                                                    <option value="H-32-I">H-32-I </option>
                                                    <option value="H-32-D">H-32-D </option>
                                                    <option value="H-33-I">H-33-I </option>
                                                    <option value="H-33-D">H-33-D </option>
                                                    <option value="H-34-I">H-34-I </option>
                                                    <option value="H-34-D">H-34-D </option>
                                                    <option value="H-35-I">H-35-I </option>
                                                    <option value="H-35-D">H-35-D </option>
                                                    <option value="H-36-I">H-36-I </option>
                                                    <option value="H-36-D">H-36-D </option>
                                                    <option value="H-37-I">H-37-I </option>
                                                    <option value="H-37-D">H-37-D </option>
                                                    <option value="H-38-I">H-38-I </option>
                                                    <option value="H-38-D">H-38-D </option>
                                                    <option value="I-1-I">I-1-I </option>
                                                    <option value="I-1-D">I-1-D </option>
                                                    <option value="I-2-I">I-2-I </option>
                                                    <option value="I-2-D">I-2-D </option>
                                                    <option value="I-3-I">I-3-I </option>
                                                    <option value="I-3-D">I-3-D </option>
                                                    <option value="I-4-I">I-4-I </option>
                                                    <option value="I-4-D">I-4-D </option>
                                                    <option value="I-5-I">I-5-I </option>
                                                    <option value="I-5-D">I-5-D </option>
                                                    <option value="I-6-I">I-6-I </option>
                                                    <option value="I-6-D">I-6-D </option>
                                                    <option value="I-7-I">I-7-I </option>
                                                    <option value="I-7-D">I-7-D </option>
                                                    <option value="I-8-I">I-8-I </option>
                                                    <option value="I-8-D">I-8-D </option>
                                                    <option value="I-9-I">I-9-I </option>
                                                    <option value="I-9-D">I-9-D </option>
                                                    <option value="I-10-I">I-10-I </option>
                                                    <option value="I-10-D">I-10-D </option>
                                                    <option value="I-11-I">I-11-I </option>
                                                    <option value="I-11-D">I-11-D </option>
                                                    <option value="I-12-I">I-12-I </option>
                                                    <option value="I-12-D">I-12-D </option>
                                                    <option value="I-13-I">I-13-I </option>
                                                    <option value="I-13-D">I-13-D </option>
                                                    <option value="I-14-I">I-14-I </option>
                                                    <option value="I-14-D">I-14-D </option>
                                                    <option value="I-15-I">I-15-I </option>
                                                    <option value="I-15-D">I-15-D </option>
                                                    <option value="I-16-I">I-16-I </option>
                                                    <option value="I-16-D">I-16-D </option>
                                                    <option value="I-17-I">I-17-I </option>
                                                    <option value="I-17-D">I-17-D </option>
                                                    <option value="I-18-I">I-18-I </option>
                                                    <option value="I-18-D">I-18-D </option>
                                                    <option value="I-19-I">I-19-I </option>
                                                    <option value="I-19-D">I-19-D </option>
                                                    <option value="I-20-I">I-20-I </option>
                                                    <option value="I-20-D">I-20-D </option>
                                                    <option value="I-21-I">I-21-I </option>
                                                    <option value="I-21-D">I-21-D </option>
                                                    <option value="I-22-I">I-22-I </option>
                                                    <option value="I-22-D">I-22-D </option>
                                                    <option value="I-23-I">I-23-I </option>
                                                    <option value="I-23-D">I-23-D </option>
                                                    <option value="I-24-I">I-24-I </option>
                                                    <option value="I-24-D">I-24-D </option>
                                                    <option value="I-25-I">I-25-I </option>
                                                    <option value="I-25-D">I-25-D </option>
                                                    <option value="I-26-I">I-26-I </option>
                                                    <option value="I-26-D">I-26-D </option>
                                                    <option value="I-27-I">I-27-I </option>
                                                    <option value="I-27-D">I-27-D </option>
                                                    <option value="I-28-I">I-28-I </option>
                                                    <option value="I-28-D">I-28-D </option>
                                                    <option value="I-29-I">I-29-I </option>
                                                    <option value="I-29-D">I-29-D </option>
                                                    <option value="I-30-I">I-30-I </option>
                                                    <option value="I-30-D">I-30-D </option>
                                                    <option value="I-31-I">I-31-I </option>
                                                    <option value="I-31-D">I-31-D </option>
                                                    <option value="I-32-I">I-32-I </option>
                                                    <option value="I-32-D">I-32-D </option>
                                                    <option value="I-33-I">I-33-I </option>
                                                    <option value="I-33-D">I-33-D </option>
                                                    <option value="I-34-I">I-34-I </option>
                                                    <option value="I-34-D">I-34-D </option>
                                                    <option value="I-35-I">I-35-I </option>
                                                    <option value="I-35-D">I-35-D </option>
                                                    <option value="I-36-I">I-36-I </option>
                                                    <option value="I-36-D">I-36-D </option>
                                                    <option value="I-37-I">I-37-I </option>
                                                    <option value="I-37-D">I-37-D </option>
                                                    <option value="I-38-I">I-38-I </option>
                                                    <option value="I-38-D">I-38-D </option>
                                                    <option value="I-39-I">I-39-I </option>
                                                    <option value="I-39-D">I-39-D </option>
                                                    <option value="I-40-I">I-40-I </option>
                                                    <option value="I-40-D">I-40-D </option>
                                                    <option value="I-41-D">I-41-D</option>
                                                    <option value="I-41-I">I-41-I</option>
                                                    <option value="I-42-D">I-42-D</option>
                                                    <option value="I-42-I">I-42-I</option>
                                                    <option value="I-43-D">I-43-D</option>
                                                    <option value="I-43-I">I-43-I</option>
                                                    <option value="I-44-D">I-44-D</option>
                                                    <option value="I-44-I">I-44-I</option>
                                                    <option value="I-45-D">I-45-D</option>
                                                    <option value="I-45-I">I-45-I</option>
                                                    <option value="I-46-D">I-46-D</option>
                                                    <option value="I-46-I">I-46-I</option>
                                                    <option value="I-47-D">I-47-D</option>
                                                    <option value="I-47-I">I-47-I</option>
                                                    <option value="I-48-D">I-48-D</option>
                                                    <option value="I-48-I">I-48-I</option>
                                                    <option value="J-1-I">J-1-I </option>
                                                    <option value="J-1-D">J-1-D </option>
                                                    <option value="J-2-I">J-2-I </option>
                                                    <option value="J-2-D">J-2-D </option>
                                                    <option value="J-3-I">J-3-I </option>
                                                    <option value="J-3-D">J-3-D </option>
                                                    <option value="J-4-I">J-4-I </option>
                                                    <option value="J-4-D">J-4-D </option>
                                                    <option value="J-5-I">J-5-I </option>
                                                    <option value="J-5-D">J-5-D </option>
                                                    <option value="J-6-I">J-6-I </option>
                                                    <option value="J-6-D">J-6-D </option>
                                                    <option value="J-7-I">J-7-I </option>
                                                    <option value="J-7-D">J-7-D </option>
                                                    <option value="J-8-I">J-8-I </option>
                                                    <option value="J-8-D">J-8-D </option>
                                                    <option value="J-9-I">J-9-I </option>
                                                    <option value="J-9-D">J-9-D </option>
                                                    <option value="J-10-I">J-10-I </option>
                                                    <option value="J-10-D">J-10-D </option>
                                                    <option value="J-11-I">J-11-I </option>
                                                    <option value="J-11-D">J-11-D </option>
                                                    <option value="J-12-I">J-12-I </option>
                                                    <option value="J-12-D">J-12-D </option>
                                                    <option value="J-13-I">J-13-I </option>
                                                    <option value="J-13-D">J-13-D </option>
                                                    <option value="J-14-I">J-14-I </option>
                                                    <option value="J-14-D">J-14-D </option>
                                                    <option value="J-15-I">J-15-I </option>
                                                    <option value="J-15-D">J-15-D </option>
                                                    <option value="J-16-I">J-16-I </option>
                                                    <option value="J-16-D">J-16-D </option>
                                                    <option value="J-17-I">J-17-I </option>
                                                    <option value="J-17-D">J-17-D </option>
                                                    <option value="J-18-I">J-18-I </option>
                                                    <option value="J-18-D">J-18-D </option>
                                                    <option value="J-19-I">J-19-I </option>
                                                    <option value="J-19-D">J-19-D </option>
                                                    <option value="J-20-I">J-20-I </option>
                                                    <option value="J-20-D">J-20-D </option>
                                                    <option value="J-21-I">J-21-I </option>
                                                    <option value="J-21-D">J-21-D </option>
                                                    <option value="J-22-I">J-22-I </option>
                                                    <option value="J-22-D">J-22-D </option>
                                                    <option value="J-23-I">J-23-I </option>
                                                    <option value="J-23-D">J-23-D </option>
                                                    <option value="J-24-I">J-24-I </option>
                                                    <option value="J-24-D">J-24-D </option>
                                                    <option value="J-25-I">J-25-I </option>
                                                    <option value="J-25-D">J-25-D </option>
                                                    <option value="J-26-I">J-26-I </option>
                                                    <option value="J-26-D">J-26-D </option>
                                                    <option value="J-27-I">J-27-I </option>
                                                    <option value="J-27-D">J-27-D </option>
                                                    <option value="J-28-I">J-28-I </option>
                                                    <option value="J-28-D">J-28-D </option>
                                                    <option value="J-29-I">J-29-I </option>
                                                    <option value="J-29-D">J-29-D </option>
                                                    <option value="J-30-I">J-30-I </option>
                                                    <option value="J-30-D">J-30-D </option>
                                                    <option value="J-31-I">J-31-I </option>
                                                    <option value="J-31-D">J-31-D </option>
                                                    <option value="J-32-I">J-32-I </option>
                                                    <option value="J-32-D">J-32-D </option>
                                                    <option value="J-33-I">J-33-I </option>
                                                    <option value="J-33-D">J-33-D </option>
                                                    <option value="J-34-I">J-34-I </option>
                                                    <option value="J-34-D">J-34-D </option>
                                                    <option value="J-35-I">J-35-I </option>
                                                    <option value="J-35-D">J-35-D </option>
                                                    <option value="J-36-I">J-36-I </option>
                                                    <option value="J-36-D">J-36-D </option>
                                                    <option value="J-37-I">J-37-I </option>
                                                    <option value="J-37-D">J-37-D </option>
                                                    <option value="J-38-I">J-38-I </option>
                                                    <option value="J-38-D">J-38-D </option>
                                                    <option value="J-39-I">J-39-I </option>
                                                    <option value="J-39-D">J-39-D </option>
                                                    <option value="J-40-I">J-40-I </option>
                                                    <option value="J-40-D">J-40-D </option>
                                                    <option value="J-41-D">J-41-D</option>
                                                    <option value="J-41-I">J-41-I</option>
                                                    <option value="J-42-D">J-42-D</option>
                                                    <option value="J-42-I">J-42-I</option>
                                                    <option value="J-43-D">J-43-D</option>
                                                    <option value="J-43-I">J-43-I</option>
                                                    <option value="J-44-D">J-44-D</option>
                                                    <option value="J-44-I">J-44-I</option>
                                                    <option value="J-45-D">J-45-D</option>
                                                    <option value="J-45-I">J-45-I</option>
                                                    <option value="J-46-D">J-46-D</option>
                                                    <option value="J-46-I">J-46-I</option>
                                                    <option value="J-47-D">J-47-D</option>
                                                    <option value="J-47-I">J-47-I</option>
                                                    <option value="J-48-D">J-48-D</option>
                                                    <option value="J-48-I">J-48-I</option>
                                                    <option value="K-1-I">K-1-I </option>
                                                    <option value="K-1-D">K-1-D </option>
                                                    <option value="K-2-I">K-2-I </option>
                                                    <option value="K-2-D">K-2-D </option>
                                                    <option value="K-3-I">K-3-I </option>
                                                    <option value="K-3-D">K-3-D </option>
                                                    <option value="K-4-I">K-4-I </option>
                                                    <option value="K-4-D">K-4-D </option>
                                                    <option value="K-5-I">K-5-I </option>
                                                    <option value="K-5-D">K-5-D </option>
                                                    <option value="K-6-I">K-6-I </option>
                                                    <option value="K-6-D">K-6-D </option>
                                                    <option value="K-7-I">K-7-I </option>
                                                    <option value="K-7-D">K-7-D </option>
                                                    <option value="K-8-I">K-8-I </option>
                                                    <option value="K-8-D">K-8-D </option>
                                                    <option value="K-9-I">K-9-I </option>
                                                    <option value="K-9-D">K-9-D </option>
                                                    <option value="K-10-I">K-10-I </option>
                                                    <option value="K-10-D">K-10-D </option>
                                                    <option value="K-11-I">K-11-I </option>
                                                    <option value="K-11-D">K-11-D </option>
                                                    <option value="K-12-I">K-12-I </option>
                                                    <option value="K-12-D">K-12-D </option>
                                                    <option value="K-13-I">K-13-I </option>
                                                    <option value="K-13-D">K-13-D </option>
                                                    <option value="K-14-I">K-14-I </option>
                                                    <option value="K-14-D">K-14-D </option>
                                                    <option value="K-15-I">K-15-I </option>
                                                    <option value="K-15-D">K-15-D </option>
                                                    <option value="K-16-I">K-16-I </option>
                                                    <option value="K-16-D">K-16-D </option>
                                                    <option value="K-17-I">K-17-I </option>
                                                    <option value="K-17-D">K-17-D </option>
                                                    <option value="K-18-I">K-18-I </option>
                                                    <option value="K-18-D">K-18-D </option>
                                                    <option value="K-19-I">K-19-I </option>
                                                    <option value="K-19-D">K-19-D </option>
                                                    <option value="K-20-I">K-20-I </option>
                                                    <option value="K-20-D">K-20-D </option>
                                                    <option value="K-21-I">K-21-I </option>
                                                    <option value="K-21-D">K-21-D </option>
                                                    <option value="K-22-I">K-22-I </option>
                                                    <option value="K-22-D">K-22-D </option>
                                                    <option value="K-23-I">K-23-I </option>
                                                    <option value="K-23-D">K-23-D </option>
                                                    <option value="K-24-I">K-24-I </option>
                                                    <option value="K-24-D">K-24-D </option>
                                                    <option value="K-25-I">K-25-I </option>
                                                    <option value="K-25-D">K-25-D </option>
                                                    <option value="K-26-I">K-26-I </option>
                                                    <option value="K-26-D">K-26-D </option>
                                                    <option value="K-27-I">K-27-I </option>
                                                    <option value="K-27-D">K-27-D </option>
                                                    <option value="K-28-I">K-28-I </option>
                                                    <option value="K-28-D">K-28-D </option>
                                                    <option value="K-29-I">K-29-I </option>
                                                    <option value="K-29-D">K-29-D </option>
                                                    <option value="K-30-I">K-30-I </option>
                                                    <option value="K-30-D">K-30-D </option>
                                                    <option value="K-31-I">K-31-I </option>
                                                    <option value="K-31-D">K-31-D </option>
                                                    <option value="K-32-I">K-32-I </option>
                                                    <option value="K-32-D">K-32-D </option>
                                                    <option value="K-33-I">K-33-I </option>
                                                    <option value="K-33-D">K-33-D </option>
                                                    <option value="K-34-I">K-34-I </option>
                                                    <option value="K-34-D">K-34-D </option>
                                                    <option value="K-35-I">K-35-I </option>
                                                    <option value="K-35-D">K-35-D </option>
                                                    <option value="K-36-I">K-36-I </option>
                                                    <option value="K-36-D">K-36-D </option>
                                                    <option value="K-37-I">K-37-I </option>
                                                    <option value="K-37-D">K-37-D </option>
                                                    <option value="K-38-I">K-38-I </option>
                                                    <option value="K-38-D">K-38-D </option>
                                                    <option value="K-39-I">K-39-I </option>
                                                    <option value="K-39-D">K-39-D </option>
                                                    <option value="K-40-I">K-40-I </option>
                                                    <option value="K-40-D">K-40-D </option>
                                                    <option value="K-41-I">K-41-I </option>
                                                    <option value="K-41-D">K-41-D </option>
                                                    <option value="K-42-I">K-42-I </option>
                                                    <option value="K-42-D">K-42-D </option>
                                                    <option value="K-43-I">K-43-I </option>
                                                    <option value="K-43-D">K-43-D </option>
                                                    <option value="K-44-I">K-44-I </option>
                                                    <option value="K-44-D">K-44-D </option>
                                                    <option value="K-45-D">K-45-D</option>
                                                    <option value="K-45-I">K-45-I</option>
                                                    <option value="K-46-D">K-46-D</option>
                                                    <option value="K-46-I">K-46-I</option>
                                                    <option value="K-47-D">K-47-D</option>
                                                    <option value="K-47-I">K-47-I</option>
                                                    <option value="K-48-D">K-48-D</option>
                                                    <option value="K-48-I">K-48-I</option>
                                                    <option value="L-1-I">L-1-I </option>
                                                    <option value="L-1-D">L-1-D </option>
                                                    <option value="L-2-I">L-2-I </option>
                                                    <option value="L-2-D">L-2-D </option>
                                                    <option value="L-3-I">L-3-I </option>
                                                    <option value="L-3-D">L-3-D </option>
                                                    <option value="L-4-I">L-4-I </option>
                                                    <option value="L-4-D">L-4-D </option>
                                                    <option value="L-5-I">L-5-I </option>
                                                    <option value="L-5-D">L-5-D </option>
                                                    <option value="L-6-I">L-6-I </option>
                                                    <option value="L-6-D">L-6-D </option>
                                                    <option value="L-7-I">L-7-I </option>
                                                    <option value="L-7-D">L-7-D </option>
                                                    <option value="L-8-I">L-8-I </option>
                                                    <option value="L-8-D">L-8-D </option>
                                                    <option value="L-9-I">L-9-I </option>
                                                    <option value="L-9-D">L-9-D </option>
                                                    <option value="L-10-I">L-10-I </option>
                                                    <option value="L-10-D">L-10-D </option>
                                                    <option value="L-11-I">L-11-I </option>
                                                    <option value="L-11-D">L-11-D </option>
                                                    <option value="L-12-I">L-12-I </option>
                                                    <option value="L-12-D">L-12-D </option>
                                                    <option value="L-13-I">L-13-I </option>
                                                    <option value="L-13-D">L-13-D </option>
                                                    <option value="L-14-I">L-14-I </option>
                                                    <option value="L-14-D">L-14-D </option>
                                                    <option value="L-15-I">L-15-I </option>
                                                    <option value="L-15-D">L-15-D </option>
                                                    <option value="L-16-I">L-16-I </option>
                                                    <option value="L-16-D">L-16-D </option>
                                                    <option value="L-17-I">L-17-I </option>
                                                    <option value="L-17-D">L-17-D </option>
                                                    <option value="L-18-I">L-18-I </option>
                                                    <option value="L-18-D">L-18-D </option>
                                                    <option value="L-19-I">L-19-I </option>
                                                    <option value="L-19-D">L-19-D </option>
                                                    <option value="L-20-I">L-20-I </option>
                                                    <option value="L-20-D">L-20-D </option>
                                                    <option value="L-21-I">L-21-I </option>
                                                    <option value="L-21-D">L-21-D </option>
                                                    <option value="L-22-I">L-22-I </option>
                                                    <option value="L-22-D">L-22-D </option>
                                                    <option value="L-23-I">L-23-I </option>
                                                    <option value="L-23-D">L-23-D </option>
                                                    <option value="L-24-I">L-24-I </option>
                                                    <option value="L-24-D">L-24-D </option>
                                                    <option value="L-25-I">L-25-I </option>
                                                    <option value="L-25-D">L-25-D </option>
                                                    <option value="L-26-I">L-26-I </option>
                                                    <option value="L-26-D">L-26-D </option>
                                                    <option value="L-27-I">L-27-I </option>
                                                    <option value="L-27-D">L-27-D </option>
                                                    <option value="L-28-I">L-28-I </option>
                                                    <option value="L-28-D">L-28-D </option>
                                                    <option value="L-29-I">L-29-I </option>
                                                    <option value="L-29-D">L-29-D </option>
                                                    <option value="L-30-I">L-30-I </option>
                                                    <option value="L-30-D">L-30-D </option>
                                                    <option value="L-31-I">L-31-I </option>
                                                    <option value="L-31-D">L-31-D </option>
                                                    <option value="L-32-I">L-32-I </option>
                                                    <option value="L-32-D">L-32-D </option>
                                                    <option value="L-33-I">L-33-I </option>
                                                    <option value="L-33-D">L-33-D </option>
                                                    <option value="L-34-I">L-34-I </option>
                                                    <option value="L-34-D">L-34-D </option>
                                                    <option value="L-35-I">L-35-I </option>
                                                    <option value="L-35-D">L-35-D </option>
                                                    <option value="L-36-I">L-36-I </option>
                                                    <option value="L-36-D">L-36-D </option>
                                                    <option value="L-37-I">L-37-I </option>
                                                    <option value="L-37-D">L-37-D </option>
                                                    <option value="L-38-I">L-38-I </option>
                                                    <option value="L-38-D">L-38-D </option>
                                                    <option value="L-39-I">L-39-I </option>
                                                    <option value="L-39-D">L-39-D </option>
                                                    <option value="L-40-I">L-40-I </option>
                                                    <option value="L-40-D">L-40-D </option>
                                                    <option value="L-41-I">L-41-I </option>
                                                    <option value="L-41-D">L-41-D </option>
                                                    <option value="L-42-I">L-42-I </option>
                                                    <option value="L-42-D">L-42-D </option>
                                                    <option value="L-43-I">L-43-I </option>
                                                    <option value="L-43-D">L-43-D </option>
                                                    <option value="L-44-I">L-44-I </option>
                                                    <option value="L-44-D">L-44-D </option>
                                                    <option value="L-45-D">L-45-D</option>
                                                    <option value="L-45-I">L-45-I</option>
                                                    <option value="L-46-D">L-46-D</option>
                                                    <option value="L-46-I">L-46-I</option>
                                                    <option value="L-47-D">L-47-D</option>
                                                    <option value="L-47-I">L-47-I</option>
                                                    <option value="L-48-D">L-48-D</option>
                                                    <option value="L-48-I">L-48-I</option>
                                                    <option value="M-1-I">M-1-I </option>
                                                    <option value="M-1-D">M-1-D </option>
                                                    <option value="M-2-I">M-2-I </option>
                                                    <option value="M-2-D">M-2-D </option>
                                                    <option value="M-3-I">M-3-I </option>
                                                    <option value="M-3-D">M-3-D </option>
                                                    <option value="M-4-I">M-4-I </option>
                                                    <option value="M-4-D">M-4-D </option>
                                                    <option value="M-5-I">M-5-I </option>
                                                    <option value="M-5-D">M-5-D </option>
                                                    <option value="M-6-I">M-6-I </option>
                                                    <option value="M-6-D">M-6-D </option>
                                                    <option value="M-7-I">M-7-I </option>
                                                    <option value="M-7-D">M-7-D </option>
                                                    <option value="M-8-I">M-8-I </option>
                                                    <option value="M-8-D">M-8-D </option>
                                                    <option value="M-9-I">M-9-I </option>
                                                    <option value="M-9-D">M-9-D </option>
                                                    <option value="M-10-I">M-10-I </option>
                                                    <option value="M-10-D">M-10-D </option>
                                                    <option value="M-11-I">M-11-I </option>
                                                    <option value="M-11-D">M-11-D </option>
                                                    <option value="M-12-I">M-12-I </option>
                                                    <option value="M-12-D">M-12-D </option>
                                                    <option value="M-13-I">M-13-I </option>
                                                    <option value="M-13-D">M-13-D </option>
                                                    <option value="M-14-I">M-14-I </option>
                                                    <option value="M-14-D">M-14-D </option>
                                                    <option value="M-15-I">M-15-I </option>
                                                    <option value="M-15-D">M-15-D </option>
                                                    <option value="M-16-I">M-16-I </option>
                                                    <option value="M-16-D">M-16-D </option>
                                                    <option value="M-17-I">M-17-I </option>
                                                    <option value="M-17-D">M-17-D </option>
                                                    <option value="M-18-I">M-18-I </option>
                                                    <option value="M-18-D">M-18-D </option>
                                                    <option value="M-19-I">M-19-I </option>
                                                    <option value="M-19-D">M-19-D </option>
                                                    <option value="M-20-I">M-20-I </option>
                                                    <option value="M-20-D">M-20-D </option>
                                                    <option value="M-21-I">M-21-I </option>
                                                    <option value="M-21-D">M-21-D </option>
                                                    <option value="M-22-I">M-22-I </option>
                                                    <option value="M-22-D">M-22-D </option>
                                                    <option value="M-23-I">M-23-I </option>
                                                    <option value="M-23-D">M-23-D </option>
                                                    <option value="M-24-I">M-24-I </option>
                                                    <option value="M-24-D">M-24-D </option>
                                                    <option value="M-25-D">M-25-D</option>
                                                    <option value="M-25-I">M-25-I</option>
                                                    <option value="M-26-D">M-26-D</option>
                                                    <option value="M-26-I">M-26-I</option>
                                                    <option value="M-27-D">M-27-D</option>
                                                    <option value="M-27-I">M-27-I</option>
                                                    <option value="M-28-D">M-28-D</option>
                                                    <option value="M-28-I">M-28-I</option>
                                                    <option value="M-29-D">M-29-D</option>
                                                    <option value="M-29-I">M-29-I</option>
                                                    <option value="M-30-D">M-30-D</option>
                                                    <option value="M-30-I">M-30-I</option>
                                                    <option value="M-31-D">M-31-D</option>
                                                    <option value="M-31-I">M-31-I</option>
                                                    <option value="M-32-D">M-32-D</option>
                                                    <option value="M-32-I">M-32-I</option>
                                                    <option value="M-33-D">M-33-D</option>
                                                    <option value="M-33-I">M-33-I</option>
                                                    <option value="M-34-D">M-34-D</option>
                                                    <option value="M-34-I">M-34-I</option>
                                                    <option value="M-35-D">M-35-D</option>
                                                    <option value="M-35-I">M-35-I</option>
                                                    <option value="M-36-D">M-36-D</option>
                                                    <option value="M-36-I">M-36-I</option>
                                                    <option value="M-37-D">M-37-D</option>
                                                    <option value="M-37-I">M-37-I</option>
                                                    <option value="M-38-D">M-38-D</option>
                                                    <option value="M-38-I">M-38-I</option>
                                                    <option value="M-39-D">M-39-D</option>
                                                    <option value="M-39-I">M-39-I</option>
                                                    <option value="M-40-D">M-40-D</option>
                                                    <option value="M-40-I">M-40-I</option>
                                                    <option value="M-41-D">M-41-D</option>
                                                    <option value="M-41-I">M-41-I</option>
                                                    <option value="M-42-D">M-42-D</option>
                                                    <option value="M-42-I">M-42-I</option>
                                                    <option value="M-43-D">M-43-D</option>
                                                    <option value="M-43-I">M-43-I</option>
                                                    <option value="M-44-D">M-44-D</option>
                                                    <option value="M-44-I">M-44-I</option>
                                                    <option value="M-45-D">M-45-D</option>
                                                    <option value="M-45-I">M-45-I</option>
                                                    <option value="M-46-D">M-46-D</option>
                                                    <option value="M-46-I">M-46-I</option>
                                                    <option value="M-47-D">M-47-D</option>
                                                    <option value="M-47-I">M-47-I</option>
                                                    <option value="M-48-D">M-48-D</option>
                                                    <option value="M-48-I">M-48-I</option>
                                                    <option value="N-1-I">N-1-I </option>
                                                    <option value="N-1-D">N-1-D </option>
                                                    <option value="N-2-I">N-2-I </option>
                                                    <option value="N-2-D">N-2-D </option>
                                                    <option value="N-3-I">N-3-I </option>
                                                    <option value="N-3-D">N-3-D </option>
                                                    <option value="N-4-I">N-4-I </option>
                                                    <option value="N-4-D">N-4-D </option>
                                                    <option value="N-5-I">N-5-I </option>
                                                    <option value="N-5-D">N-5-D </option>
                                                    <option value="N-6-I">N-6-I </option>
                                                    <option value="N-6-D">N-6-D </option>
                                                    <option value="N-7-I">N-7-I </option>
                                                    <option value="N-7-D">N-7-D </option>
                                                    <option value="N-8-I">N-8-I </option>
                                                    <option value="N-8-D">N-8-D </option>
                                                    <option value="N-9-I">N-9-I </option>
                                                    <option value="N-9-D">N-9-D </option>
                                                    <option value="N-10-I">N-10-I </option>
                                                    <option value="N-10-D">N-10-D </option>
                                                    <option value="N-11-I">N-11-I </option>
                                                    <option value="N-11-D">N-11-D </option>
                                                    <option value="N-12-I">N-12-I </option>
                                                    <option value="N-12-D">N-12-D </option>
                                                    <option value="N-13-I">N-13-I </option>
                                                    <option value="N-13-D">N-13-D </option>
                                                    <option value="N-14-I">N-14-I </option>
                                                    <option value="N-14-D">N-14-D </option>
                                                    <option value="N-15-I">N-15-I </option>
                                                    <option value="N-15-D">N-15-D </option>
                                                    <option value="N-16-I">N-16-I </option>
                                                    <option value="N-16-D">N-16-D </option>
                                                    <option value="N-17-I">N-17-I </option>
                                                    <option value="N-17-D">N-17-D </option>
                                                    <option value="N-18-I">N-18-I </option>
                                                    <option value="N-18-D">N-18-D </option>
                                                    <option value="N-19-I">N-19-I </option>
                                                    <option value="N-19-D">N-19-D </option>
                                                    <option value="N-20-I">N-20-I </option>
                                                    <option value="N-20-D">N-20-D </option>
                                                    <option value="N-21-I">N-21-I </option>
                                                    <option value="N-21-D">N-21-D </option>
                                                    <option value="N-22-I">N-22-I </option>
                                                    <option value="N-22-D">N-22-D </option>
                                                    <option value="N-23-I">N-23-I </option>
                                                    <option value="N-23-D">N-23-D </option>
                                                    <option value="N-24-I">N-24-I </option>
                                                    <option value="N-24-D">N-24-D </option>
                                                    <option value="N-25-D">N-25-D</option>
                                                    <option value="N-25-I">N-25-I</option>
                                                    <option value="N-26-D">N-26-D</option>
                                                    <option value="N-26-I">N-26-I</option>
                                                    <option value="N-27-D">N-27-D</option>
                                                    <option value="N-27-I">N-27-I</option>
                                                    <option value="N-28-D">N-28-D</option>
                                                    <option value="N-28-I">N-28-I</option>
                                                    <option value="N-29-D">N-29-D</option>
                                                    <option value="N-29-I">N-29-I</option>
                                                    <option value="N-30-D">N-30-D</option>
                                                    <option value="N-30-I">N-30-I</option>
                                                    <option value="N-31-D">N-31-D</option>
                                                    <option value="N-31-I">N-31-I</option>
                                                    <option value="N-32-D">N-32-D</option>
                                                    <option value="N-32-I">N-32-I</option>
                                                    <option value="N-33-D">N-33-D</option>
                                                    <option value="N-33-I">N-33-I</option>
                                                    <option value="N-34-D">N-34-D</option>
                                                    <option value="N-34-I">N-34-I</option>
                                                    <option value="N-35-D">N-35-D</option>
                                                    <option value="N-35-I">N-35-I</option>
                                                    <option value="N-36-D">N-36-D</option>
                                                    <option value="N-36-I">N-36-I</option>
                                                    <option value="N-37-D">N-37-D</option>
                                                    <option value="N-37-I">N-37-I</option>
                                                    <option value="N-38-D">N-38-D</option>
                                                    <option value="N-38-I">N-38-I</option>
                                                    <option value="N-39-D">N-39-D</option>
                                                    <option value="N-39-I">N-39-I</option>
                                                    <option value="N-40-D">N-40-D</option>
                                                    <option value="N-40-I">N-40-I</option>
                                                    <option value="N-41-D">N-41-D</option>
                                                    <option value="N-41-I">N-41-I</option>
                                                    <option value="N-42-D">N-42-D</option>
                                                    <option value="N-42-I">N-42-I</option>
                                                    <option value="N-43-D">N-43-D</option>
                                                    <option value="N-43-I">N-43-I</option>
                                                    <option value="N-44-D">N-44-D</option>
                                                    <option value="N-44-I">N-44-I</option>
                                                    <option value="N-45-D">N-45-D</option>
                                                    <option value="N-45-I">N-45-I</option>
                                                    <option value="N-46-D">N-46-D</option>
                                                    <option value="N-46-I">N-46-I</option>
                                                    <option value="N-47-D">N-47-D</option>
                                                    <option value="N-47-I">N-47-I</option>
                                                    <option value="N-48-D">N-48-D</option>
                                                    <option value="N-48-I">N-48-I</option>
                                                    <option value="O-1-D">O-1-D</option>
                                                    <option value="O-1-I">O-1-I</option>
                                                    <option value="O-2-D">O-2-D</option>
                                                    <option value="O-2-I">O-2-I</option>
                                                    <option value="O-3-D">O-3-D</option>
                                                    <option value="O-3-I">O-3-I</option>
                                                    <option value="O-4-D">O-4-D</option>
                                                    <option value="O-4-I">O-4-I</option>
                                                    <option value="O-5-D">O-5-D</option>
                                                    <option value="O-5-I">O-5-I</option>
                                                    <option value="O-6-D">O-6-D</option>
                                                    <option value="O-6-I">O-6-I</option>
                                                    <option value="O-7-D">O-7-D</option>
                                                    <option value="O-7-I">O-7-I</option>
                                                    <option value="O-8-D">O-8-D</option>
                                                    <option value="O-8-I">O-8-I</option>
                                                    <option value="O-9-D">O-9-D</option>
                                                    <option value="O-9-I">O-9-I</option>
                                                    <option value="O-10-D">O-10-D</option>
                                                    <option value="O-10-I">O-10-I</option>
                                                    <option value="O-11-D">O-11-D</option>
                                                    <option value="O-11-I">O-11-I</option>
                                                    <option value="O-12-D">O-12-D</option>
                                                    <option value="O-12-I">O-12-I</option>
                                                    <option value="O-13-D">O-13-D</option>
                                                    <option value="O-13-I">O-13-I</option>
                                                    <option value="O-14-D">O-14-D</option>
                                                    <option value="O-14-I">O-14-I</option>
                                                    <option value="O-15-D">O-15-D</option>
                                                    <option value="O-15-I">O-15-I</option>
                                                    <option value="O-16-D">O-16-D</option>
                                                    <option value="O-16-I">O-16-I</option>
                                                    <option value="O-17-D">O-17-D</option>
                                                    <option value="O-17-I">O-17-I</option>
                                                    <option value="O-18-D">O-18-D</option>
                                                    <option value="O-18-I">O-18-I</option>
                                                    <option value="O-19-D">O-19-D</option>
                                                    <option value="O-19-I">O-19-I</option>
                                                    <option value="O-20-D">O-20-D</option>
                                                    <option value="O-20-I">O-20-I</option>
                                                    <option value="O-21-D">O-21-D</option>
                                                    <option value="O-21-I">O-21-I</option>
                                                    <option value="O-22-D">O-22-D</option>
                                                    <option value="O-22-I">O-22-I</option>
                                                    <option value="O-23-D">O-23-D</option>
                                                    <option value="O-23-I">O-23-I</option>
                                                    <option value="O-24-D">O-24-D</option>
                                                    <option value="O-24-I">O-24-I</option>
                                                    <option value="O-25-D">O-25-D</option>
                                                    <option value="O-25-I">O-25-I</option>
                                                    <option value="O-26-D">O-26-D</option>
                                                    <option value="O-26-I">O-26-I</option>
                                                    <option value="O-27-D">O-27-D</option>
                                                    <option value="O-27-I">O-27-I</option>
                                                    <option value="O-28-D">O-28-D</option>
                                                    <option value="O-28-I">O-28-I</option>
                                                    <option value="O-29-D">O-29-D</option>
                                                    <option value="O-29-I">O-29-I</option>
                                                    <option value="O-30-D">O-30-D</option>
                                                    <option value="O-30-I">O-30-I</option>
                                                    <option value="O-31-D">O-31-D</option>
                                                    <option value="O-31-I">O-31-I</option>
                                                    <option value="O-32-D">O-32-D</option>
                                                    <option value="O-32-I">O-32-I</option>
                                                    <option value="O-33-D">O-33-D</option>
                                                    <option value="O-33-I">O-33-I</option>
                                                    <option value="O-34-D">O-34-D</option>
                                                    <option value="O-34-I">O-34-I</option>
                                                    <option value="O-35-D">O-35-D</option>
                                                    <option value="O-35-I">O-35-I</option>
                                                    <option value="O-36-D">O-36-D</option>
                                                    <option value="O-36-I">O-36-I</option>
                                                    <option value="O-37-D">O-37-D</option>
                                                    <option value="O-37-I">O-37-I</option>
                                                    <option value="O-38-D">O-38-D</option>
                                                    <option value="O-38-I">O-38-I</option>
                                                    <option value="O-39-D">O-39-D</option>
                                                    <option value="O-39-I">O-39-I</option>
                                                    <option value="O-40-D">O-40-D</option>
                                                    <option value="O-40-I">O-40-I</option>
                                                    <option value="O-41-D">O-41-D</option>
                                                    <option value="O-41-I">O-41-I</option>
                                                    <option value="O-42-D">O-42-D</option>
                                                    <option value="O-42-I">O-42-I</option>
                                                    <option value="O-43-D">O-43-D</option>
                                                    <option value="O-43-I">O-43-I</option>
                                                    <option value="O-44-D">O-44-D</option>
                                                    <option value="O-44-I">O-44-I</option>
                                                    <option value="O-45-D">O-45-D</option>
                                                    <option value="O-45-I">O-45-I</option>
                                                    <option value="O-46-D">O-46-D</option>
                                                    <option value="O-46-I">O-46-I</option>
                                                    <option value="O-47-D">O-47-D</option>
                                                    <option value="O-47-I">O-47-I</option>
                                                    <option value="O-48-D">O-48-D</option>
                                                    <option value="O-48-I">O-48-I</option>
                                                    <option value="P-1-D">P-1-D</option>
                                                    <option value="P-1-I">P-1-I</option>
                                                    <option value="P-2-D">P-2-D</option>
                                                    <option value="P-2-I">P-2-I</option>
                                                    <option value="P-3-D">P-3-D</option>
                                                    <option value="P-3-I">P-3-I</option>
                                                    <option value="P-4-D">P-4-D</option>
                                                    <option value="P-4-I">P-4-I</option>
                                                    <option value="P-5-D">P-5-D</option>
                                                    <option value="P-5-I">P-5-I</option>
                                                    <option value="P-6-D">P-6-D</option>
                                                    <option value="P-6-I">P-6-I</option>
                                                    <option value="P-7-D">P-7-D</option>
                                                    <option value="P-7-I">P-7-I</option>
                                                    <option value="P-8-D">P-8-D</option>
                                                    <option value="P-8-I">P-8-I</option>
                                                    <option value="P-9-D">P-9-D</option>
                                                    <option value="P-9-I">P-9-I</option>
                                                    <option value="P-10-D">P-10-D</option>
                                                    <option value="P-10-I">P-10-I</option>
                                                    <option value="P-11-D">P-11-D</option>
                                                    <option value="P-11-I">P-11-I</option>
                                                    <option value="P-12-D">P-12-D</option>
                                                    <option value="P-12-I">P-12-I</option>
                                                    <option value="P-13-D">P-13-D</option>
                                                    <option value="P-13-I">P-13-I</option>
                                                    <option value="P-14-D">P-14-D</option>
                                                    <option value="P-14-I">P-14-I</option>
                                                    <option value="P-15-D">P-15-D</option>
                                                    <option value="P-15-I">P-15-I</option>
                                                    <option value="P-16-D">P-16-D</option>
                                                    <option value="P-16-I">P-16-I</option>
                                                    <option value="P-17-D">P-17-D</option>
                                                    <option value="P-17-I">P-17-I</option>
                                                    <option value="P-18-D">P-18-D</option>
                                                    <option value="P-18-I">P-18-I</option>
                                                    <option value="P-19-D">P-19-D</option>
                                                    <option value="P-19-I">P-19-I</option>
                                                    <option value="P-20-D">P-20-D</option>
                                                    <option value="P-20-I">P-20-I</option>
                                                    <option value="P-21-D">P-21-D</option>
                                                    <option value="P-21-I">P-21-I</option>
                                                    <option value="P-22-D">P-22-D</option>
                                                    <option value="P-22-I">P-22-I</option>
                                                    <option value="P-23-D">P-23-D</option>
                                                    <option value="P-23-I">P-23-I</option>
                                                    <option value="P-24-D">P-24-D</option>
                                                    <option value="P-24-I">P-24-I</option>
                                                    <option value="P-25-D">P-25-D</option>
                                                    <option value="P-25-I">P-25-I</option>
                                                    <option value="P-26-D">P-26-D</option>
                                                    <option value="P-26-I">P-26-I</option>
                                                    <option value="P-27-D">P-27-D</option>
                                                    <option value="P-27-I">P-27-I</option>
                                                    <option value="P-28-D">P-28-D</option>
                                                    <option value="P-28-I">P-28-I</option>
                                                    <option value="P-29-D">P-29-D</option>
                                                    <option value="P-29-I">P-29-I</option>
                                                    <option value="P-30-D">P-30-D</option>
                                                    <option value="P-30-I">P-30-I</option>
                                                    <option value="P-31-D">P-31-D</option>
                                                    <option value="P-31-I">P-31-I</option>
                                                    <option value="P-32-D">P-32-D</option>
                                                    <option value="P-32-I">P-32-I</option>
                                                    <option value="P-33-D">P-33-D</option>
                                                    <option value="P-33-I">P-33-I</option>
                                                    <option value="P-34-D">P-34-D</option>
                                                    <option value="P-34-I">P-34-I</option>
                                                    <option value="P-35-D">P-35-D</option>
                                                    <option value="P-35-I">P-35-I</option>
                                                    <option value="P-36-D">P-36-D</option>
                                                    <option value="P-36-I">P-36-I</option>
                                                    <option value="P-37-D">P-37-D</option>
                                                    <option value="P-37-I">P-37-I</option>
                                                    <option value="P-38-D">P-38-D</option>
                                                    <option value="P-38-I">P-38-I</option>
                                                    <option value="P-39-D">P-39-D</option>
                                                    <option value="P-39-I">P-39-I</option>
                                                    <option value="P-40-D">P-40-D</option>
                                                    <option value="P-40-I">P-40-I</option>
                                                    <option value="P-41-D">P-41-D</option>
                                                    <option value="P-41-I">P-41-I</option>
                                                    <option value="P-42-D">P-42-D</option>
                                                    <option value="P-42-I">P-42-I</option>
                                                    <option value="P-43-D">P-43-D</option>
                                                    <option value="P-43-I">P-43-I</option>
                                                    <option value="P-44-D">P-44-D</option>
                                                    <option value="P-44-I">P-44-I</option>
                                                    <option value="P-45-D">P-45-D</option>
                                                    <option value="P-45-I">P-45-I</option>
                                                    <option value="P-46-D">P-46-D</option>
                                                    <option value="P-46-I">P-46-I</option>
                                                    <option value="P-47-D">P-47-D</option>
                                                    <option value="P-47-I">P-47-I</option>
                                                    <option value="P-48-D">P-48-D</option>
                                                    <option value="P-48-I">P-48-I</option>
                                                    <option value="IA-1-I">IA-1-I </option>
                                                    <option value="IA-1-D">IA-1-D </option>
                                                    <option value="IA-2-I">IA-2-I </option>
                                                    <option value="IA-2-D">IA-2-D </option>
                                                    <option value="IA-3-I">IA-3-I </option>
                                                    <option value="IA-3-D">IA-3-D </option>
                                                    <option value="IA-4-I">IA-4-I </option>
                                                    <option value="IA-4-D">IA-4-D </option>
                                                    <option value="IA-5-I">IA-5-I </option>
                                                    <option value="IA-5-D">IA-5-D </option>
                                                    <option value="IA-6-I">IA-6-I </option>
                                                    <option value="IA-6-D">IA-6-D </option>
                                                    <option value="IA-7-I">IA-7-I </option>
                                                    <option value="IA-7-D">IA-7-D </option>
                                                    <option value="IA-8-I">IA-8-I </option>
                                                    <option value="IA-8-D">IA-8-D </option>
                                                    <option value="IA-9-I">IA-9-I </option>
                                                    <option value="IA-9-D">IA-9-D </option>
                                                    <option value="IA-10-I">IA-10-I </option>
                                                    <option value="IA-10-D">IA-10-D </option>
                                                    <option value="IA-11-I">IA-11-I </option>
                                                    <option value="IA-11-D">IA-11-D </option>
                                                    <option value="IA-12-I">IA-12-I </option>
                                                    <option value="IA-12-D">IA-12-D </option>
                                                    <option value="IA-13-I">IA-13-I </option>
                                                    <option value="IA-13-D">IA-13-D </option>
                                                    <option value="IA-14-I">IA-14-I </option>
                                                    <option value="IA-14-D">IA-14-D </option>
                                                    <option value="IA-15-I">IA-15-I </option>
                                                    <option value="IA-15-D">IA-15-D </option>
                                                    <option value="IA-16-I">IA-16-I </option>
                                                    <option value="IA-16-D">IA-16-D </option>
                                                    <option value="IA-17-I">IA-17-I </option>
                                                    <option value="IA-17-D">IA-17-D </option>
                                                    <option value="IA-18-I">IA-18-I </option>
                                                    <option value="IA-18-D">IA-18-D </option>
                                                    <option value="IA-19-I">IA-19-I </option>
                                                    <option value="IA-19-D">IA-19-D </option>
                                                    <option value="IA-20-I">IA-20-I </option>
                                                    <option value="IA-20-D">IA-20-D </option>
                                                    <option value="IA-21-I">IA-21-I </option>
                                                    <option value="IA-21-D">IA-21-D </option>
                                                    <option value="IA-22-I">IA-22-I </option>
                                                    <option value="IA-22-D">IA-22-D </option>
                                                    <option value="IA-23-I">IA-23-I </option>
                                                    <option value="IA-23-D">IA-23-D </option>
                                                    <option value="IA-24-I">IA-24-I </option>
                                                    <option value="IA-24-D">IA-24-D </option>
                                                    <option value="IA-25-I">IA-25-I </option>
                                                    <option value="IA-25-D">IA-25-D </option>
                                                    <option value="IA-26-I">IA-26-I </option>
                                                    <option value="IA-26-D">IA-26-D </option>
                                                    <option value="IA-27-I">IA-27-I </option>
                                                    <option value="IA-27-D">IA-27-D </option>

                                                    <option value="IA-28-I">IA-28-I </option>
                                                    <option value="IA-28-D">IA-28-D </option>
                                                    <option value="IA-29-I">IA-29-I </option>
                                                    <option value="IA-29-D">IA-29-D </option>
                                                    <option value="I-30-I">I-30-I </option>
                                                    <option value="IA-30-D">IA-30-D </option>
                                                    <option value="IA-31-I">IA-31-I </option>
                                                    <option value="IA-31-D">IA-31-D </option>
                                                    <option value="IA-32-I">IA-32-I </option>
                                                    <option value="IA-32-D">IA-32-D </option>
                                                    <option value="IA-33-I">IA-33-I </option>
                                                    <option value="IA-33-D">IA-33-D </option>
                                                    <option value="IA-34-I">IA-34-I </option>
                                                    <option value="IA-34-D">IA-34-D </option>
                                                    <option value="IA-35-I">IA-35-I </option>
                                                    <option value="IA-35-D">IA-35-D </option>
                                                    <option value="IA-36-I">IA-36-I </option>
                                                    <option value="IA-36-D">IA-36-D </option>
                                                    <option value="IA-37-I">IA-37-I </option>
                                                    <option value="IA-37-D">IA-37-D </option>
                                                    <option value="IA-38-I">IA-38-I </option>
                                                    <option value="IA-38-D">IA-38-D </option>
                                                    <option value="IA-39-I">IA-39-I </option>
                                                    <option value="IA-39-D">IA-39-D </option>
                                                    <option value="IA-40-I">IA-40-I </option>
                                                    <option value="IA-40-D">IA-40-D </option>

                                                    <option value="IJ-1-I">IJ-1-I </option>
                                                    <option value="IJ-1-D">IJ-1-D </option>
                                                    <option value="IJ-2-I">IJ-2-I </option>
                                                    <option value="IJ-2-D">IJ-2-D </option>
                                                    <option value="IJ-3-I">IJ-3-I </option>
                                                    <option value="IJ-3-D">IJ-3-D </option>
                                                    <option value="IJ-4-I">IJ-4-I </option>
                                                    <option value="IJ-4-D">IJ-4-D </option>
                                                    <option value="IJ-5-I">IJ-5-I </option>
                                                    <option value="IJ-5-D">IJ-5-D </option>
                                                    <option value="IJ-6-I">IJ-6-I </option>
                                                    <option value="IJ-6-D">IJ-6-D </option>
                                                    <option value="IJ-7-I">IJ-7-I </option>
                                                    <option value="IJ-7-D">IJ-7-D </option>
                                                    <option value="IJ-8-I">IJ-8-I </option>
                                                    <option value="IJ-8-D">IJ-8-D </option>
                                                    <option value="IJ-9-I">IJ-9-I </option>
                                                    <option value="IJ-9-D">IJ-9-D </option>
                                                    <option value="IJ-10-I">IJ-10-I </option>
                                                    <option value="IJ-10-D">IJ-10-D </option>
                                                    <option value="IJ-11-I">IJ-11-I </option>
                                                    <option value="IJ-11-D">IJ-11-D </option>
                                                    <option value="IJ-12-I">IJ-12-I </option>
                                                    <option value="IJ-12-D">IJ-12-D </option>
                                                    <option value="IJ-13-I">IJ-13-I </option>
                                                    <option value="IJ-13-D">IJ-13-D </option>
                                                    <option value="IJ-14-I">IJ-14-I </option>
                                                    <option value="IJ-14-D">IJ-14-D </option>
                                                    <option value="IJ-15-I">IJ-15-I </option>
                                                    <option value="IJ-15-D">IJ-15-D </option>
                                                    <option value="IJ-16-I">IJ-16-I </option>
                                                    <option value="IJ-16-D">IJ-16-D </option>
                                                    <option value="IJ-17-I">IJ-17-I </option>
                                                    <option value="IJ-17-D">IJ-17-D </option>
                                                    <option value="IJ-18-I">IJ-18-I </option>
                                                    <option value="IJ-18-D">IJ-18-D </option>
                                                    <option value="IJ-19-I">IJ-19-I </option>
                                                    <option value="IJ-19-D">IJ-19-D </option>
                                                    <option value="IJ-20-I">IJ-20-I </option>
                                                    <option value="IJ-20-D">IJ-20-D </option>
                                                    <option value="IJ-21-I">IJ-21-I </option>
                                                    <option value="IJ-21-D">IJ-21-D </option>
                                                    <option value="IJ-22-I">IJ-22-I </option>
                                                    <option value="IJ-22-D">IJ-22-D </option>
                                                    <option value="IJ-23-I">IJ-23-I </option>
                                                    <option value="IJ-23-D">IJ-23-D </option>
                                                    <option value="IJ-24-I">IJ-24-I </option>
                                                    <option value="IJ-24-D">IJ-24-D </option>
                                                    <option value="IJ-25-I">IJ-25-I </option>
                                                    <option value="IJ-25-D">IJ-25-D </option>
                                                    <option value="IJ-26-I">IJ-26-I </option>
                                                    <option value="IJ-26-D">IJ-26-D </option>
                                                    <option value="IJ-27-I">IJ-27-I </option>
                                                    <option value="IJ-27-D">IJ-27-D </option>

                                                    <option value="IJ-28-I">IJ-28-I </option>
                                                    <option value="IJ-28-D">IJ-28-D </option>
                                                    <option value="IJ-29-I">IJ-29-I </option>
                                                    <option value="IJ-29-D">IJ-29-D </option>
                                                    <option value="I-30-I">I-30-I </option>
                                                    <option value="IJ-30-D">IJ-30-D </option>
                                                    <option value="IJ-31-I">IJ-31-I </option>
                                                    <option value="IJ-31-D">IJ-31-D </option>
                                                    <option value="IJ-32-I">IJ-32-I </option>
                                                    <option value="IJ-32-D">IJ-32-D </option>
                                                    <option value="IJ-33-I">IJ-33-I </option>
                                                    <option value="IJ-33-D">IJ-33-D </option>
                                                    <option value="IJ-34-I">IJ-34-I </option>
                                                    <option value="IJ-34-D">IJ-34-D </option>
                                                    <option value="IJ-35-I">IJ-35-I </option>
                                                    <option value="IJ-35-D">IJ-35-D </option>
                                                    <option value="IJ-36-I">IJ-36-I </option>
                                                    <option value="IJ-36-D">IJ-36-D </option>
                                                    <option value="IJ-37-I">IJ-37-I </option>
                                                    <option value="IJ-37-D">IJ-37-D </option>
                                                    <option value="IJ-38-I">IJ-38-I </option>
                                                    <option value="IJ-38-D">IJ-38-D </option>
                                                    <option value="IJ-39-I">IJ-39-I </option>
                                                    <option value="IJ-39-D">IJ-39-D </option>
                                                    <option value="IJ-40-I">IJ-40-I </option>
                                                    <option value="IJ-40-D">IJ-40-D </option>
                                                    <option value="">--AREA DE SURTIDO-- </option>
                                                    <option value="FA-1">FA-1 </option>
                                                    <option value="FA-2">FA-2 </option>
                                                    <option value="FA-3">FA-3 </option>
                                                    <option value="FB-1">FB-1 </option>
                                                    <option value="FB-2">FB-2 </option>
                                                    <option value="FB-3">FB-3 </option>
                                                    <option value="FC-1">FC-1 </option>
                                                    <option value="FC-2">FC-2 </option>
                                                    <option value="FC-3">FC-3 </option>
                                                    <option value="FD-1">FD-1 </option>
                                                    <option value="FD-2">FD-2 </option>
                                                    <option value="FD-3">FD-3 </option>
                                                    <option value="FE-1">FE-1 </option>
                                                    <option value="FE-2">FE-2 </option>
                                                    <option value="FE-3">FE-3 </option>
                                                    <option value="FF-1">FF-1 </option>
                                                    <option value="FF-2">FF-2 </option>
                                                    <option value="FF-3">FF-3 </option>
                                                    <option value="FG-1">FG-1 </option>
                                                    <option value="FG-2">FG-2 </option>
                                                    <option value="FG-3">FG-3 </option>
                                                    <option value="FH-1">FH-1 </option>
                                                    <option value="FH-2">FH-2 </option>
                                                    <option value="FH-3">FH-3 </option>
                                                    <option value="FI-1">FI-1 </option>
                                                    <option value="FI-2">FI-2 </option>
                                                    <option value="FI-3">FI-3 </option>
                                                    <option value="FJ-1">FJ-1 </option>
                                                    <option value="FJ-2">FJ-2 </option>
                                                    <option value="FJ-3">FJ-3 </option>
                                                    <option value="FK-1">FK-1 </option>
                                                    <option value="FK-2">FK-2 </option>
                                                    <option value="FK-3">FK-3 </option>
                                                    <option value="FL-1">FL-1 </option>
                                                    <option value="FL-2">FL-2 </option>
                                                    <option value="FL-3">FL-3 </option>
                                                    <option value="FM-1">FM-1 </option>
                                                    <option value="FM-2">FM-2 </option>
                                                    <option value="FM-3">FM-3 </option>
                                                    <option value="FN-1">FN-1 </option>
                                                    <option value="FN-2">FN-2 </option>
                                                    <option value="FN-3">FN-3 </option>
                                                    <option value="FO-1">FO-1 </option>
                                                    <option value="FO-2">FO-2 </option>
                                                    <option value="FO-3">FO-3 </option>
                                                    <option value="FP-1">FP-1 </option>
                                                    <option value="FP-2">FP-2 </option>
                                                    <option value="FP-3">FP-3 </option>
                                                    <option value="FQ-1">FQ-1 </option>
                                                    <option value="FQ-2">FQ-2 </option>
                                                    <option value="FQ-3">FQ-3 </option>
                                                    <option value="FR-1">FR-1 </option>
                                                    <option value="FR-2">FR-2 </option>
                                                    <option value="FR-3">FR-3 </option>
                                                    <option value="FS-1">FS-1 </option>
                                                    <option value="FS-2">FS-2 </option>
                                                    <option value="FS-3">FS-3 </option>
                                                    <option value="FT-1">FT-1 </option>
                                                    <option value="FT-2">FT-2 </option>
                                                    <option value="FT-3">FT-3 </option>
                                                    <option value="FU-1">FU-1 </option>
                                                    <option value="FU-2">FU-2 </option>
                                                    <option value="FU-3">FU-3 </option>
                                                    <option value="FV-1">FV-1 </option>
                                                    <option value="FV-2">FV-2 </option>
                                                    <option value="FV-3">FV-3 </option>
                                                    <option value="FW-1">FW-1 </option>
                                                    <option value="FW-2">FW-2 </option>
                                                    <option value="FW-3">FW-3 </option>
                                                    <option value="FX-1">FX-1 </option>
                                                    <option value="FX-2">FX-2 </option>
                                                    <option value="FX-3">FX-3 </option>
                                                    <option value="F-AE-1">F-AE-1 </option>
                                                    <option value="F-AE-2">F-AE-2 </option>
                                                    <option value="F-AE-3">F-AE-3 </option>
                                                    <option value="F-AF-1">F-AF-1 </option>
                                                    <option value="F-AF-2">F-AF-2 </option>
                                                    <option value="F-AF-3">F-AF-3 </option>
                                                    <option value="F-AG-1">F-AG-1 </option>
                                                    <option value="F-AG-2">F-AG-2 </option>
                                                    <option value="F-AG-3">F-AG-3 </option>
                                                    <option value="F-AH-1">F-AH-1 </option>
                                                    <option value="F-AH-2">F-AH-2 </option>
                                                    <option value="F-AH-3">F-AH-3 </option>
                                                    <option value="F-AI-1">F-AI-1 </option>
                                                    <option value="F-AI-2">F-AI-2 </option>
                                                    <option value="F-AI-3">F-AI-3 </option>
                                                    <option value="F-AJ-1">F-AJ-1 </option>
                                                    <option value="F-AJ-2">F-AJ-2 </option>
                                                    <option value="F-AJ-3">F-AJ-3 </option>
                                                    <option value="F-AK-1">F-AK-1 </option>
                                                    <option value="F-AK-2">F-AK-2 </option>
                                                    <option value="F-AK-3">F-AK-3 </option>
                                                    <option value="F-AL-1">F-AL-1 </option>
                                                    <option value="F-AL-2">F-AL-2 </option>
                                                    <option value="F-AL-3">F-AL-3 </option>
                                                    <option value="F-AM-1">F-AM-1 </option>
                                                    <option value="F-AM-2">F-AM-2 </option>
                                                    <option value="F-AM-3">F-AM-3 </option>
                                                    <option value="F-AN-1">F-AN-1 </option>
                                                    <option value="F-AN-2">F-AN-2 </option>
                                                    <option value="F-AN-3">F-AN-3 </option>
                                                    <option value="PISO-RACK-S">PISO-RACK-S</option>
                                                </select>
                                                <input type="submit" name="Submit" value="Ubicar" /></td>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %> 
                                                </tr>
                                                <tr>
                                                    <td class="sidebarHeader"><span class="style1">Ubicaci&oacute;n en el Almac&eacute;n </span><br />
                                                        <hr />      
                                                        <table width="1029" border="1" align="center">
                                                            <tr bgcolor="#02407a" class="enca">
                                                                <td width="30" background="imagenes/aa.gif" ><div align="center" class="style7">ID REG</div></td>
                                                                <%
                                                                    if (rol > 2) {
                                                                %>
                                                                <td width="69" background="imagenes/aa.gif" ><div align="center" class="style7">MODIFICAR</div></td>
                                                                <%
                                                                    }
                                                                %>
                                                                <td width="47" background="imagenes/aa.gif" ><div align="center"><span class="style7">CODIGO DE BARRAS </span></div></td>
                                                                <td width="47" background="imagenes/aa.gif" ><div align="center" class="style7">CLAVE</div></td>
                                                                <td width="35" background="imagenes/aa.gif" ><div align="center" class="style7">LOTE</div></td>
                                                                <td width="97" background="imagenes/aa.gif" ><div align="center" class="style7">DESCRIPCIÓN</div></td>
                                                                <td width="72" background="imagenes/aa.gif" ><div align="center" class="style7">ORIGEN</div></td>
                                                                <td width="72" background="imagenes/aa.gif" ><div align="center" class="style7">MARCA</div></td>
                                                                <td width="72" background="imagenes/aa.gif" ><div align="center" class="style7">PRESENTACIÓN</div></td>
                                                                <td width="72" background="imagenes/aa.gif" ><div align="center" class="style7">CADUCIDAD</div></td>

                                                                <td width="68" background="imagenes/aa.gif" ><div align="center" class="style7">UBICACIÓN</div></td>
                                                                <td width="81" background="imagenes/aa.gif" ><div align="center" class="style7">CAJAS COMPLETAS </div></td>
                                                                <td width="71" background="imagenes/aa.gif" ><div align="center" class="style7">PZAS/CAJA</div></td>
                                                                <td width="44" background="imagenes/aa.gif" ><div align="center" class="style7">RESTO</div></td>
                                                                <td width="76" background="imagenes/aa.gif" ><div align="center" class="style7">EXISTENCIA EN PIEZAS</div></td>
                                                                <td width="54" background="imagenes/aa.gif" ><div align="center" class="style7">TOTAL DE CAJAS</div></td>
                                                            </tr>

                                                            <%
                                                                if (ubi.equals("0")) {
                                                            %>  
                                                            <script>
                                                                alert("ESCOJA UN OPCIÓN DE UBICACIÓN, POR FAVOR INTENTALO NUEVAMENTE");
                                                            </script>
                                                            <%
                                                                }
                                                                //out.print(""+ban+); 
                                                                if (ban == 0)//cuando no se haya activado el botón
                                                                {
                                                                    rset_001 = stmt_001.executeQuery("select * from datos_inv_cod where clave='1' and cant!=0 order by equipo asc;");
                                                                }
                                                                if (ban == 1) {
                                                                    rset_001 = stmt_001.executeQuery("select * from datos_inv_cod where (clave='" + clave + "' and lote='" + lote + "' and cant!=0);");
                                                                }
                                                                if (ban == 2) {
                                                                    rset_001 = stmt_001.executeQuery("select * from datos_inv_cod where (clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubic + "' and cant!=0);");
                                                                }
                                                                //  rset_001=stmt_001.executeQuery("select * from datos_inv_cod where clave='"+clave+"';");

                                                                if (ban == 3) {
                                                                    //ubicar=
                                                                    rset_001 = stmt_001.executeQuery("select * from datos_inv_cod where (clave='" + clave + "' and lote='" + lote + "' and ubi='" + ubicar + "' and cant!=0);");
                                                                }

                                                                if (ban == 4) {
                                                                    //ubicar=
                                                                    rset_001 = stmt_001.executeQuery("select * from datos_inv_cod where ubi='NUEVO' and cant!=0;");
                                                                }

                                                                if (ban == 5) {

                                                                    rset_001 = stmt_001.executeQuery("select * from datos_inv_cod where clave='" + clave1 + "' and cant!=0;");
                                                                }
                                                                if (ban == 6) {
                                                                    rset_001 = stmt_001.executeQuery("select * from datos_inv_cod where (clave='" + clave1 + "' and ubi='" + ubic + "'  and cant!=0);");
                                                                }
                                                                while (rset_001.next()) {
                                                        //clagto_jv=rset_001.getString("clave"); 

                                                            %> 
                                                            <tr>
                                                            <td class="detailText"><b><!--a href="test1.jsp?id=<%=rset_001.getString("id_cap_inv")%>"--><%=rset_001.getString("id_cap_inv")%><!--/a--></b></td>
                                                                <%
                                                                    if (rol > 2) {
                                                                %>
                                                                <td class="detailText"><b><a href="/Ubi/login?id_clave=<%=rset_001.getString("id_cap_inv")%>&nombre=<%=user%>&ban=5">Modificar?</a></b></td>
                                                                            <%
                                                                                }
                                                                            %>
                                                                <td class="detailText"><%=rset_001.getString("cod_bar")%></td>
                                                                <td class="detailText"><%=rset_001.getString("clave")%></td>
                                                                <td class="detailText"><%=rset_001.getString("lote")%></td>
                                                                <td class="detailText">
                                                                    <label>
                                                                        <textarea name="textfield" readonly class="detailText"><%=rset_001.getString("descr")%></textarea>
                                                                    </label></td>
                                                                <td class="detailText">&nbsp;<%=rset_001.getString("origen")%></td>
                                                                <td class="detailText">&nbsp;<%=rset_001.getString("marca")%></td>
                                                                <td class="detailText">&nbsp;<%=rset_001.getString("um")%></td>
                                                                <td class="detailText"><%=rset_001.getString("cadu")%></td>
                                                                <td class="detailText"><%=rset_001.getString("ubi")%></td>
                                                                <%


                                                                %>
                                                                <td class="detailText">
                                                                    <%=df.format(Integer.parseInt(rset_001.getString("cajas")))%>		  </td>
                                                                <td class="detailText"><%=df.format(Integer.parseInt(rset_001.getString("piezas")))%></td>
                                                                <td class="detailText"><%=df.format(Integer.parseInt(rset_001.getString("resto")))%></td>
                                                                <td class="detailText"><%=df.format(Integer.parseInt(rset_001.getString("cant")))%></td>
                                                                <%

                                                                    //
                                                                    String rec_ibe = rset_001.getString("cant");
                                                                    existencia_jv = Integer.parseInt(rec_ibe);
                                                                    suma_existencia = suma_existencia + existencia_jv;
                                                                    //
                                                                    no_cajas = rset_001.getString("cajas");
                                                                    cajas = Integer.parseInt(no_cajas);
                                                                    var_resto = rset_001.getString("resto");
                                                                    resto = Integer.parseInt(var_resto);
                                                                    if (resto != 0) {
                                                                        cajas++;
                                                                    }
                                                                %>
                                                                <td class="detailText"><%=df.format(cajas)%></td>
                                                            </tr>
                                                            <%
                                                                }
                                                            %>
                                                            <tr>
                                                                <td class="detailText">&nbsp;</td>
                                                                <%
                                                                    if (rol > 2) {
                                                                %>
                                                                <td class="detailText">&nbsp;</td>
                                                                <%
                                                                    }
                                                                %>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText">&nbsp;</td>
                                                                <td class="detailText"></td>
                                                                <td class="detailText"><div align="center"><%=df.format(suma_existencia)%></div></td>
                                                                <td class="detailText">&nbsp;</td>
                                                            </tr>
                                                        </table>	        </td>
                                                </tr>
                                                <tr>		</tr>

                                                <tr>
                                                    <!--td class="detailText" valign="top"><p>&nbsp;</p><br />            </td-->
                                                </tr>
                                                <tr>
                                                    <td class="subHeader">GNKL Software  <hr />          </td>
                                                </tr>
                                                <tr>
                                                    <!--td class="detailText" valign="top"><p>&nbsp;</p>           </td-->
                                                </tr>
                                                </table>
                                                </form>    </td>
                                                <td width="27">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td width="24">&nbsp;</td>
                                                    <td width="70">&nbsp;</td>
                                                    <td width="943">&nbsp;</td>
                                                    <td width="27">&nbsp;</td>
                                                    <td width="7">&nbsp;</td>
                                                </tr>
                                                </table>
                                                <br />
                                                <map name="Map" id="Map">
                                                    <area shape="poly" coords="241,165" href="#" />
                                                    <area shape="poly" coords="230,40,231,88,270,43" href="#" />
                                                </map>
                                                <map name="Map2" id="Map2"><area shape="rect" coords="4,3,31,29" href="gnr_infor2_ubi.jsp?boton=SICCAL" />
                                                </map>
                                                <%
                                                    // ----- try que cierra la conexión a la base de datos
                                                    try {
                                                        // Se cierra la conexión dentro del try
                                                        conn_001.close();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();;
                                                    } finally {
                                                        if (conn_001 != null) {
                                                            conn_001.close();
                                                            if (conn_001.isClosed()) {
                                                            }
                                                        }
                                                    }
                                                    //out.print(mensaje);
                                                    // ---- fin de la conexión	 	  
                                                    try {
                                                        // Se cierra la conexión dentro del try
                                                        conn_sed.close();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();;
                                                    } finally {
                                                        if (conn_sed != null) {
                                                            conn_sed.close();
                                                            if (conn_sed.isClosed()) {
                                                            }
                                                        }
                                                    }
                                                                         //out.print(mensaje);
                                                    // ---- fin de la conexión	 	  

                                                %>
                                                </body>
                                                </html>
