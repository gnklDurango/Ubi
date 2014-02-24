<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.Date" errorPage="" import="java.text.SimpleDateFormat"%>
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
String lote_jv="",t2_jv="",origen2_jv="";
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
String usu_jv="";
   try {
		usu_jv = request.getParameter("usuario"); 
		//only = request.getParameter("id_only");      			   
} catch (Exception e) { }


String hora_ini_jv="";
 	  try {
       		hora_ini_jv = request.getParameter("hora_ini_vi");       			   
	  } catch (Exception e) { }
String lugar_jv="";
 	  try {
       		lugar_jv = request.getParameter("lugar_vi");       			   
	  } catch (Exception e) { }	  
String equipo_jv="";
 	  try {
       		equipo_jv = request.getParameter("equi_vi");       			   
	  } catch (Exception e) { }
	  
	  String integrantes_jv="";
 	  try {
       		integrantes_jv = request.getParameter("integran_vi");       			   
	  } catch (Exception e) { }

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
	    //String lote_jv= "";
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
		out.print("entro"+des_jv);
	    rset1 = stmt1.executeQuery("SELECT * FROM datos_prov_1_0807 WHERE cb='"+des_jv+"' group by lote;");
		     while (rset1.next()) 
                  { 
				  t2_jv=rset1.getString("cadu");
				  origen2_jv=rset1.getString("origen");
				  codeb_jv=rset1.getString("cb");
				  lote_jv=rset1.getString("lote");  
					//ban=1;
                    part_jv=rset1.getString("cve_med");
					clave_jv=rset1.getString("cve_med");
					descrip_jv=rset1.getString("descri");
					//codeb_jv=rset1.getString("cb");
					um_jv=rset1.getString("um");
                    marca_jv=rset1.getString("marca");
                   
				   if(des_jv.equals(codeb_jv))
					   {
					   
                         //if(!(exi_jv.equals("0")))
						  //{					   
					         lotes[pos]=lote_jv;
						     cad[pos]=t2_jv;
						     //exis[pos]=exi_jv;
							 pos++;
					         cont++;
						  //}	 
						    
				        }
				   
				   
				   
				   }
		
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
		  origen2_jv=request.getParameter("txtf_origen");
			  //out.print(cadudia_jv.length());
			//  if( (cadudia_jv.length())==1 )
			  //    cadudia_jv="0"+cadudia_jv;
			//cadumes_jv=request.getParameter("txtf_t2");
			  //if( (cadumes_jv.length())==1 )
			    //  cadumes_jv="0"+cadumes_jv;
			caduano_jv=request.getParameter("txtf_t3");
			      //if( (cadumes_jv.length())==1 )
			cadun_jv=request.getParameter("txtf_t3");
		  
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
			 
			 
		 stmt1.execute("insert into datos_inv_cod values('"+cbean_jv+"','"+clave_jv+"','"+loten_jv+"','"+descrip_jv+"','"+cadun_jv+"','"+ubin_jv+"','"+exist_jv+"','"+equipo_jv+"','"+integrantes_jv+"','"+date_jv+"','BODEGA',0,'"+exi_jv+"','"+pzas_jv+"','"+resto_jv+"','"+marca_jv+"','"+um_jv+"','"+origen2_jv+"','-','-')");
		
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
<script language="javascript" src="list02.js"></script>
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
    <td height="63" colspan="3" align="center" valign="bottom" nowrap="nowrap" bgcolor="ffffff" id="logo"><img src="imagenes/logo_conjun.jpg"  /></td>
    <td bgcolor="ffffff">&nbsp;</td>
  </tr>
  <tr bgcolor="#3366CC">
    <td height="33" colspan="3" align="center" valign="bottom" nowrap="nowrap" background="imagenes/fondo.jpg" id="logo"><div align="center">Agregar Clave a Farmacia|<span class="style7">&nbsp;</span><span class="smallText style8">GNKL Software </span></div></td>
    <td width="40" bgcolor="ffffff">&nbsp;</td>
  </tr>

  <tr bgcolor="#3366CC">  </tr>

  <tr>
    <td colspan="7" bgcolor="#003366"></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<td height="25" colspan="7" bgcolor="#ffffff" id="dateformat">&nbsp;&nbsp;<script language="JavaScript" type="text/javascript">
      //document.write(TODAY);	</script>
    <a href="equipo_alm_dgo_farm.jsp">Realizar otra toma de INVENTARIO</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ubi_dgo.jsp">Regresar a programa de UBICACIONES</a>&nbsp;&nbsp;&nbsp;<a href="equipo_alm_dgo.jsp">Inventario Código de Barras por CLAVE</a></td>
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
    <td colspan="2" valign="top"><form action="consulta2_inv2_farm.jsp?hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>&lugar_vi=<%=lugar_jv%>&usuario=<%=usu_jv%>" method="post" name="form" id="form" onSubmit="javascript:return ValidateAbas(this)">
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
            </p>
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
          </div>        </tr>
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
                    <input name="txtf_loten" type="text" id="txtf_loten" value="<%=lote_jv%>" size="30" onchange="toUppercaseLoten();" onkeypress="return handleEnter(this, event)"/>
                  <%
		   if(pos>1)
		   {
		%>
				  
				  <select name="slct_lote" class="bodyText" onchange="setLot1(this.form);dimePropiedades(this.form);" onkeypress="return handleEnter(this, event)">
        <option>-- Lote --</option>
        <%
		     
             for(x1=0;x1<pos;x1++)
                {
                   
           %>
        <option value="<%=lotes[x1]%>"><%=lotes[x1]%></option>
        <%
	  }
	%>
      </select><%
	  }
	%>
				  
				  </label></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">CADUCIDAD:</span></td>
                  <td><span class="style10">
                    <input name="txtf_t3" type="text" size="30"  value="<%=t2_jv%>" onKeyPress="return handleEnter(this, event)"/>
                    <%
		   if(pos>1)
		   {
		%>
      <select name="slct_cad" class="bodyText" onchange="setCad(this.form)" onkeypress="return handleEnter(this, event)">
        <option>-- Caducidad --</option>
        <%
		     
             for(x1=0;x1<pos;x1++)
                {
                   
           %>
        <option value="<%=cad[x1]%>"><%=cad[x1]%></option>
        <%
                }
           %>
      </select>
      <%
		  }
		%><br />
                    DD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AAAA</span></td>
					
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="21"><span class="style10">ORIGEN:</span></td>
                  <td><input name="txtf_origen" type="text" id="txtf_origen" size="10" value="<%=origen2_jv%>" onkeypress="return handleEnter(this, event)" onchange="toUppercaseUbic1();"/>&nbsp;<select name="slc_origen" class="bodyText" onchange="setOrigen(this.form);">
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
                     
				<option >AREA DE SURTIDO</option>
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
                  <td><input name="txtf_exi" type="text" size="10" value="<%=exi_jv%>" onkeypress="return handleEnter(this, event)"  /></td>
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
                </tr-->
                </table>
          </div>        </tr>
    </table>
	<table width="1025"  border=1>
  <tr bgcolor="#124E83" class="style1">
    <td width="66" background="imagenes/aa.gif"><div align="center" ><strong>Código Barra</strong></div></td>
    <td width="63" background="imagenes/aa.gif"><div align="center" ><strong>ORIGEN</strong></div></td>
    <td width="63" height="25" background="imagenes/aa.gif"><div align="center" ><strong>CLAVE</strong></div></td>
    
    <td width="67" background="imagenes/aa.gif"><div align="center" class="style1"><strong>LOTE</strong></div></td>
    <td width="312" background="imagenes/aa.gif"><div align="center" class="style1"><strong>DESCRIPCI&Oacute;N</strong></div></td>
    
    <td width="76" background="imagenes/aa.gif"><span class="style1"><strong>CADUCIDAD</strong></span></td>
    <td width="72" background="imagenes/aa.gif"><div align="center" class="style1"><strong>UBICACI&Oacute;N</strong></div></td>
    <td width="78" background="imagenes/aa.gif"><div align="center" class="style1"><strong>EXISTENCIA</strong></div></td>
	<td width="78" background="imagenes/aa.gif"><div align="center" class="style16">&nbsp;</div></td>
	<td width="86" background="imagenes/aa.gif"><div align="center" class="style16">&nbsp;</div></td>
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
	  <input  type="button" id="btn_<%=eliminar_jv%>" name="btn_<%=eliminar_jv%>" class="subHeader" value="Eliminar" onclick='location.href="eliminar_inv_alm_dgo_mens_far.jsp?id_prov=<%=eliminar_jv%>&hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>&lugar_vi=<%=lugar_jv%>&usuario=<%=usu_jv%>"'/>
	</div></td>
    <td><input  type="button" id="btn_<%=eliminar_jv%>2" name="btn_<%=eliminar_jv%>2" class="subHeader" value="Modificar" onclick='location.href="modifica_inv_alm_dgo_far.jsp?id_prov=<%=eliminar_jv%>&hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>&lugar_vi=<%=lugar_jv%>&usuario=<%=usu_jv%>"'/></td>
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
