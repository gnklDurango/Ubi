<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date"  import="java.text.NumberFormat" import="java.util.Locale" errorPage=""%>
<% java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
	String date=""; 
   String res=""; 
 
 if(month >=1 && month <= 9)  
 {
 res ="0"+month;
// month=Integer.parseInt(res);
   date=" "+day;
   date= date+"/"+res;
   date= date+"/"+year;  

 //out.print(""+res); 
 }
 else 
{
      date=" "+day;
      date= date+"/"+month;
      date= date+"/"+year;  
	  res+=month;
}
 
%>
<% Class.forName("org.gjt.mm.mysql.Driver");
        Connection conn_001 = DriverManager.getConnection("jdbc:mysql://localhost/entrega_diaria");
        Statement stmt_001 = conn_001.createStatement();
		Statement stmt_0001 = conn_001.createStatement();
        //stmt_001.execute("commit");
		 String exis[]= new String[5000];//array for save the ubi
		 String cla_ves[]= new String[5000];//array for store the claves
         String lot_es[]= new String[5000];//array for store the lotes
		
		ResultSet rset_001=null;
		 ResultSet rset_002=null;
		 
		 String clave1_jv="",descrip1_jv="",lote21_jv="",cad21_jv="",ubi1_jv="",cajas1_jv="",pzas1_jv="",resto1_jv="",exi1_jv="",descrip_jv="",cad2_jv="";

 String clave="-",ubi="r",ubic_cb="",cb="",claves="",lotes="",cantm="";
 String but="r";
 
 rset_001 = stmt_001.executeQuery("SELECT STR_TO_DATE('"+date+"', '%d/%m/%Y')"); 
                    while(rset_001.next()){
                    date= rset_001.getString("STR_TO_DATE('"+date+"', '%d/%m/%Y')");
					}	
 //variables para el calculo de la disminución de cant
 String recibe_cant="",recibe_ubi="",recibe_clave="",recibe_lote="",recibe_cadu="",recibe_nocajas="",recibe_resto="",recibe_id="",recibe_descr="";

//variables para el segundo query del método de ubicar
String recibe_cant2="",recibe_ubi2="",recibe_clave2="",recibe_lote2="",recibe_cadu2="",recibe_nocajas2="",recibe_npzas2="",recibe_resto2="",recibe_id2="";

//variables para realizar el cáculo cuando la datos concuerden en la misma ubicación
int total_caj=0,total_res=0,total_exi=0,suma_nocajas=0,suma_resto=0,suma_exi=0,suma_nocajas2=0,suma_resto2=0,suma_exi2=0;

//variables para ubicar en dos posiciones
String caj_a_mov="0",resto_ubi="0",cont_cant="0";

//variables que se utilizan para cuando sean iguales lo que se va a mover con lo que haya en la ubicación, misma clave, lote, etc
int iguales_porcamb=0,iguales_resto=0,totales_cajas=0,totales_resto=0,npzas_iguales=0,exis_iguales=0;
String resto_porcamb="";

int cajass=0;

 int calcula=0,total=0,exist=0;
 int ban=0,pos=0,pos_cla=0,pos_lot=0,cont=0;
  String lote="-",ubic="",dis="",ubicar="";
 String resto_txtf="",recibe_res="";
 //toma el valor del resto en la tabla
 int restos_txtf=0;
 //toma el valor del txtfield asociado
 int resto_valor=0;
 //variable que toma el valor de la disminución entre el valor del resto de la tabla y lo que el usuario introduce
 int total_resto=0;
 //variable que toma el valor de no pzas de la tabla
 String recibe_npzas="";
 //variables para obtener la suma de datos cuando la ubi tenga los mismos datos a cambiar
 int exis_calc=0,cantm_int=0,restoubi_int=0,num_pzas=0;
 //variables para obtener la disminución del resto cuando no son iguales
 String resto_ubicar="0";
 int restoubicar_int=0;
 
 
 int no_pzas_mov=0,total_exis=0;
 
 int npzas=0,total_npzas=0;
 String no_cajas="";
 String var_resto="",var_resto2="",folio="";
 int resto=0,resto2=0;
 
 int cajas=0;
 String pass_jv="";
 int correct1=0;
String usu_jv="";
   try {
		usu_jv = request.getParameter("usuario"); 
		//only = request.getParameter("id_only");      			   
} catch (Exception e) { }
//   out.print(""+usuario_jv);
   try { 
        but=""+request.getParameter("Submit");
        //altaOK="no";
       }catch(Exception e){System.out.print("not");}
	
		
	  
	 
	  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<script src="list02.js" type="text/javascript"> </script>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>Ubicaci&oacute;n en ALMAC&Eacute;N</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="mm_entertainment.css" type="text/css" />
