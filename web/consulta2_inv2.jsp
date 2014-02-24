<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.Date" errorPage="" import="java.text.SimpleDateFormat" session="true"%>

<%
HttpSession sesion = request.getSession(); 
//out.print("Id de sesion: "+sesion.getId());
String val1="", user1="",id_sesion="",usu_jv="";

String recibe_id_jv=(String)session.getAttribute("id_clave");
String hora_ini_jv=(String)session.getAttribute("hora_ini_vi");
String equipo_jv=(String)session.getAttribute("equi_vi");
String integrantes_jv=(String)session.getAttribute("integran_vi");
String lugar_jv=(String)session.getAttribute("lugar_vi");
//out.print(recibe_id_jv);

//out.print(sesion.getAttribute("valida"));
if (sesion.getAttribute("valida")!=null){
	val1=(String)sesion.getAttribute("valida");
	user1=(String)sesion.getAttribute("nombre");
        id_sesion=(String)sesion.getAttribute("id");
	out.print(val1+"---"+user1);
        usu_jv=user1;
}

//out.print(user);
if(!val1.equals("valida")){
	//out.print("regresa al index");
	%>
    <script>self.location='index.jsp';</script>
    <%
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

<% 
/*----------------------------------------------------------------------------------------------------------------------
Nombre del Archivo:reg_nueva.jsp
Fecha:2010
Autor: RHW
  ----------------------------------------------------------------------------------------------------------------------*/

Class.forName("org.gjt.mm.mysql.Driver");

        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost/dgo");
        Statement stmt1  = null;
        ResultSet rset1  = null;
		 stmt1 = conn1.createStatement();

	 // var para Guardar
		//String txtf_1_jv= "";
		//String txtf_2_jv= "";
		String txtf_1_jv= "";
		String loten_jv= "";
		String cadun_jv= "";
		String cantn_jv= "";
		String ubin_jv= "";
//varible to get the 3 values of the date
		String cadudia_jv="";
		String cadumes_jv="";
		String caduano_jv="";
String eliminar_jv="";
		//---------------------------------------

String max_jv="";
int cb1_jv=0;
//array para almacenar las descris
String cad1_des[]=new String[10000];
String query_var="",var_des="",des_jv="";

String part_jv="";
String codeb_jv="";
String um_jv="";
String marca_jv="";
String coincidir_jv="";
String coincidir2_jv="";

String cajas_jv="";
String npzas_jv="";
//String pzas_jv="";
//String resto_jv="0";
//String exist_jv="";

 String enc_jv="";
 String clagto_jv="";
 String unigto_jv="";
 String juris3_jv="";
 String juris4_jv="";
 
 String encar2_jv="";
 String cuantos_jv="1";
 //String exi_jv="";
 
 String cie_jv="";
 int loop=0;
 
 String cve11_jv="";
 
 String cveuni_jv="";
 String fecha="";
 String sps_jv="";
 String jurisdi_jv="";
 String folr_jv="";
 String umed_jv="";
 String tusu_jv="";
 String medico_jv="";
 String paciente_jv="";
 String ccie_jv="";
 String cve1_jv="";
 String desc1_jv="";
 String lote1_jv="";
 String cad1_jv="";
 String cr1_jv="";
 String cs1_jv="";
 String exi1_jv="";
 String cve2_jv="";
 String descr2_jv="";
 String llote2_jv="";
 String cad2_jv="";
 String cr2_jv="";
 String cs2_jv="";
 String exxi2_jv="";
 String cve3_jv="";
 String descc3_jv="";
 String lote33_jv="";
 String cad3_jv="";
 String cr3_jv="";
 String cs3_jv="";
 String exi33_jv="";
 
 //variable para el proy captura de cb
 String cb_jv="";
//variable para el proy captura de cb_ean
 String cbean_jv="";
 
 //variable para el segundo Mostrar
 	String clave2_jv="";
	String desc2_jv= "";
	String lote2_jv= ""; 
	//String cad2_jv= "";
	String lote22_jv= "";
	String cadu2_jv= "";
	String exis2_jv= "";
	String costo2_jv="";
	String exi2_jv="";
	
	String juris2_jv="";
	String date_jv="";
	String day_jv="";
	String mounth_jv="";
	String year_jv="";
//variable for the Captura 3
    String clave3_jv="";
	String desc3_jv= "";
	String lote3_jv= ""; 
	//String lote_3_jv= "";
	String cadu3_jv= "";
	String exis3_jv= "";
	String costo3_jv="";
	String exi3_jv="";
	
	String juris_4_jv="";
	
//variables for get the values of the txtf

String spss_jv="";

String med_jv=""; 
String pac_jv=""; 
String tu_jv="";
 
String spss2_jv="";
String fol22_jv="";
String med2_jv=""; 
String pac2_jv=""; 
String tu2_jv="";

//VARIABLES PARA LA MULTIPLICACION
String exi_jv="0";
String pzas_jv="0";
String resto_jv="0";
String exist_jv="0";

String fol2_jv="";
//bandera para saber si existe el cb en la tabla
int ban=0;

int correct1=0;
/*String usu_jv="";
   try {
		usu_jv = request.getParameter("usuario"); 
		//only = request.getParameter("id_only");      			   
} catch (Exception e) { }*/



/*String lugar_jv="";
 	  try {
       		lugar_jv = request.getParameter("lugar_vi");       			   
	  } catch (Exception e) { }*/	  
/*String equipo_jv="";
 	  try {
       		equipo_jv = request.getParameter("equi_vi");       			   
	  } catch (Exception e) { }*/
	  
	  /*String integrantes_jv="";
 	  try {
       		integrantes_jv = request.getParameter("integran_vi");       			   
	  } catch (Exception e) { }*/

 	  try {
       		fol2_jv = request.getParameter("fol_vi");       			   
	  } catch (Exception e) { }
	  
	  String folgnk_vi_jv="";
 	  try {
       		folgnk_vi_jv = request.getParameter("fol_gnk_vi");       			   
	  } catch (Exception e) { }

	  
String provee_jv="";
 	  try {
       		provee_jv = request.getParameter("prove_vi");       			   
	  } catch (Exception e) { }
	  
	  String recibe_jv="";
 	  try {
       		recibe_jv = request.getParameter("recib_vi");       			   
	  } catch (Exception e) { }
	  
	  String entrega_jv="";
 	  try {
       		entrega_jv = request.getParameter("entreg_vi");       			   
	  } catch (Exception e) { }
	  
	  String capturar_jv="";
 	  try {
       		capturar_jv = request.getParameter("captu_vi");       			   
	  } catch (Exception e) { }
	  
	  String ubic_jv="";
 	  try {
       		ubic_jv = request.getParameter("ubic_vi");       			   
	  } catch (Exception e) { }
	  
	  String origen_jv="";
 	  try {
       		origen_jv = request.getParameter("orig_vi");       			   
	  } catch (Exception e) { }
	  
	  String obser_jv="";
 	  try {
       		obser_jv = request.getParameter("obser_vi");       			   
	  } catch (Exception e) { }
	  
	  String boolDocRem_jv="";
 	  try {
       		boolDocRem_jv = request.getParameter("boolDocRem_vi");       			   
	  } catch (Exception e) { }
	 
 
cuantos_jv=request.getParameter("txtf_cant");

rset1 = stmt1.executeQuery("SELECT STR_TO_DATE('"+date+"', '%d/%m/%Y')"); 
                    while(rset1.next()){
                    date= rset1.getString("STR_TO_DATE('"+date+"', '%d/%m/%Y')");
					}
     /*Connection conn_001 = DriverManager.getConnection("jdbc:mysql://localhost/dgo");
        Statement stmt_001 = conn_001.createStatement();
        ResultSet rset_001=stmt_001.executeQuery("SELECT * FROM datos_far order by (clave+0)");
          while (rset_001.next()) 
                  { 
                    clagto_jv=rset_001.getString("clave");  
				    unigto_jv=rset_001.getString("unidad");	
					enc_jv=rset_001.getString("encar1");   
					juris2_jv=rset_001.getString("juris");
                    
                   }
*/

     int tam=0,tam2=0,x1=0;
     String cad1[]=new String[10000];  //array for show clients 
     String arr[]= new String[5000];     //array for the 
	 String lotes[]= new String[5000];
	 String lotes2[]= new String[5000];
	 String lotes3[]= new String[5000];
	 String exis[]= new String[5000];
	 
	 String cie[]= new String[5000];
	 
	 String cad[]= new String[5000];
	 String cad2[]= new String[5000];
	 String cad3[]= new String[5000];
	 
	 lotes[0]="";
	 lotes2[0]="";
	 cad[0]="";
	 cad2[0]="";
     String name="";
     String service_jv="";
	 int pos=0;
	 int pos2=0;
	 int pos3=0;
	 int cont2=0;
	 int cont3=0;
     String mail[]=new String[10];
	 String meses[]=new String[12];
	 meses[0]="Enero";
	 meses[1]="Febrero";
	 meses[2]="Marzo";
	 meses[3]="Abril";
	 meses[4]="Marzo";
	 meses[5]="Abril";
	 meses[6]="Mayo";
	 meses[7]="Junio";
	 meses[8]="Julio";
	 meses[9]="Agosto";
	 meses[10]="Septiembre";
	 meses[11]="Octubre";
	 meses[0]="Noviembre";
	 meses[1]="Diciembre";
	 
     int altaOK=0;
     int altaOKAY=0;	 
     String but="r";
	 String clave="";

     String juris_jv="";
	 //String juris2_jv="";
     String cs_jv="";
	 String lotes2_jv="";
	 
	 String check=request.getParameter("txtf_5");
	 int c=0;
	 int tam_3=0;
	 mail[0]="lasalle_tur@yahoo.com";
     String val="h";
	 String user="h";
	 //variables para mostrar en campos
	    String clave_jv= "";
		String descrip_jv= "";
		String desc_jv=  "";
	    String lote_jv= "";
		String cadu_jv= "";
		String exis_jv= "";
		String costo_jv= "";
int cont=1;
       
	//out.print(""+var_des);	
	 
//Rutina para obtener las claves 
	    /*Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost/dgo");
        Statement stmt1 = conn1.createStatement();
        ResultSet rset1=stmt1.executeQuery("SELECT distinct clave FROM claves_alm order by clave+0 asc");
          while (rset1.next()) 
                  { 
                    
                    cad1[tam2]=rset1.getString("clave");     
                     tam2++;
                   }

	 */
	 
	 

try{
        altaOK=Integer.parseInt(request.getParameter("altaok"));   
       }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
	   
   try { 
        but=""+request.getParameter("Submit");
        //altaOK="no";
    }catch(Exception e){System.out.print("not");}
	tam2=0;
	//if( !(but.equals("Filtrar Nombres")) )
	  // {	
        /*rset1=stmt1.executeQuery("select distinct(descri) from ise_sic group by descri;");
          while (rset1.next()) 
                  { 
                    
                    cad1_des[tam2]=rset1.getString("descri");     
                     tam2++;
                   }*/
       //}
	   
	    
	   
	if(but.equals("Filtrar Nombres"))
      {
	      var_des=request.getParameter("txtf_descri");
          query_var=var_des+"%";
		  out.print("si"+query_var);
		     rset1 = stmt1.executeQuery("SELECT descri FROM ise_sic WHERE descri LIKE '"+query_var+"' group by descri;");
		   tam2=0;
		   while (rset1.next()) 
                  { 
                    
                    cad1_des[tam2]=rset1.getString("descri");     
                     tam2++;
                   }//fin del while 
 

	      
			}//fin del if 

	

	if(but.equals("Mostrar"))
	 {
	   //ban=0;    
        des_jv= request.getParameter("txtf_descri");
		//out.print("entro"+des_jv);
	    rset1 = stmt1.executeQuery("SELECT * FROM ise_sic WHERE cb_ean='"+des_jv+"';");
		     while (rset1.next()) 
                  { 
				    //ban=1;
                    part_jv=rset1.getString("partida");
					clave_jv=rset1.getString("siccal");
					descrip_jv=rset1.getString("descri");
					//codeb_jv=rset1.getString("cb");
					um_jv=rset1.getString("um");
                    marca_jv=rset1.getString("marca");
                   }//fin del while 
	             //if(ban==0)
			 		//{
			 		//response.sendRedirect("reg_nueva_isemy2.jsp");
		//	 }
	//	clave_jv  descrip_jv
		
      }
	
	
 
 	if(but.equals("Capturar"))
     {
	  clave_jv   = request.getParameter("txtf_2");
	  descrip_jv = request.getParameter("txtf_descrip");
	  cbean_jv   = request.getParameter("txtf_cbean");
	  /*lote2_jv   = request.getParameter("txtf_lote");
	  cad2_jv    = request.getParameter("txtf_caduc");
	  cajas_jv   = request.getParameter("txtf_exi");
      npzas_jv   = request.getParameter("txtf_pza");
      resto_jv   = request.getParameter("txtf_rto");
      exist_jv   = request.getParameter("txtf_exist"); 
	  */
	  stmt1.execute("insert into datos_sic values ('"+clave_jv+"','"+descrip_jv+"','"+cbean_jv+"','-','-','-','-','-','-')");
	  
	  %>
<script>
alert('"CAPTURA EXITOSA", CAPTURE EL SIGUIENTE SICCAL, GRACIAS MIL');
</script>
<%
      clave_jv   = "";
	  descrip_jv = "";
	  cbean_jv   = "";
	  lote2_jv   = "";
	  cad2_jv    = "";
	  cajas_jv   = "";
      npzas_jv   = "";
      resto_jv   = "";
      exist_jv   = "";

     }    
%>
<%


	
 


if(but.equals("Guardar"))
		{
			correct1=5;
			Connection conn = 
                  DriverManager.getConnection("jdbc:mysql://localhost/dgo");
                  Statement stmt = conn.createStatement();
			
		  txtf_1_jv=request.getParameter("txtf_1");
		  clave_jv=request.getParameter("txtf_2");
	  	  descrip_jv=request.getParameter("txtf_descrip");
	  	  cbean_jv=request.getParameter("txtf_cbean");
          loten_jv=request.getParameter("txtf_loten");
		  cadudia_jv=request.getParameter("txtf_t1");
		  hora_ini_jv=request.getParameter("txtf_hft");
		  equipo_jv=request.getParameter("txtf_Equ");
		  integrantes_jv=request.getParameter("txtf_intre");
		  hora_ini_jv=request.getParameter("txtf_hft");
		  date_jv=request.getParameter("txtf_date");
		  origen_jv=request.getParameter("txtf_origen");
			  //out.print(cadudia_jv.length());
			  if( (cadudia_jv.length())==1 )
			      cadudia_jv="0"+cadudia_jv;
			cadumes_jv=request.getParameter("txtf_t2");
			  if( (cadumes_jv.length())==1 )
			      cadumes_jv="0"+cadumes_jv;
			caduano_jv=request.getParameter("txtf_t3");
			      //if( (cadumes_jv.length())==1 )
			cadun_jv=cadudia_jv+"/"+cadumes_jv+"/"+caduano_jv;
		  
		  //cadun_jv=request.getParameter("txtf_cadun");
		  //cantn_jv=request.getParameter("txtf_cantn");
		  exist_jv=request.getParameter("txtf_exist");
		  ubin_jv=request.getParameter("txtf_ubin");
		  exi_jv=request.getParameter("txtf_exi");
		  pzas_jv=request.getParameter("txtf_pza");
		  resto_jv=request.getParameter("txtf_rto");
		  marca_jv=request.getParameter("txtf_marca");
		  um_jv=request.getParameter("txtf_um");
		  coincidir_jv=request.getParameter("slct_coincidir");
		  coincidir2_jv=request.getParameter("slct_coincidir2");
		 // rset1 = stmt1.executeQuery("SELECT * FROM cb2 WHERE cb='"+des_jv+"';");
		  out.print("hi");
		 // stmt1.execute("insert into datos_inv_cod_isse values ('"+loten_jv+"','"+descrip_jv+"''"+cadun_jv +"''"+ubin_jv +"''"+cantn_jv +"','-','-','-','-','-')");
		 if(!(clave_jv.equals(""))  && !(ubin_jv.equals("")) && !(cadun_jv.equals(""))&& !(loten_jv.equals("")) && !(descrip_jv.equals("")) ) {
			 
			 stmt.execute("insert into agregar_dgo values ('"+usu_jv+"','"+correct1+"','"+date+"','"+clave_jv+"','"+descrip_jv+"','"+loten_jv+"','"+cadun_jv+"','"+ubin_jv+"','"+exi_jv+"','"+pzas_jv+"','"+resto_jv+"','"+exist_jv+"',0)");   
			 
			 
		 stmt1.execute("insert into datos_inv_cod values('"+cbean_jv+"','"+clave_jv+"','"+loten_jv+"','"+descrip_jv+"','"+cadun_jv+"','"+ubin_jv+"','"+exist_jv+"','"+equipo_jv+"','"+integrantes_jv+"','"+date_jv+"','BODEGA',0,'"+exi_jv+"','"+pzas_jv+"','"+resto_jv+"','"+marca_jv+"','"+um_jv+"','"+origen_jv+"','-','-')");
		
%>
<script>
alert('"CAPTURA EXITOSA", Dar click en el boton ACEPTAR para seguir CAPTURANDO');
</script>
<%
exi_jv="0";
pzas_jv="0";
resto_jv="0";
exist_jv="0";
marca_jv="";
um_jv="";

}else{
%>
<script>
alert("ERROR DE CAPTURA, falta llenar un campo, INTÉNTALO DE NUEVO")
txtf_descri.focus();
</script>
<%
}


	
	//stmt.execute("update cla_lotes set exis='"+exi_jv+"' where clave='"+clave_jv+"' and lote='"+lote2_jv+"'");
	 
	
	
	 //response.sendRedirect("exito_capRec.jsp");
	cb_jv="";
 clave_jv="";
 lote2_jv="";
 descrip_jv="";
 cadu_jv="";
 exi_jv="0";
 ubin_jv="";
 
        %>
<script> 
		txtf_2.focus();
</script>
<%       
     }    
%>

<%! public int customerIds=0;
  public int regulaCont2()
      {
                      
             try { 
                           
                  Connection conn_01 = 
                  DriverManager.getConnection("jdbc:mysql://localhost/dgo");
                  Statement stmt_01 = conn_01.createStatement();
                
                  //stmt_01.execute("insert into rec values(null,'morelia')");
                  //stmt_01.execute("commit"); 
                  ResultSet rset_01 = stmt_01.executeQuery("select no_rec from folio_rec");
                  while(rset_01.next())
                       customerIds = rset_01.getInt("no_rec");
                conn_01.close();
                 System.out.print("halo");           
                } catch (Exception e)
                     {  
                       System.out.print("haloja");  
                     }
             
  return customerIds;
     }   
%>

<%

%>

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>:: C&Oacute;DIGO DE BARRAS ISSEMyM::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="mm_travel2.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
//--------------- LOCALIZEABLE GLOBALS ---------------
var d=new Date();
var monthname=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
//Ensure correct for language. English is "January 1, 2004"
var TODAY = monthname[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();
//---------------   END LOCALIZEABLE   ---------------
</script>
<script language="JavaScript" src="list02.js" type="text/javascript"></script>
<style type="text/css">
<!--
.style6 {
	font-size: 12px;
	color: #000033;
}
.style7 {color: #003300}
.style8 {color: #ffffff}
.style10 {color: #333333}
.style13 {
	color: #990000;
	font-weight: bold;
	font-size: 11px;
}
.style14 {color: #000000}
.style15 {line-height:16px; letter-spacing:.2em; font: bold 10px Verdana, Arial, Helvetica, sans-serif;}
.style16 {font-size: 12px; color: #000033; font-weight: bold; }
-->
</style>
</head>
<body bgcolor="#FFFFFF" onload="setcurCB()">
<script src="scw.js" type="text/javascript"> </script>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr bgcolor="#3366CC">
    <td colspan="3" rowspan="3" bgcolor="ffffff"><div align="center"></div></td>
    <td height="63" colspan="3" align="center" valign="bottom" nowrap="nowrap" bgcolor="ffffff" id="logo"><img src="imagenes/logo_conjun.jpg" /></td>
    <td bgcolor="ffffff">&nbsp;</td>
  </tr>
  <tr bgcolor="#3366CC">
    <td height="33" colspan="3" align="center" valign="bottom" nowrap="nowrap" background="imagenes/fondo.jpg" id="logo"><div align="center">Agregar Clave al Inventario|<span class="style7">&nbsp;</span><span class="smallText style8">GNKL Software </span></div></td>
    <td width="40" bgcolor="ffffff">&nbsp;</td>
  </tr>

  <tr bgcolor="#3366CC">  </tr>

  <tr>
    <td colspan="7" bgcolor="#003366"></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<td height="25" colspan="7" bgcolor="#ffffff" id="dateformat">&nbsp;&nbsp;<script language="JavaScript" type="text/javascript">
      //document.write(TODAY);	</script>
    <a href="equipo_alm_dgo.jsp">Realizar otra toma de INVENTARIO</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ubi_dgo.jsp">Regresar a programa de UBICACIONES</a>&nbsp;&nbsp;&nbsp;<a href="equipo_alm_dgo_farm.jsp?usuario=<%=usu_jv%>">Inventario Código de Barra ORIGEN(FARMACIA)</a></td>
  </tr>
 <tr>
    <td colspan="7" bgcolor="#003366"></td>
  </tr>

 <tr>
    <td width="77" valign="top" bgcolor="#ffffff">
	
 	 <br />
  	&nbsp;<br />
  	&nbsp;<br />
  	&nbsp;<br /> 	</td>
    <td>&nbsp;</td>
    <td colspan="2" valign="top"><form action="consulta2_inv2.jsp?hora_ini_vi=<%=hora_ini_jv%>&amp;equi_vi=<%=equipo_jv%>&amp;integran_vi=<%=integrantes_jv%>&amp;lugar_vi=<%=lugar_jv%>&amp;nombre=<%=user1%>" method="post" name="form" id="form" onsubmit="javascript:return ValidateAbas(this)">
<table width="940" height="43" border="2" bordercolor="#003300">
       <tr>
          <td scope="col"><span class="bodyText">Hora inicio &nbsp;:
              <label> </label>
              <label>
              <input type="text" name="txtf_hft" id="txtf_hft" size="10" readonly="true" value="<%=hora_ini_jv%>"/>
              <input type="hidden" name="txtf_lugar" id="txtf_lugar" size="10" readonly="true" value="<%=lugar_jv%>"/>
              </label>
No de Equipo :
<input type="text" name="txtf_Equ" value="<%=equipo_jv%>"/>
Integrantes&nbsp;:
<input name="txtf_intre" type="text" size="50" value="<%=integrantes_jv%>" onkeypress="return handleEnter(this, event)"/>
&nbsp; </span>
            
            <p class="bodyText">
              <!--onSubmit="javascript:return ValidateFormCant(this)"-->
              FECHA :
              <input name="txtf_date" type="text" size="10" value="<%= month %>/<%= day %>/<%= year %>" onkeypress="return handleEnter(this, event)" readonly="true"/>
  <!--  HORA DE INICIO:
      <input name="txtf_spss" type="text" size="10" value="<%//=hora_ini_jv%>" onkeypress="return handleEnter(this, event)" onChange="toUppercaseF1();" readonly="true"/>-->
              HORA FINAL:
  <input name="txtf_hf" id="txtf_hf" type="text" size="10" value="" onkeypress="return handleEnter(this, event)" onchange="toUppercaseF3();" readonly="true"/>
            USUARIO:<input name="txtf_USU" id="txtf_USU" type="text" size="10" onkeypress="return handleEnter(this, event)" onchange="toUppercaseF3();" readonly="true" value="<%=usu_jv%>"/></p>
            </p></td>
        </tr>
      <tr>
        <th width="792" scope="col"><p align="left" class="style6 style10">LEA EL C&Oacute;DIGO DE BARRAS  </p>
          <div align="left">
            <table width="787" border="0">
                <tr>
                  <td width="146"><span class="style10">CLAVE:</span></td>
                  <td width="610"><input name="txtf_descri" type="text" size="40" onfocus="<%but="Mostrar";%>"/>
                    <span class="style10">
                    <input type="submit" name="Submit" value="Mostrar" />
                    </span></td>
                  <td width="17">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2"><label></label></td>
                  <td>&nbsp;</td>
                </tr>
                </table>
          </div>        </th>
      </tr>
    </table>
     
    <table width="804" height="297" border="2" bordercolor="#003300">
      <tr>
        <th width="792" scope="col"><p align="left" class="style6 style10">INGRESE LOS DATOS</p>
          <div align="left">
            <table width="787" border="0">
                <tr>
                  <td height="21"><span class="style10">PARTIDA:</span></td>
                  <td colspan="2"><input name="txtf_1" type="text" class="style13" onchange="toUppercaseCve();"  value="<%=part_jv%>" size="30" /></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="91" height="21"><span class="style10">CLAVE:</span></td>
                  <td colspan="2"><span class="style10">
                    <input name="txtf_2" type="text" class="style13" onchange="toUppercaseCve();"  value="<%=clave_jv%>" size="30" />
                    <label></label>
                  </span></td>
                  <td width="16">&nbsp;</td>
                </tr>
                <tr>
                  <td><span class="style10">DESCRIPCI&Oacute;N:</span></td>
                  <td colspan="2"><textarea name="txtf_descrip" cols="114" class="style13" onkeypress="return handleEnter(this, event)"><%=descrip_jv%></textarea></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><span class="style10">MARCA: </span></td>
                  <td><input name="txtf_marca" type="text" onkeypress="return handleEnter(this, event)" value="<%=marca_jv%>" size="50" />
                    <span class="style10">
                    <label></label>
                    </span></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><span class="style10">PRESENTACI&Oacute;N:</span></td>
                  <td><input name="txtf_um" type="text" onkeypress="return handleEnter(this, event)" value="<%=um_jv%>" size="30" />
                  <span class="style10"><label></label>
                  </span></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><span class="style10">C&Oacute;DIGO DE BARRAS: </span></td>
                  <td><input name="txtf_cbean" type="text" onkeypress="return handleEnter(this, event)" value="<%=codeb_jv%>" size="30" /></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">LOTE:</span></td>
                  <td><label>
                    <input name="txtf_loten" type="text" id="txtf_loten" size="30" onchange="toUppercaseLoten();" onkeypress="return handleEnter(this, event)"/>
                  </label></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">CADUCIDAD:</span></td>
                  <td><span class="style10">
                    <input name="txtf_t1" type="text" onkeypress="return handleEnter(this, event)" onkeyup="putDays()" value="<%//=lada_jv%>" size="1" maxlength="2"/>
			        <strong>                    /</strong>
                    <input name="txtf_t2" type="text" size="1" maxlength="2" onkeyup="putMonthss()" value="<%//=t1_jv%>" onkeypress="return handleEnter(this, event)"/>
                    <strong>                    /</strong>
                    <input name="txtf_t3" type="text" size="2" maxlength="4" onkeyup="putYearss(this.form)" value="<%//=t2_jv%>" onkeypress="return handleEnter(this, event)"/>
                    <br />
                    DD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AAAA</span></td>
					
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">ORIGEN:</span></td>
                  <td><input name="txtf_origen" type="text" id="txtf_origen" size="10" onkeypress="return handleEnter(this, event)" onchange="toUppercaseUbic1();" />&nbsp;<select name="slc_origen" class="bodyText" onchange="setOrigen(this.form);">
                      <option>-- Origen --</option>
                      <option value="SORIANA">SORIANA</option>
                      <option value="SSD">SSD</option>
                      
                    </select></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">UBICACI&Oacute;N:</span></td>
                  <td><input name="txtf_ubin" type="text" id="txtf_ubin" size="20" onkeypress="return handleEnter(this, event)" onchange="toUppercaseUbic1();" readonly="true"/>
                    <select name="slc_LetterUbic" class="bodyText" onchange="setLetterUbic1(this.form);">
                      <option>-- Ubicación --</option>
                      <option value="AREA DE SURTIDO">AREA DE SURTIDO </option>
				  <option value="PISO NORTE">PISO NORTE </option>
				  <option value="PISO NORTE 2">PISO NORTE 2</option>
				  <option value="PISO NORTE 3">PISO NORTE 3</option>
				  <option value="CONTROLADOS">CONTROLADOS</option>
				  <option value="RED FRIA">RED FRÍA</option>
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
				  <option value="C-41-I">C-41-I </option>
                  <option value="C-41-D">C-41-D </option>
                  <option value="C-42-I">C-42-I </option>
                  <option value="C-42-D">C-42-D </option>
                  <option value="C-43-I">C-43-I </option>
                  <option value="C-43-D">C-43-D </option>
                  <option value="C-44-I">C-44-I </option>
                  <option value="C-44-D">C-44-D </option>
                  <option value="C-45-I">C-45-I </option>
                  <option value="C-45-D">C-45-D </option>
                  <option value="C-46-I">C-46-I </option>
                  <option value="C-46-D">C-46-D </option>
                  <option value="C-47-I">C-47-I </option>
                  <option value="C-47-D">C-47-D </option>
                  <option value="C-48-I">C-48-I </option>
                  <option value="C-48-D">C-48-D </option>
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
                  <option value="D-41-I">D-41-I </option>
                  <option value="D-41-D">D-41-D </option>
                  <option value="D-42-I">D-42-I </option>
                  <option value="D-42-D">D-42-D </option>
                  <option value="D-43-I">D-43-I </option>
                  <option value="D-43-D">D-43-D </option>
                  <option value="D-44-I">D-44-I </option>
                  <option value="D-44-D">D-44-D </option>
                  <option value="D-45-I">D-45-I </option>
                  <option value="D-45-D">D-45-D </option>
                  <option value="D-46-I">D-46-I </option>
                  <option value="D-46-D">D-46-D </option>
                  <option value="D-47-I">D-47-I </option>
                  <option value="D-47-D">D-47-D </option>
                  <option value="D-48-I">D-48-I </option>
                  <option value="D-48-D">D-48-D </option>

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
				  <option value="E-39-I">E-39-I </option>
                  <option value="E-39-D">E-39-D </option>
<option value="E-40-I">E-40-I </option>
                  <option value="E-40-D">E-40-D </option>
                  <option value="E-41-I">E-41-I </option>
                  <option value="E-41-D">E-41-D </option>
                  <option value="E-42-I">E-42-I </option>
                  <option value="E-42-D">E-42-D </option>
                  <option value="E-43-I">E-43-I </option>
                  <option value="E-43-D">E-43-D </option>
                  <option value="E-44-I">E-44-I </option>
                  <option value="E-44-D">E-44-D </option>
                  <option value="E-45-I">E-45-I </option>
                  <option value="E-45-D">E-45-D </option>
                  <option value="E-46-I">E-46-I </option>
                  <option value="E-46-D">E-46-D </option>
                  <option value="E-47-I">E-47-I </option>
                  <option value="E-47-D">E-47-D </option>
                  <option value="E-48-I">E-48-I </option>
                  <option value="E-48-D">E-48-D </option>

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
				  <option value="F-39-I">F-39-I </option>
                  <option value="F-39-D">F-39-D </option>
<option value="F-40-I">F-40-I </option>
                  <option value="F-40-D">F-40-D </option>
                  <option value="F-41-I">F-41-I </option>
                  <option value="F-41-D">F-41-D </option>
                  <option value="F-42-I">F-42-I </option>
                  <option value="F-42-D">F-42-D </option>
                  <option value="F-43-I">F-43-I </option>
                  <option value="F-43-D">F-43-D </option>
                  <option value="F-44-I">F-44-I </option>
                  <option value="F-44-D">F-44-D </option>
                  <option value="F-45-I">F-45-I </option>
                  <option value="F-45-D">F-45-D </option>
                  <option value="F-46-I">F-46-I </option>
                  <option value="F-46-D">F-46-D </option>
                  <option value="F-47-I">F-47-I </option>
                  <option value="F-47-D">F-47-D </option>
                  <option value="F-48-I">F-48-I </option>
                  <option value="F-48-D">F-48-D </option>

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
				  <option value="G-39-I">G-39-I </option>
                  <option value="G-39-D">G-39-D </option>
<option value="G-40-I">G-40-I </option>
                  <option value="G-40-D">G-40-D </option>
                  <option value="G-41-I">G-41-I </option>
                  <option value="G-41-D">G-41-D </option>
                  <option value="G-42-I">G-42-I </option>
                  <option value="G-42-D">G-42-D </option>
                  <option value="G-43-I">G-43-I </option>
                  <option value="G-43-D">G-43-D </option>
                  <option value="G-44-I">G-44-I </option>
                  <option value="G-44-D">G-44-D </option>
                  <option value="G-45-I">G-45-I </option>
                  <option value="G-45-D">G-45-D </option>
                  <option value="G-46-I">G-46-I </option>
                  <option value="G-46-D">G-46-D </option>
                  <option value="G-47-I">G-47-I </option>
                  <option value="G-47-D">G-47-D </option>
                  <option value="G-48-I">G-48-I </option>
                  <option value="G-48-D">G-48-D </option>

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
				  <option value="H-39-I">H-39-I </option>
                  <option value="H-39-D">H-39-D </option>
<option value="H-40-I">H-40-I </option>
                  <option value="H-40-D">H-40-D </option>
                  <option value="H-41-I">H-41-I </option>
                  <option value="H-41-D">H-41-D </option>
                  <option value="H-42-I">H-42-I </option>
                  <option value="H-42-D">H-42-D </option>
                  <option value="H-43-I">H-43-I </option>
                  <option value="H-43-D">H-43-D </option>
                  <option value="H-44-I">H-44-I </option>
                  <option value="H-44-D">H-44-D </option>
                  <option value="H-45-I">H-45-I </option>
                  <option value="H-45-D">H-45-D </option>
                  <option value="H-46-I">H-46-I </option>
                  <option value="H-46-D">H-46-D </option>
                  <option value="H-47-I">H-47-I </option>
                  <option value="H-47-D">H-47-D </option>
                  <option value="H-48-I">H-48-I </option>
                  <option value="H-48-D">H-48-D </option>

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
				<option value="Q-1-I">Q-1-I</option>
				<option value="Q-1-D">Q-1-D</option>
				<option value="Q-2-I">Q-2-I</option>
				<option value="Q-2-D">Q-2-D</option>
				<option value="Q-3-I">Q-3-I</option>
				<option value="Q-3-D">Q-3-D</option>
				<option value="Q-4-I">Q-4-I</option>
				<option value="Q-4-D">Q-4-D</option>
				<option value="Q-5-I">Q-5-I</option>
				<option value="Q-5-D">Q-5-D</option>
				<option value="Q-6-I">Q-6-I</option>
				<option value="Q-6-D">Q-6-D</option>
				<option value="Q-7-I">Q-7-I</option>
				<option value="Q-7-D">Q-7-D</option>
				<option value="Q-8-I">Q-8-I</option>
				<option value="Q-8-D">Q-8-D</option>
				<option value="Q-9-I">Q-9-I</option>
				<option value="Q-9-D">Q-9-D</option>
				<option value="Q-10-I">Q-10-I</option>
				<option value="Q-10-D">Q-10-D</option>
				<option value="Q-11-I">Q-11-I</option>
				<option value="Q-11-D">Q-11-D</option>
				<option value="Q-12-I">Q-12-I</option>
				<option value="Q-12-D">Q-12-D</option>
				<option value="Q-13-I">Q-13-I</option>
				<option value="Q-13-D">Q-13-D</option>
				<option value="Q-14-I">Q-14-I</option>
				<option value="Q-14-D">Q-14-D</option>
				<option value="Q-15-I">Q-15-I</option>
				<option value="Q-15-D">Q-15-D</option>
				<option value="Q-16-I">Q-16-I</option>
				<option value="Q-16-D">Q-16-D</option>
				<option value="Q-17-I">Q-17-I</option>
				<option value="Q-17-D">Q-17-D</option>
				<option value="Q-18-I">Q-18-I</option>
				<option value="Q-18-D">Q-18-D</option>
				<option value="Q-19-I">Q-19-I</option>
				<option value="Q-19-D">Q-19-D</option>
				<option value="Q-20-I">Q-20-I</option>
				<option value="Q-20-D">Q-20-D</option>
				<option value="Q-21-I">Q-21-I</option>
				<option value="Q-21-D">Q-21-D</option>
				<option value="Q-22-I">Q-22-I</option>
				<option value="Q-22-D">Q-22-D</option>
				<option value="Q-23-I">Q-23-I</option>
				<option value="Q-23-D">Q-23-D</option>
				<option value="Q-24-I">Q-24-I</option>
				<option value="Q-24-D">Q-24-D</option>
				<option value="Q-25-I">Q-25-I</option>
				<option value="Q-25-D">Q-25-D</option>
				<option value="Q-26-I">Q-26-I</option>
				<option value="Q-26-D">Q-26-D</option>
				<option value="Q-27-I">Q-27-I</option>
				<option value="Q-27-D">Q-27-D</option>
				<option value="Q-28-I">Q-28-I</option>
				<option value="Q-28-D">Q-28-D</option>
				<option value="Q-29-I">Q-29-I</option>
				<option value="Q-29-D">Q-29-D</option>
				<option value="Q-30-I">Q-30-I</option>
				<option value="Q-30-D">Q-30-D</option>
				<option value="Q-31-I">Q-31-I</option>
				<option value="Q-31-D">Q-31-D</option>
				<option value="Q-32-I">Q-32-I</option>
				<option value="Q-32-D">Q-32-D</option>
				<option value="Q-33-I">Q-33-I</option>
				<option value="Q-33-D">Q-33-D</option>
				<option value="Q-34-I">Q-34-I</option>
				<option value="Q-34-D">Q-34-D</option>
				<option value="Q-35-I">Q-35-I</option>
				<option value="Q-35-D">Q-35-D</option>
				<option value="Q-36-I">Q-36-I</option>
				<option value="Q-36-D">Q-36-D</option>
				<option value="Q-37-I">Q-37-I</option>
				<option value="Q-37-D">Q-37-D</option>
				<option value="Q-38-I">Q-38-I</option>
				<option value="Q-38-D">Q-38-D</option>
				<option value="Q-39-I">Q-39-I</option>
				<option value="Q-39-D">Q-39-D</option>
				<option value="Q-40-I">Q-40-I</option>
				<option value="Q-40-D">Q-40-D</option>
				<option value="R-1-I">R-1-I</option>
				<option value="R-1-D">R-1-D</option>
				<option value="R-2-I">R-2-I</option>
				<option value="R-2-D">R-2-D</option>
				<option value="R-3-I">R-3-I</option>
				<option value="R-3-D">R-3-D</option>
				<option value="R-4-I">R-4-I</option>
				<option value="R-4-D">R-4-D</option>
				<option value="R-5-I">R-5-I</option>
				<option value="R-5-D">R-5-D</option>
				<option value="R-6-I">R-6-I</option>
				<option value="R-6-D">R-6-D</option>
				<option value="R-7-I">R-7-I</option>
				<option value="R-7-D">R-7-D</option>
				<option value="R-8-I">R-8-I</option>
				<option value="R-8-D">R-8-D</option>
				<option value="R-9-I">R-9-I</option>
				<option value="R-9-D">R-9-D</option>
				<option value="R-10-I">R-10-I</option>
				<option value="R-10-D">R-10-D</option>
				<option value="R-11-I">R-11-I</option>
				<option value="R-11-D">R-11-D</option>
				<option value="R-12-I">R-12-I</option>
				<option value="R-12-D">R-12-D</option>
				<option value="R-13-I">R-13-I</option>
				<option value="R-13-D">R-13-D</option>
				<option value="R-14-I">R-14-I</option>
				<option value="R-14-D">R-14-D</option>
				<option value="R-15-I">R-15-I</option>
				<option value="R-15-D">R-15-D</option>
				<option value="R-16-I">R-16-I</option>
				<option value="R-16-D">R-16-D</option>
				<option value="R-17-I">R-17-I</option>
				<option value="R-17-D">R-17-D</option>
				<option value="R-18-I">R-18-I</option>
				<option value="R-18-D">R-18-D</option>
				<option value="R-19-I">R-19-I</option>
				<option value="R-19-D">R-19-D</option>
				<option value="R-20-I">R-20-I</option>
				<option value="R-20-D">R-20-D</option>
				<option value="R-21-I">R-21-I</option>
				<option value="R-21-D">R-21-D</option>
				<option value="R-22-I">R-22-I</option>
				<option value="R-22-D">R-22-D</option>
				<option value="R-23-I">R-23-I</option>
				<option value="R-23-D">R-23-D</option>
				<option value="R-24-I">R-24-I</option>
				<option value="R-24-D">R-24-D</option>
				<option value="R-25-I">R-25-I</option>
				<option value="R-25-D">R-25-D</option>
				<option value="R-26-I">R-26-I</option>
				<option value="R-26-D">R-26-D</option>
				<option value="R-27-I">R-27-I</option>
				<option value="R-27-D">R-27-D</option>
				<option value="R-28-I">R-28-I</option>
				<option value="R-28-D">R-28-D</option>
				<option value="R-29-I">R-29-I</option>
				<option value="R-29-D">R-29-D</option>
				<option value="R-30-I">R-30-I</option>
				<option value="R-30-D">R-30-D</option>
				<option value="R-31-I">R-31-I</option>
				<option value="R-31-D">R-31-D</option>
				<option value="R-32-I">R-32-I</option>
				<option value="R-32-D">R-32-D</option>
				<option value="R-33-I">R-33-I</option>
				<option value="R-33-D">R-33-D</option>
				<option value="R-34-I">R-34-I</option>
				<option value="R-34-D">R-34-D</option>
				<option value="R-35-I">R-35-I</option>
				<option value="R-35-D">R-35-D</option>
				<option value="R-36-I">R-36-I</option>
				<option value="R-36-D">R-36-D</option>
				<option value="R-37-I">R-37-I</option>
				<option value="R-37-D">R-37-D</option>
				<option value="R-38-I">R-38-I</option>
				<option value="R-38-D">R-38-D</option>
				<option value="R-39-I">R-39-I</option>
				<option value="R-39-D">R-39-D</option>
				<option value="R-40-I">R-40-I</option>
				<option value="R-40-D">R-40-D</option>
				<option value="S-1-I">S-1-I</option>
				<option value="S-1-D">S-1-D</option>
				<option value="S-2-I">S-2-I</option>
				<option value="S-2-D">S-2-D</option>
				<option value="S-3-I">S-3-I</option>
				<option value="S-3-D">S-3-D</option>
				<option value="S-4-I">S-4-I</option>
				<option value="S-4-D">S-4-D</option>
				<option value="S-5-I">S-5-I</option>
				<option value="S-5-D">S-5-D</option>
				<option value="S-6-I">S-6-I</option>
				<option value="S-6-D">S-6-D</option>
				<option value="S-7-I">S-7-I</option>
				<option value="S-7-D">S-7-D</option>
				<option value="S-8-I">S-8-I</option>
				<option value="S-8-D">S-8-D</option>
				<option value="S-9-I">S-9-I</option>
				<option value="S-9-D">S-9-D</option>
				<option value="S-10-I">S-10-I</option>
				<option value="S-10-D">S-10-D</option>
				<option value="S-11-I">S-11-I</option>
				<option value="S-11-D">S-11-D</option>
				<option value="S-12-I">S-12-I</option>
				<option value="S-12-D">S-12-D</option>
				<option value="S-13-I">S-13-I</option>
				<option value="S-13-D">S-13-D</option>
				<option value="S-14-I">S-14-I</option>
				<option value="S-14-D">S-14-D</option>
				<option value="S-15-I">S-15-I</option>
				<option value="S-15-D">S-15-D</option>
				<option value="S-16-I">S-16-I</option>
				<option value="S-16-D">S-16-D</option>
				<option value="S-17-I">S-17-I</option>
				<option value="S-17-D">S-17-D</option>
				<option value="S-18-I">S-18-I</option>
				<option value="S-18-D">S-18-D</option>
				<option value="S-19-I">S-19-I</option>
				<option value="S-19-D">S-19-D</option>
				<option value="S-20-I">S-20-I</option>
				<option value="S-20-D">S-20-D</option>
				<option value="S-21-I">S-21-I</option>
				<option value="S-21-D">S-21-D</option>
				<option value="S-22-I">S-22-I</option>
				<option value="S-22-D">S-22-D</option>
				<option value="S-23-I">S-23-I</option>
				<option value="S-23-D">S-23-D</option>
				<option value="S-24-I">S-24-I</option>
				<option value="S-24-D">S-24-D</option>
				<option value="S-25-I">S-25-I</option>
				<option value="S-25-D">S-25-D</option>
				<option value="S-26-I">S-26-I</option>
				<option value="S-26-D">S-26-D</option>
				<option value="S-27-I">S-27-I</option>
				<option value="S-27-D">S-27-D</option>
				<option value="S-28-I">S-28-I</option>
				<option value="S-28-D">S-28-D</option>
				<option value="S-29-I">S-29-I</option>
				<option value="S-29-D">S-29-D</option>
				<option value="S-30-I">S-30-I</option>
				<option value="S-30-D">S-30-D</option>
				<option value="S-31-I">S-31-I</option>
				<option value="S-31-D">S-31-D</option>
				<option value="S-32-I">S-32-I</option>
				<option value="S-32-D">S-32-D</option>
				<option value="S-33-I">S-33-I</option>
				<option value="S-33-D">S-33-D</option>
				<option value="S-34-I">S-34-I</option>
				<option value="S-34-D">S-34-D</option>
				<option value="S-35-I">S-35-I</option>
				<option value="S-35-D">S-35-D</option>
				<option value="S-36-I">S-36-I</option>
				<option value="S-36-D">S-36-D</option>
				<option value="S-37-I">S-37-I</option>
				<option value="S-37-D">S-37-D</option>
				<option value="S-38-I">S-38-I</option>
				<option value="S-38-D">S-38-D</option>
				<option value="S-39-I">S-39-I</option>
				<option value="S-39-D">S-39-D</option>
				<option value="S-40-I">S-40-I</option>
				<option value="S-40-D">S-40-D</option>
				<option >SURTIDO FARMACIA</option>
				<option value="S-1">S-1</option>
<option value="S-2">S-2</option>
<option value="S-3">S-3</option>
<option value="S-4">S-4</option>
<option value="S-5">S-5</option>
<option value="S-6">S-6</option>
<option value="S-7">S-7</option>
<option value="S-8">S-8</option>
<option value="S-9">S-9</option>
<option value="S-10">S-10</option>
<option value="S-11">S-11</option>
<option value="S-12">S-12</option>
<option value="S-13">S-13</option>
<option value="S-14">S-14</option>
<option value="S-15">S-15</option>
<option value="S-16">S-16</option>
<option value="S-17">S-17</option>
<option value="S-18">S-18</option>
<option value="S-19">S-19</option>
<option value="S-20">S-20</option>
<option value="S-21">S-21</option>
<option value="S-22">S-22</option>
<option value="S-23">S-23</option>
<option value="S-24">S-24</option>
<option value="S-25">S-25</option>
<option value="S-26">S-26</option>
<option value="S-27">S-27</option>
<option value="S-28">S-28</option>
<option value="S-29">S-29</option>
<option value="S-30">S-30</option>
<option value="S-31">S-31</option>
<option value="S-32">S-32</option>
<option value="S-33">S-33</option>
<option value="S-34">S-34</option>
<option value="S-35">S-35</option>
<option value="S-36">S-36</option>
<option value="S-37">S-37</option>
<option value="S-38">S-38</option>
<option value="S-39">S-39</option>
<option value="S-40">S-40</option>
<option value="S-41">S-41</option>
<option value="S-42">S-42</option>
<option value="S-43">S-43</option>
<option value="S-44">S-44</option>
<option value="S-45">S-45</option>
<option value="S-46">S-46</option>
<option value="S-47">S-47</option>
<option value="S-48">S-48</option>
<option value="S-49">S-49</option>
<option value="S-50">S-50</option>
<option value="S-51">S-51</option>
<option value="S-52">S-52</option>
<option value="S-53">S-53</option>
<option value="S-54">S-54</option>
<option value="S-55">S-55</option>
<option value="S-56">S-56</option>
<option value="S-57">S-57</option>
<option value="S-58">S-58</option>
<option value="S-59">S-59</option>
<option value="S-60">S-60</option>
<option value="S-61">S-61</option>
<option value="S-62">S-62</option>
<option value="S-63">S-63</option>
<option value="S-64">S-64</option>
<option value="S-65">S-65</option>
<option value="S-66">S-66</option>
<option value="S-67">S-67</option>
<option value="S-68">S-68</option>
<option value="S-69">S-69</option>
<option value="S-70">S-70</option>
<option value="S-71">S-71</option>
<option value="S-72">S-72</option>
<option value="S-73">S-73</option>
<option value="S-74">S-74</option>
<option value="S-75">S-75</option>
<option value="S-76">S-76</option>
<option value="S-77">S-77</option>
<option value="S-78">S-78</option>
<option value="S-79">S-79</option>
<option value="S-80">S-80</option>
<option value="S-81">S-81</option>
<option value="S-82">S-82</option>
<option value="S-83">S-83</option>
<option value="S-84">S-84</option>
<option value="S-85">S-85</option>
<option value="S-86">S-86</option>
<option value="S-87">S-87</option>
<option value="S-88">S-88</option>
<option value="S-89">S-89</option>
<option value="S-90">S-90</option>
<option value="S-91">S-91</option>
<option value="S-92">S-92</option>
<option value="S-93">S-93</option>
<option value="S-94">S-94</option>
<option value="S-95">S-95</option>
<option value="S-96">S-96</option>
<option value="S-97">S-97</option>
<option value="S-98">S-98</option>
<option value="S-99">S-99</option>
<option value="S-100">S-100</option>
<option value="S-101">S-101</option>
<option value="S-102">S-102</option>
<option value="S-103">S-103</option>
<option value="S-104">S-104</option>
<option value="S-105">S-105</option>
<option value="S-106">S-106</option>
<option value="S-107">S-107</option>
<option value="S-108">S-108</option>
<option value="S-109">S-109</option>
<option value="S-110">S-110</option>
<option value="S-111">S-111</option>
<option value="S-112">S-112</option>
<option value="S-113">S-113</option>
<option value="S-114">S-114</option>
<option value="S-115">S-115</option>
<option value="S-116">S-116</option>
<option value="S-117">S-117</option>
<option value="S-118">S-118</option>
<option value="S-119">S-119</option>
<option value="S-120">S-120</option>
<option value="S-121">S-121</option>
<option value="S-122">S-122</option>
<option value="S-123">S-123</option>
<option value="S-124">S-124</option>
<option value="S-125">S-125</option>
<option value="S-126">S-126</option>
<option value="S-127">S-127</option>
<option value="S-128">S-128</option>
<option value="S-129">S-129</option>
<option value="S-130">S-130</option>
<option value="S-131">S-131</option>
<option value="S-132">S-132</option>
<option value="S-133">S-133</option>
<option value="S-134">S-134</option>
<option value="S-135">S-135</option>
<option value="S-136">S-136</option>
<option value="S-137">S-137</option>
<option value="S-138">S-138</option>
<option value="S-139">S-139</option>
<option value="S-140">S-140</option>
<option value="S-141">S-141</option>
<option value="S-142">S-142</option>
<option value="S-143">S-143</option>
<option value="S-144">S-144</option>
<option value="S-145">S-145</option>
<option value="S-146">S-146</option>
<option value="S-147">S-147</option>
<option value="S-148">S-148</option>
<option value="S-149">S-149</option>
<option value="S-150">S-150</option>
<option value="S-151">S-151</option>
<option value="S-152">S-152</option>
<option value="S-153">S-153</option>
<option value="S-154">S-154</option>
<option value="S-155">S-155</option>
<option value="S-156">S-156</option>
<option value="S-157">S-157</option>
<option value="S-158">S-158</option>
<option value="S-159">S-159</option>
<option value="S-160">S-160</option>
<option value="S-161">S-161</option>
<option value="S-162">S-162</option>
<option value="S-163">S-163</option>
<option value="S-164">S-164</option>
<option value="S-165">S-165</option>
<option value="S-166">S-166</option>
<option value="S-167">S-167</option>
<option value="S-168">S-168</option>
<option value="S-169">S-169</option>
<option value="S-170">S-170</option>
<option value="S-171">S-171</option>
<option value="S-172">S-172</option>
<option value="S-173">S-173</option>
<option value="S-174">S-174</option>
<option value="S-175">S-175</option>
<option value="S-175">S-175</option>
<option value="S-176">S-176</option>
<option value="S-177">S-177</option>
<option value="S-178">S-178</option>
<option value="S-179">S-179</option>
<option value="S-180">S-180</option>
<option value="S-181">S-181</option>
<option value="S-182">S-182</option>
<option value="S-183">S-183</option>
<option value="S-184">S-184</option>
<option value="S-185">S-185</option>
<option value="S-186">S-186</option>
<option value="S-187">S-187</option>
<option value="S-188">S-188</option>
<option value="S-189">S-189</option>
<option value="S-190">S-190</option>
<option value="S-191">S-191</option>
<option value="S-192">S-192</option>
<option value="S-193">S-193</option>
<option value="S-194">S-194</option>
<option value="S-195">S-195</option>
<option value="S-196">S-196</option>
<option value="S-197">S-197</option>
<option value="S-198">S-198</option>
<option value="S-199">S-199</option>
<option value="S-200">S-200</option>
<option value="S-201">S-201</option>
<option value="S-202">S-202</option>
<option value="S-203">S-203</option>
<option value="S-204">S-204</option>
<option value="S-205">S-205</option>
<option value="S-206">S-206</option>
<option value="S-207">S-207</option>
<option value="S-208">S-208</option>
<option value="S-209">S-209</option>
<option value="S-210">S-210</option>
<option value="S-211">S-211</option>
<option value="S-212">S-212</option>
<option value="S-213">S-213</option>
<option value="S-214">S-214</option>
<option value="S-215">S-215</option>
<option value="S-216">S-216</option>
<option value="S-217">S-217</option>
<option value="S-218">S-218</option>
<option value="S-219">S-219</option>
<option value="S-220">S-220</option>
<option value="S-221">S-221</option>
<option value="S-222">S-222</option>
<option value="S-223">S-223</option>
<option value="S-224">S-224</option>
<option value="S-225">S-225</option>
<option value="S-226">S-226</option>
<option value="S-227">S-227</option>
<option value="S-228">S-228</option>
<option value="S-229">S-229</option>
<option value="S-230">S-230</option>
<option value="S-231">S-231</option>
<option value="S-232">S-232</option>
<option value="S-233">S-233</option>
<option value="S-234">S-234</option>
<option value="S-235">S-235</option>
<option value="S-236">S-236</option>
<option value="S-237">S-237</option>
<option value="S-238">S-238</option>
<option value="S-239">S-239</option>
<option value="S-240">S-240</option>
<option value="S-241">S-241</option>
<option value="S-242">S-242</option>
<option value="S-243">S-243</option>
<option value="S-244">S-244</option>
<option value="S-245">S-245</option>
<option value="S-246">S-246</option>
<option value="S-247">S-247</option>
<option value="S-248">S-248</option>
<option value="S-249">S-249</option>

<option value="BS-1">BS-1</option>
<option value="BS-2">BS-2</option>
<option value="BS-3">BS-3</option>
<option value="BS-4">BS-4</option>
<option value="BS-5">BS-5</option>
<option value="BS-6">BS-6</option>
<option value="BS-7">BS-7</option>
<option value="BS-8">BS-8</option>
<option value="BS-9">BS-9</option>
<option value="BS-10">BS-10</option>
<option value="BS-11">BS-11</option>
<option value="BS-12">BS-12</option>
<option value="BS-13">BS-13</option>
<option value="BS-14">BS-14</option>
<option value="BS-15">BS-15</option>
<option value="BS-16">BS-16</option>
<option value="BS-17">BS-17</option>
<option value="BS-18">BS-18</option>
<option value="BS-19">BS-19</option>
<option value="BS-20">BS-20</option>
<option value="BS-21">BS-21</option>
<option value="BS-22">BS-22</option>
<option value="BS-23">BS-23</option>
<option value="BS-24">BS-24</option>
<option value="BS-25">BS-25</option>
<option value="BS-26">BS-26</option>
<option value="BS-27">BS-27</option>
<option value="BS-28">BS-28</option>
<option value="BS-29">BS-29</option>
<option value="BS-30">BS-30</option>
<option value="BS-31">BS-31</option>
<option value="BS-32">BS-32</option>
<option value="BS-33">BS-33</option>
<option value="BS-34">BS-34</option>
<option value="BS-35">BS-35</option>
<option value="BS-36">BS-36</option>
<option value="BS-37">BS-37</option>
<option value="BS-38">BS-38</option>
<option value="BS-39">BS-39</option>
<option value="BS-40">BS-40</option>
<option value="BS-41">BS-41</option>
<option value="BS-42">BS-42</option>
<option value="BS-43">BS-43</option>
<option value="BS-44">BS-44</option>
<option value="BS-45">BS-45</option>
<option value="M-1">M-1</option>
<option value="M-2">M-2</option>
<option value="M-3">M-3</option>
<option value="M-4">M-4</option>
<option value="M-5">M-5</option>
<option value="M-6">M-6</option>
<option value="M-7">M-7</option>
<option value="M-8">M-8</option>
<option value="M-9">M-9</option>
<option value="M-10">M-10</option>
<option value="M-11">M-11</option>
<option value="M-12">M-12</option>
<option value="M-13">M-13</option>
<option value="M-14">M-14</option>
<option value="M-15">M-15</option>
<option value="M-16">M-16</option>
<option value="M-17">M-17</option>
<option value="M-18">M-18</option>
<option value="M-19">M-19</option>
<option value="M-20">M-20</option>
<option value="M-21">M-21</option>
<option value="M-22">M-22</option>
<option value="M-23">M-23</option>
<option value="M-24">M-24</option>
<option value="M-25">M-25</option>
<option value="M-26">M-26</option>
<option value="M-27">M-27</option>
<option value="M-28">M-28</option>
<option value="M-29">M-29</option>
<option value="M-30">M-30</option>
<option value="M-31">M-31</option>
<option value="M-32">M-32</option>
<option value="M-33">M-33</option>
<option value="M-34">M-34</option>
<option value="M-35">M-35</option>
<option value="M-36">M-36</option>
<option value="M-37">M-37</option>
<option value="M-38">M-38</option>
<option value="M-39">M-39</option>
<option value="M-40">M-40</option>
<option value="M-41">M-41</option>
<option value="M-42">M-42</option>
<option value="M-43">M-43</option>
<option value="M-44">M-44</option>
<option value="M-45">M-45</option>
<option value="M-46">M-46</option>
<option value="M-47">M-47</option>
<option value="M-48">M-48</option>
<option value="M-49">M-49</option>
<option value="M-50">M-50</option>
<option value="M-51">M-51</option>
<option value="M-52">M-52</option>
<option value="M-53">M-53</option>
<option value="M-54">M-54</option>
<option value="M-55">M-55</option>
<option value="M-56">M-56</option>
<option value="M-57">M-57</option>
<option value="M-58">M-58</option>
<option value="M-59">M-59</option>
<option value="M-60">M-60</option>
<option value="M-61">M-61</option>
<option value="M-62">M-62</option>
<option value="M-63">M-63</option>
<option value="M-64">M-64</option>
<option value="M-65">M-65</option>
<option value="M-66">M-66</option>
<option value="M-67">M-67</option>
<option value="M-68">M-68</option>
<option value="M-69">M-69</option>
<option value="M-70">M-70</option>
<option value="M-71">M-71</option>
<option value="M-72">M-72</option>
<option value="M-73">M-73</option>
<option value="M-74">M-74</option>
<option value="M-75">M-75</option>
<option value="M-76">M-76</option>
<option value="M-77">M-77</option>
<option value="M-78">M-78</option>
<option value="M-79">M-79</option>
<option value="M-80">M-80</option>
<option value="M-81">M-81</option>
<option value="M-82">M-82</option>
<option value="M-83">M-83</option>
<option value="M-84">M-84</option>
<option value="M-85">M-85</option>
<option value="M-86">M-86</option>
<option value="M-87">M-87</option>
<option value="M-88">M-88</option>
<option value="M-89">M-89</option>
<option value="M-90">M-90</option>
<option value="M-91">M-91</option>
<option value="M-92">M-92</option>
<option value="M-93">M-93</option>
<option value="M-94">M-94</option>
<option value="M-95">M-95</option>
<option value="M-96">M-96</option>
<option value="M-97">M-97</option>
<option value="M-98">M-98</option>
<option value="M-99">M-99</option>
<option value="M-100">M-100</option>
<option value="M-101">M-101</option>
<option value="M-102">M-102</option>
<option value="M-103">M-103</option>
<option value="M-104">M-104</option>
<option value="M-105">M-105</option>
<option value="M-106">M-106</option>
<option value="M-107">M-107</option>
<option value="M-108">M-108</option>
<option value="M-109">M-109</option>
<option value="M-110">M-110</option>
<option value="M-111">M-111</option>
<option value="M-112">M-112</option>
<option value="M-113">M-113</option>
<option value="M-114">M-114</option>
<option value="M-115">M-115</option>
<option value="M-116">M-116</option>
<option value="M-117">M-117</option>
<option value="M-118">M-118</option>
<option value="M-119">M-119</option>
<option value="M-120">M-120</option>
<option value="M-121">M-121</option>
<option value="M-122">M-122</option>
<option value="M-123">M-123</option>
<option value="M-124">M-124</option>
<option value="M-125">M-125</option>
<option value="M-126">M-126</option>
<option value="M-127">M-127</option>
<option value="M-128">M-128</option>
<option value="M-129">M-129</option>
<option value="M-130">M-130</option>
<option value="M-131">M-131</option>
<option value="M-132">M-132</option>
<option value="M-133">M-133</option>
<option value="M-134">M-134</option>
<option value="M-135">M-135</option>
<option value="M-136">M-136</option>
<option value="M-137">M-137</option>
<option value="M-138">M-138</option>
<option value="M-139">M-139</option>
<option value="M-140">M-140</option>
<option value="M-141">M-141</option>
<option value="M-142">M-142</option>
<option value="M-143">M-143</option>
<option value="M-144">M-144</option>
<option value="M-145">M-145</option>
<option value="M-146">M-146</option>
<option value="M-147">M-147</option>
<option value="M-148">M-148</option>
<option value="M-149">M-149</option>
<option value="M-150">M-150</option>
<option value="M-151">M-151</option>
<option value="M-152">M-152</option>
<option value="M-153">M-153</option>
<option value="M-154">M-154</option>
<option value="M-155">M-155</option>
<option value="M-156">M-156</option>
<option value="M-157">M-157</option>
<option value="M-158">M-158</option>
<option value="M-159">M-159</option>
<option value="M-160">M-160</option>
<option value="BM-1">BM-1</option>
<option value="BM-2">BM-2</option>
<option value="BM-3">BM-3</option>
<option value="BM-4">BM-4</option>
<option value="BM-5">BM-5</option>
<option value="BM-6">BM-6</option>
<option value="BM-7">BM-7</option>
<option value="BM-8">BM-8</option>
<option value="BM-9">BM-9</option>
<option value="BM-10">BM-10</option>
<option value="BM-11">BM-11</option>
<option value="BM-12">BM-12</option>
<option value="BM-13">BM-13</option>
<option value="BM-14">BM-14</option>
<option value="BM-15">BM-15</option>
<option value="BM-16">BM-16</option>
<option value="BM-17">BM-17</option>
<option value="BM-18">BM-18</option>
<option value="BM-19">BM-19</option>
<option value="BM-20">BM-20</option>
<option value="BM-21">BM-21</option>
<option value="BM-22">BM-22</option>
<option value="BM-23">BM-23</option>
<option value="BM-24">BM-24</option>
<option value="BM-25">BM-25</option>
<option value="BM-26">BM-26</option>
<option value="BM-27">BM-27</option>
<option value="BM-28">BM-28</option>
<option value="BM-29">BM-29</option>
<option value="BM-30">BM-30</option>
<option value="BM-31">BM-31</option>
<option value="BM-32">BM-32</option>
<option value="BM-33">BM-33</option>

				
                    </select></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">CAJAS:</span></td>
                  <td><input name="txtf_exi" type="text" size="10" value="<%=exi_jv%>" onkeypress="return handleEnter(this, event)"></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">PIEZAS:</span></td>
                  <td><input name="txtf_pza" type="text" size="10" value="<%=pzas_jv%>" onkeypress="return handleEnter(this, event)" /></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">RESTO:</span></td>
                  <td><input name="txtf_rto" type="text" onclick="putSuma(this.form)" onkeypress="return handleEnter(this, event)" value="<%=resto_jv%>" size="10"/>
                    **</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">CANTIDAD:</span></td>
                  <td><input name="txtf_exist" type="text" onclick="putSuma(this.form)" onkeypress="return handleEnter(this, event)" value="<%=exist_jv%>" size="10" /></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21">&nbsp;</td>
                  <td><!--input type="submit" name="Submit" value="Capturar" /-->
                    <label>
                    <input type="submit" name="Submit" value="Guardar" />
                    </label></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td><!--span class="style10">LOTE:</span></td>
                  <td width="418"><input name="txtf_lote" type="text" onchange="toUppercaseLote();" onkeypress="return handleEnter(this, event)" value="<%//=lote2_jv%>" size="50"/></td>
                  <td width="244">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="54"><span class="style10">CADUCIDAD:</span></td>
                  <td><span class="style10">
                    <label>
                    <input type='text' name='txtf_caduc' id='txtf_caduc' title='DD/MM/AAAA' size='10' maxlength='10' onclick='scwShow(this, event);' value="<%//=cad2_jv%>" readonly="true" onkeypress="return handleEnter(this, event)"/>
                    </label>
                      <img src="calendar.jpg" width="27" height="26" border="0" onclick="scwShow(scwID('txtf_caduc'),event);"/> </span></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21" class="style10">CAJAS:</td>
                  <td height="21"><label>
                    <input type="text" name="txtf_exi" value="<%//=cajas_jv%>" onkeypress="return handleEnter(this, event)" />
                  </label></td>
                  <td height="21">&nbsp;</td>
                  <td height="21">&nbsp;</td>
                </tr>
                <tr>
                  <td height="21" class="style10">NO. PIEZAS </td>
                  <td height="21"><input type="text" name="txtf_pza" value="<%//=npzas_jv%>" onkeypress="return handleEnter(this, event)" /></td>
                  <td height="21">&nbsp;</td>
                  <td height="21">&nbsp;</td>
                </tr>
                <tr>
                  <td height="21" class="style10">RESTO:</td>
                  <td height="21"><input type="text" name="txtf_rto" value="<%//=resto_jv%>" onkeypress="return handleEnter(this, event)" onclick="putSuma(this.form)" /></td>
                  <td height="21">&nbsp;</td>
                  <td height="21">&nbsp;</td>
                </tr>
                <tr>
                  <td height="21" class="style10">EXISTENCIA:</td>
                  <td height="21"><input type="text" name="txtf_exist" value="<%//=exist_jv%>" /></td>
                  <td height="21">&nbsp;</td>
                  <td height="21">&nbsp;</td>
                </tr>
                <tr>
                  <td height="21" class="style10">&nbsp;</td>
                  <td height="21"><input type="submit" name="Submit" value="Capturar" /></td>
                  <td height="21">&nbsp;</td>
                  <td height="21">&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><label></label></td>
                  <td height="21">&nbsp;</td>
                  <td height="21">&nbsp;</td>
                  <td height="21">&nbsp;</td>
                </tr-->                </td>
                </tr>
            </table>
          </div>        </th>
      </tr>
    </table>
	<table width="1025"  border="1">
  <tr bgcolor="#124E83" class="style1">
    <td width="66" background="imagenes/fondo.jpg"><div align="center" ><strong>Código Barra</strong></div></td>
    <td width="63" background="imagenes/fondo.jpg"><div align="center" ><strong>ORIGEN</strong></div></td>
    <td width="63" height="25" background="imagenes/fondo.jpg"><div align="center" ><strong>CLAVE</strong></div></td>
    
    <td width="67" background="imagenes/fondo.jpg"><div align="center" class="style1"><strong>LOTE</strong></div></td>
    <td width="312" background="imagenes/fondo.jpg"><div align="center" class="style1"><strong>DESCRIPCI&Oacute;N</strong></div></td>
    
    <td width="76" background="imagenes/fondo.jpg"><span class="style1"><strong>CADUCIDAD</strong></span></td>
    <td width="72" background="imagenes/fondo.jpg"><div align="center" class="style1"><strong>UBICACI&Oacute;N</strong></div></td>
    <td width="78" background="imagenes/fondo.jpg"><div align="center" class="style1"><strong>EXISTENCIA</strong></div></td>
	<td width="78" background="imagenes/fondo.jpg"><div align="center" class="style16">&nbsp;</div></td>
	<td width="86" background="imagenes/fondo.jpg"><div align="center" class="style16">&nbsp;</div></td>
  </tr>
  <%
  Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/dgo");
  Statement stmt__001 = conn__001.createStatement();
  stmt__001.execute("commit");
  ResultSet rset__001=stmt__001.executeQuery("select cod_bar,origen,clave,lote,descr,cadu,ubi,cant,id_cap_inv from datos_inv_cod where equipo='"+equipo_jv+"'");
 
   while(rset__001.next()) 
                  { 
  %>  
  <tr>
    <td><div align="center" class="style5 style14"><%=rset__001.getString("cod_bar") %></div></td>
    <td><div align="center" class="style5 style14"><%=rset__001.getString("origen") %></div></td>
    <td><div align="center" class="style5 style14"><%=rset__001.getString("clave") %></div></td>
   <td><div align="center" class="style5 style14"><%=rset__001.getString("lote") %></div></td>
    <td><div align="center" class="style5 style14"><%=rset__001.getString("descr") %></div></td>
    
    <td><div align="center" class="style5 style14"><%=rset__001.getString("cadu") %></div></td>
    <td><div align="center" class="style5 style14"><%=rset__001.getString("ubi") %></div></td>
    <td><div align="center" class="style5 style14"><%=rset__001.getString("cant") %>
	<% 
	  eliminar_jv=rset__001.getString("id_cap_inv");
	  //out.print("valor 1"+eliminar_jv);
	  %>
    <input name="hdn_<%=eliminar_jv%>" type="hidden" class="style15" id="hdn_<%=eliminar_jv%>" value="0"/></div></td>
    
	<td><div align="center" class="style5">
	  <input  type="button" id="btn_<%=eliminar_jv%>" name="btn_<%=eliminar_jv%>" class="subHeader" value="Eliminar" onclick='location.href=&quot;eliminar_inv_alm_dgo_mens.jsp?id_prov=<%=eliminar_jv%>&amp;hora_ini_vi=<%=hora_ini_jv%>&amp;equi_vi=<%=equipo_jv%>&amp;integran_vi=<%=integrantes_jv%>&amp;lugar_vi=<%=lugar_jv%>&amp;usuario=<%=usu_jv%>&quot;'/>
	</div></td>
    <td><input  type="button" id="btn_<%=eliminar_jv%>2" name="btn_<%=eliminar_jv%>2" class="subHeader" value="Modificar" onclick='location.href=&quot;login?ban=7&id_prov=<%=eliminar_jv%>&amp;hora_ini_vi=<%=hora_ini_jv%>&amp;equi_vi=<%=equipo_jv%>&amp;integran_vi=<%=integrantes_jv%>&amp;lugar_vi=<%=lugar_jv%>&amp;nombre=<%=user1%>&quot;'/></td>
    <%
  
    }
  %>
  </tr>

  
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
    </tr>
	</table>

    <p>
      <!--onSubmit="javascript:return ValidateFormCant(this)"-->
    </p>
    <p>&nbsp;</p>
    <p><br />
      <br />
    </p>
	  </form>    </td>
    <td width="42">&nbsp;</td>
        <td width="152" valign="top"><br />
		&nbsp;<br />
		<table border="0" cellspacing="0" cellpadding="0" width="101">
			<tr>
			<td colspan="3" class="subHeader" align="center">&nbsp;</td>
			</tr>

			<tr>
			<td width="40">&nbsp;</td>
			<td width="48" id="sidebar" class="smallText"><br />
			<p><br />
			  <br />
			<a href="javascript:;"></a></p>

			<p><br />
			</p>
			 <br />
			&nbsp;<br />
			&nbsp;<br />			</td>
			<td width="102">&nbsp;</td>
			</tr>
	</table>	</td>
	<td width="40">&nbsp;</td>
  </tr>
  <tr>
    <td width="77">&nbsp;</td>
    <td width="23">&nbsp;</td>
    <td width="11">&nbsp;</td>
    <td width="866">&nbsp;</td>
    <td width="42">&nbsp;</td>
    <td width="152">&nbsp;</td>
	<td width="40">&nbsp;</td>
  </tr>
</table>
</body>
</html>