<style type="text/css">
<!--
.style1 {color: #99CCFF}
.style2 {color: #99CCFF; font-size: 10px; }
.Estilo1 {color: #FFFFFF}
.style11 {color: #333333}
-->
</style>
</head>
<body bgcolor="#14285f">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="02021e">
    <td colspan="2" rowspan="2" nowrap="nowrap" bgcolor="#FFFBF0"><img src="gnk_toluca.jpg" alt="Header image" border="0" /></td>
    <td height="45" colspan="2" valign="bottom" nowrap="nowrap" bgcolor="#FFFBF0" id="logo">SISTEMA DE REPORTE DE UBICACIONES RUTA</td>
    <td width="45" bgcolor="#FFFBF0">&nbsp;</td>
  </tr>
  <tr bgcolor="02021E">
    <td height="41" colspan="2" valign="middle" nowrap="nowrap" bgcolor="#FFFBF0" id="tagline">ALMAC&Eacute;N GNK LOG&Iacute;STICA - CEDIS TOLUCA </td>
	<td width="45" bgcolor="#FFFBF0">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5" bgcolor="#cc3300"><img src="mm_spacer.gif" alt="" width="1" height="2" border="0" /></td>
  </tr>

   <tr>
    <td colspan="5"><img src="mm_spacer.gif" alt="" width="1" height="2" border="0" /></td>
  </tr>

   <tr>
    <td colspan="5" bgcolor="#cc3300"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

   <tr>
    <td colspan="5" id="dateformat">&nbsp;
	&nbsp; &nbsp; <!--a href="javascript:;">home</a-->	</td>
  </tr>
  <tr>
   <td width="34" valign="top">&nbsp;</td>
   <td colspan="2" valign="top"><br />
   <form method="post" name="form" action="entrega.jsp?usuario=<%=usu_jv%>">
	<table border="0" cellspacing="0" cellpadding="2" width="1222">
        <tr>
          <td class="subHeader">&nbsp;</td>
        </tr>
        <tr>
          <td class="bodyText"><p style="margin-top: 0;"><span class="style1">
            <label></label>
		      </span>&nbsp;&nbsp;&nbsp;<a href="u_bi.jsp?usuario=<%=usu_jv%>" title="Regresar" accesskey="w">Regresar</a>
		&nbsp;&nbsp;<a href="index_ubi.jsp">SALIR</a><hr />  </td>

        </tr>
        <tr>
          <td class="sidebarHeader"><p><span class="Estilo1">Ubicaci&oacute;n en el Almac&eacute;n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Exportar<img src="icono_excel.gif" border="0" usemap="#Map2"/></span></p>
            <p><span class="Estilo1">Ingrese Folio:</span>
              <input type="submit" name="Submit" value="Folio" /><br />
              </p>
            <hr />      
		   <table width="1205" border="1" align="center">
		    <tr>
		      
		   
		   
		   <td width="136" class="detailText Estilo1">CLAVE</td>
		   <td width="106" class="detailText Estilo1">LOTE</td>
		   <td width="406" class="detailText Estilo1">DESCRIPCIÓN</td>
		   <td width="95" class="detailText Estilo1">CADUCIDAD</td>
		  
		  
		  <td width="144" class="detailText Estilo1">EXISTENCIA EN PIEZAS</td>
		  </tr>
		   
		   <%
		   
		    if(ubi.equals("0"))
			  {
			%>  
			<script>					 	
	  			alert("ESCOJA UN OPCIÓN DE UBICACIÓN, POR FAVOR INTENTALO NUEVAMENTE");
	  		</script>
			<%
			 }
			 
		   if(but.equals("Folio"))//cuando no se haya activado el botón
		      {
			  
			  rset_001=stmt_001.executeQuery("select * from entrega_ruta order by clave asc;");
		   
		   }
			while (rset_001.next()) 
                  { 
                    //clagto_jv=rset_001.getString("clave"); 
                 
		   %> 
		  <tr>
		   
		  
		  
		  <td class="detailText Estilo1"><%=rset_001.getString("clave")%></td>
		   <td class="detailText Estilo1"><%=rset_001.getString("lote")%></td>
		  <td class="detailText Estilo1"><%=rset_001.getString("descrip")%></td>
		  <td class="detailText Estilo1"><%=rset_001.getString("cadu")%></td>
		  
		  <td class="detailText Estilo1"><%=rset_001.getString("cant_sur")%></td>
		  </tr>
		   <%
		    }
		  %>
		  </table>	        </td>
        </tr>
        <tr>		</tr>
        
        <tr>
          <td class="detailText" valign="top"><br />            </td>
        </tr>
        <tr>
          <td class="subHeader">GNKL Software <br /> <hr />          </td>
        </tr>
        <tr>
          <td class="detailText" valign="top"><table width="852" border="0">
            <tr>
              <th width="283" scope="col"><p align="justify"><span class="smallText">PROHIBIDA SU REPRODUCCI&Oacute;N PARCIAL O TOTAL, SI REQUIERE LA INFORMACI&Oacute;N RECURRA CON EL POSEEDOR DEL DOCUMENTO ORIGINAL </span></p></th>
              <th width="276" scope="col"><p align="center" class="style2">VERSI&Oacute;N 0 </p>
                  <p align="center" class="style2">FECHA:30/04/2010 </p></th>
              <th width="279" scope="col"><div align="right"><span class="smallText">GNKL-T-7 F 03 </span></div></th>
            </tr>
          </table>          <p>&nbsp;</p>           </td>
        </tr>
      </table>
	  </form>
    </td>
    <td width="87">&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
  <tr>
    <td width="34">&nbsp;</td>
    <td width="79">&nbsp;</td>
    <td width="781">&nbsp;</td>
    <td width="87">&nbsp;</td>
	<td width="45">&nbsp;</td>
  </tr>
</table>
<br />
<map name="Map" id="Map">
<area shape="poly" coords="241,165" href="#" />
<area shape="poly" coords="230,40,231,88,270,43" href="#" />
</map>
<map name="Map2" id="Map2"><area shape="rect" coords="4,3,31,29" href="gnr_entrega.jsp?boton=GENERAR&folio=<%=folio%>" />
</map>
</body>
</html>
