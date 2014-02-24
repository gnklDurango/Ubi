<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" import="java.util.Date" import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% 
/*-----------------------------------------------------------------------------------------------------
Nombre del Archivo: modifica_inv_alm.jsp
Fecha:2010
Autor: RHW
  ------------------------------------------------------------------------------------------------------*/

Class.forName("org.gjt.mm.mysql.Driver");
 String enc_jv="";
 String clagto_jv="";
 String unigto_jv="";
 String juris3_jv="";
 String juris4_jv="";
 
 String encar2_jv="";
 String cuantos_jv="1";
 String exi_jv="";
 
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
 
 String eliminar_jv="";
 	  try {
       		eliminar_jv = request.getParameter("id_prov");       			   
	  } catch (Exception e) { }
//out.print("recibe"+eliminar_jv);
String hora_ini_jv="";
 	  try {
       		hora_ini_jv = request.getParameter("hora_ini_vi");       			   
	  } catch (Exception e) { }
	  
	  String equipo_jv="";
 	  try {
       		equipo_jv = request.getParameter("equi_vi");       			   
	  } catch (Exception e) { }
	  
	  String integrantes_jv="";
 	  try {
       		integrantes_jv = request.getParameter("integran_vi");       			   
	  } catch (Exception e) { }
	
 
 //variable para el proy captura de cb
 String cb_jv="";
 
 
 
 //variable para el segundo Mostrar
 	String clave2_jv="";
	String desc2_jv= "";
	String lote2_jv= ""; 
	String lote_aux_jv= "";
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

 
cuantos_jv=request.getParameter("txtf_cant");
     Connection conn_001 = DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
        Statement stmt_001 = conn_001.createStatement();
        ResultSet rset_001=stmt_001.executeQuery("SELECT * FROM datos_far order by (clave+0)");
          while (rset_001.next()) 
                  { 
                    clagto_jv=rset_001.getString("clave");  
				    unigto_jv=rset_001.getString("unidad");	
					enc_jv=rset_001.getString("encar1");   
					juris2_jv=rset_001.getString("juris");
                    
                   }


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
		String ubi_jv= "";
		String descrip_jv= "";
		String desc_jv=  "";
	    String lote_jv= "";
		String cadu_jv= "";
		String exis_jv= "";
		String costo_jv= "";
int cont=1;
//Rutina para obtener las claves 
	    Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
        Statement stmt1 = conn1.createStatement();
        ResultSet rset1=stmt1.executeQuery("SELECT distinct clave FROM claves_alm order by (descr+0)");
          while (rset1.next()) 
                  { 
                    
                    cad1[tam2]=rset1.getString("clave");     
                     tam2++;
                   }

Connection connn1 = DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
        Statement stmtt1 = connn1.createStatement();
        ResultSet rsett1=stmtt1.executeQuery("select claveydesc from cie2;");
          while (rsett1.next()) 
                  { 
                    
                    cie[tam_3]=rsett1.getString("claveydesc");     
                     tam_3++;
                   }
	 
	 
	 

try{
        altaOK=Integer.parseInt(request.getParameter("altaok"));   
       }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
	   
   try { 
        but=""+request.getParameter("Submit");
        //altaOK="no";
    }catch(Exception e){System.out.print("not");}

	if(but.equals("Cantidad"))
      {
        cuantos_jv= request.getParameter("txtf_cant");
		loop=Integer.parseInt(cuantos_jv);
		out.print(""+loop);
      }
	
	if(but.equals("slct"))
      {
	     out.print("Mily");
      }
	
	if(but.equals("Mostrar"))
{

  juris_jv= request.getParameter("txtf_3");
   //customerId2=0;   
   Connection conn_1 = 
                  DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
                  Statement stmt_1 = conn_1.createStatement();
                  
                  //cs_jv= request.getParameter("SubCat");
                  ResultSet rset_1 = stmt_1.executeQuery("select * from claves_alm where clave='"+juris_jv+"'");
				  //ResultSet rset_2 = stmt_1.executeQuery("select * from cla_lotes where clave='"+juris_jv+"'"); 
         /* while(rset_2.next())
				     {
  
		  lote_jv=  rset_1.getString("lote");
                      } 		  
         */
		 
		  while(rset_1.next())
				     {
                  clave_jv=  rset_1.getString("clave");
				  descrip_jv=  rset_1.getString("descr");
				  lote2_jv=  rset_1.getString("lote");
				  cad2_jv =  rset_1.getString("txtf_caduc"); 
				  cadu_jv=  rset_1.getString("caducidad");
				  exi_jv=  rset_1.getString("exisf");
				  
				  //if(exi_jv.equals("0"))
				     if(juris_jv.equals(clave_jv))
					   {
					   
                         					   
					         lotes[pos]=lote2_jv;
						     cad[pos]=cadu_jv;
						     exis[pos]=exi_jv;
							 pos++;
					         cont++;
						  	 
						    
				        }
                 
	//if(exi_jv.equals("0"))
	  			    
    lote2_jv=lotes[0];
	cadu_jv=cad[0];
	exi_jv=exis[0];
				  
				  
				  //costo_jv=  rset_1.getString("costo");
				  
				 //variables for get the medicine´s values 
				  
				  
				  
				  //for the top part
				  spss_jv= request.getParameter("txtf_spss");
				
                  med_jv= request.getParameter("txtf_med");
                  pac_jv= request.getParameter("txtf_pac");
                  tu_jv= request.getParameter("txtf_tu");

				  clave2_jv=  request.getParameter("txtf_cla2");
				  desc2_jv=  request.getParameter("txtf_desc2");
				  lote22_jv=  request.getParameter("txtf_lote2");  
				  cadu2_jv=  request.getParameter("txtf_cad2");
                  exis2_jv=  request.getParameter("txtf_cr2");
				  costo2_jv= request.getParameter("txtf_cs2");
				  exi2_jv= request.getParameter("txtf_exi2");
				  
				  cie_jv=request.getParameter("txtf_cie");
                  cve11_jv=request.getParameter("txtf_cla");
}
out.print("raymond"+cont+lotes[0]);
}				
if(but.equals("Mostrar 2"))
{
  //out.print("enter");
  juris3_jv = request.getParameter("txtf_32");
   //customerId2=0;   
   out.print("enter"+juris3_jv);
   Connection conn_1 = 
                  DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
                  Statement stmt_1 = conn_1.createStatement();
                  
                  //cs_jv= request.getParameter("SubCat");
                  ResultSet rset_1 = stmt_1.executeQuery("select * from claves_alm where clave='"+juris3_jv+"'");
				  //ResultSet rset_2 = stmt_1.executeQuery("select * from cla_lotes where clave='"+juris_jv+"'"); 
         /* while(rset_2.next())
				     {
  
		  lote_jv=  rset_1.getString("lote");
                      } 		  
         */
		 
		  while(rset_1.next())
				     {
                  clave2_jv=  rset_1.getString("clave");
				  desc2_jv=  rset_1.getString("descr");
				  lote22_jv=  rset_1.getString("lote");  
				  cadu2_jv=  rset_1.getString("caducidad");
				     if(juris3_jv.equals(clave2_jv))
					   {
					     lotes2[pos2]=lote22_jv;
						 cad2[pos2]=cadu2_jv;
						 pos2++;
					     cont2++;   
				        }
                 
				    

				  
				  exi2_jv=  rset_1.getString("exis");
				  //costo2_jv=  rset_1.getString("costo");
				  
//variable that get the values from the textfields 
				  clave_jv=  request.getParameter("txtf_cla");
				  descrip_jv=  request.getParameter("txtf_descrip");
				  lote2_jv=  request.getParameter("txtf_lote");  
				  cadu_jv=  request.getParameter("txtf_cad");
                  exis_jv=  request.getParameter("txtf_cr");
				  costo_jv= request.getParameter("txtf_cs");
				  exi_jv= request.getParameter("txtf_exi");
				  
				  //for the top part
				  spss_jv= request.getParameter("txtf_spss");
				
                  med_jv= request.getParameter("txtf_med");
                  pac_jv= request.getParameter("txtf_pac");
                  tu_jv= request.getParameter("txtf_tu");
            cie_jv=request.getParameter("txtf_cie");
			 clave_jv=request.getParameter("txtf_cla");
			 descrip_jv=request.getParameter("txtf_descrip");
}
//out.print("raymond"+cont2+lotes2[0]);
}	

if(but.equals("Mostrar 3"))
{
  //out.print("enter");
  juris4_jv = request.getParameter("txtf_333");
   //customerId2=0;   
   out.print("enter"+juris4_jv);
   Connection conn_1 = 
                  DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
                  Statement stmt_1 = conn_1.createStatement();
                  
                  //cs_jv= request.getParameter("SubCat");
                  ResultSet rset_1 = stmt_1.executeQuery("select * from claves_alm where clave='"+juris4_jv+"'");
				  //ResultSet rset_2 = stmt_1.executeQuery("select * from cla_lotes where clave='"+juris_jv+"'"); 
         /* while(rset_2.next())
				     {
  
		  lote_jv=  rset_1.getString("lote");
                      } 		  
         */
		 
		  while(rset_1.next())
				     {
                  clave3_jv=  rset_1.getString("clave");
				  desc3_jv=  rset_1.getString("descr");
				  lote3_jv=  rset_1.getString("lote");  
				  cadu3_jv=  rset_1.getString("caducidad");
				     if(juris4_jv.equals(clave3_jv))
					   {
					     lotes3[pos3]=lote3_jv;
						 cad3[pos3]=cadu3_jv;
						 pos3++;
					     cont3++;   
				        }
                 
				    

				  
				  exi3_jv=  rset_1.getString("exis");
				  //costo2_jv=  rset_1.getString("costo");
//variables for ger the first row

                  clave_jv=  request.getParameter("txtf_cla");
				  descrip_jv =  request.getParameter("txtf_descrip");
				  lote2_jv=  request.getParameter("txtf_lote");  
				  cadu_jv=  request.getParameter("txtf_cad");
                  exis_jv=  request.getParameter("txtf_cr");
				  costo_jv= request.getParameter("txtf_cs");
				  exi_jv= request.getParameter("txtf_exi");

				  
//variable that get the values from the textfields 
				  clave2_jv=  request.getParameter("txtf_cla2");
				  desc2_jv=  request.getParameter("txtf_desc2");
				  lote22_jv=  request.getParameter("txtf_lote2");  
				  cadu2_jv=  request.getParameter("txtf_cad2");
                  exis2_jv=  request.getParameter("txtf_cr2");
				  costo2_jv= request.getParameter("txtf_cs2");
				  exi2_jv= request.getParameter("txtf_exi2");
				  
				  //for the top part
				  spss_jv= request.getParameter("txtf_spss");
				 
                  med_jv= request.getParameter("txtf_med");
                  pac_jv= request.getParameter("txtf_pac");
                  tu_jv= request.getParameter("txtf_tu");
    cie_jv=request.getParameter("txtf_cie");
	 clave_jv=request.getParameter("txtf_cla");
	  descrip_jv =request.getParameter("txtf_descrip");
}
//out.print("raymond"+cont2+lotes2[0]);
}
if(but.equals("Mostrar Datos"))
     {	
	 lote2_jv=  request.getParameter("txtf_lote");
	 cad2_jv =  request.getParameter("txtf_caduc");
	 clave_jv=request.getParameter("txtf_2");
	 descrip_jv= request.getParameter("txtf_descrip");
   Connection conn_1 = 
                  DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
                  Statement stmt_1 = conn_1.createStatement();                  
                  ResultSet rset_1 = stmt_1.executeQuery("select * from claves_alm where clave='"+clave_jv+"'"); 
		  while(rset_1.next())
				     {
                  clave_jv=  rset_1.getString("clave");
				  descrip_jv=  rset_1.getString("descr");				  						  	 						
				        }
}
 
 	if(but.equals("Modificar"))
     {
	 exi_jv=request.getParameter("txtf_exi");
	 java.util.Calendar currDate = new java.util.GregorianCalendar();
	 ubi_jv=request.getParameter("txtf_ubi");
	 clave_jv=request.getParameter("txtf_2");
	 lote_aux_jv = request.getParameter("txtf_lote_aux");
	 lote2_jv=  request.getParameter("txtf_lote");
	 cad2_jv =  request.getParameter("txtf_caduc");
	 Date fecha1=new Date();
	 int bansicadu =1;
	 SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	 if(!cad2_jv.equals("")){
	 fecha1=df.parse(cad2_jv);
	 int month = currDate.get(currDate.MONTH)+1;
     int month2 = (fecha1.getMonth())+1;	 
	 int difmonth = (month2 - month);
	 
	 int year = currDate.get(currDate.YEAR);
     int year2 = (fecha1.getYear())+1900;
	 int difyear = (year2 - year);
	 
	 //int bansicadu =1;
	 if(difyear==0){
	 	if(difmonth < 6)
			bansicadu=0;		
	 }else if(difyear<0)
	 	bansicadu=0; 
		
	if(difyear>0){
		
		if(difmonth ==0 ){
			if(month2==month);
			else{
			bansicadu=0; 
			}
			}
		}
		//out.print("si o no"+bansicadu);
	 	//out.print("mes"+month);
	    //out.print("num_meses"+difmonth);
		//out.print("meses"+month2);
	}
	 
	 //clave_jv=request.getParameter("txtf_2");
	 descrip_jv= request.getParameter("txtf_descrip");
		 	 Connection conn = 
                  DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
                  Statement stmt = conn.createStatement();				  
                  stmt.execute("commit"); 
 				   
				  //stmt.execute("insert into folio_rec values(null,'morelia')");
                  //stmt.execute("commit"); 

						   
 		 
 			//stmt_fol.execute("update datos_small_fol set status=status+1 where folio_rece='"+folio+"'");
			//update datos_prov_1_0807 set cve_med='0113',descri='BUTILHIOSCINA/metamizol 36grag 10mg/250m',lote='S10820',cadu='30/09/2010',cant='57' where id_rem_prov='275';update datos_inv_cod set clave='mmm',descr='mmm',lote='mmm',cadu='nnnn',cant='nnn' where id_cap_inv='1';
			 System.out.print("Si entra");
			
	 		stmt.execute("update datos_inv_cod set clave='"+clave_jv+"',descr='"+descrip_jv+"',lote='"+lote2_jv+"',cadu='"+cad2_jv+"',cant='"+exi_jv+"',ubi='"+ubi_jv+"' where id_cap_inv='"+eliminar_jv+"'");	
			//update claves_alm set clave='0267',descr='LIDOCAINA, epinefrina sol iny 2% c/50amp',lote='G068255',caducidad='01/06/2010' where clave='0267' and lote='G068255';
				stmt.execute("update claves_alm set clave='"+clave_jv+"',descr='"+descrip_jv+"',lote='"+lote2_jv+"',caducidad='"+cad2_jv+"' where clave='"+clave_jv+"' and lote='"+lote_aux_jv+"'");		 
	 		%>
			<script>			
			 	self.location='captura_InvBCAlmLeo.jsp?id_prov=<%=eliminar_jv%>&hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>';					
			  	alert("Los datos han sido guardados");
  			</script>
  				<%
  				
     }    
%>

<%! public int customerIds=0;
  public int regulaCont2()
      {
                      
             try { 
                           
                  Connection conn_01 = 
                  DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
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
<% java.util.Calendar currDate = new java.util.GregorianCalendar();
   // add 1 to month because Calendar's months start at 0, not 1
   int month = currDate.get(currDate.MONTH)+1;
   int day = currDate.get(currDate.DAY_OF_MONTH);
   int year = currDate.get(currDate.YEAR);
   
   String date=" "+year;
   date= date+"/"+month;
   date= date+"/"+day;  
  // out.println(altaOK);
 
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>:: BASE DE DATOS DE MEDICAMENTOS ::</title>
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
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
.style6 {
	font-size: 14px;
	color: #000033;
	font-weight: bold;
}
.style7 {color: #791424}
-->
</style>
</head>
<body bgcolor="#FFFFFF" onload="fillCategoryMed()">
<script src="scw.js" type="text/javascript"> </script>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr bgcolor="#3366CC">
    <td colspan="3" rowspan="2" bgcolor="#02407A"><div align="left"><img src="gnk_toluca.jpg" alt="Header image" border="0" /></div></td>
    <td height="58" colspan="3" align="center" valign="bottom" nowrap="nowrap" bgcolor="#02407A" id="logo"><div align="left">Modificar Datos del Medicamento <img src="logo-sede.jpg" width="394" height="58" /></div></td>
    <td width="69">&nbsp;</td>
  </tr>

  <tr bgcolor="#3366CC">
    <td height="27" colspan="3" align="center" valign="top" bgcolor="#02407A" id="tagline"><div align="left">CEDIS Le&oacute;n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GNKL Software<span class="style1"> </span></div></td>
    <td width="69">&nbsp;</td>
  </tr>

  <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<!--td height="25" colspan="7" bgcolor="#FFFFFF" id="dateformat"-->&nbsp;&nbsp;
  	  <script language="JavaScript" type="text/javascript">
      //document.write(TODAY);	</script><!--/td -->
  </tr>
 <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

 <tr>
    <td width="165" valign="top" bgcolor="#FFFFFF">
	
 	 <br />
  	&nbsp;<br />
  	&nbsp;<br />
  	&nbsp;<br /> 	</td>
    <td>&nbsp;</td>
    <td colspan="2" valign="top"><img src="mm_spacer.gif" alt="" width="305" height="1" border="0" />
	  <form action="modifica_inv_alm.jsp?id_prov=<%=eliminar_jv%>&hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>" method="post" name="form" onSubmit="javascript:return ValidateAbas(this)">

    
        <!--onSubmit="javascript:return ValidateFormCant(this)"-->
    
    <table width="704" height="71" border="1" bordercolor="#7F1023">
      <tr>
        <td width="747"><p class="style6">INGRESE LOS DATOS</p>
          <table width="696" border="0">
            <%
  			Connection conn__001 = DriverManager.getConnection("jdbc:mysql://localhost/gnk_ubi");
  			Statement stmt__001 = conn__001.createStatement();  
  			ResultSet rset__001=null;
  			//select distinct cve_med,descri,lote,cadu,cant,id_rem_prov from datos_prov_1_0807 where id_rem_prov='275'
  				rset__001=stmt__001.executeQuery("select distinct clave,descr,lote,cadu,ubi,cant from datos_inv_cod where id_cap_inv='"+eliminar_jv+"'");
  			
  //out.print("clave"+folgnk_jv);
   			while(rset__001.next()) 
                  {
				  	clave_jv=rset__001.getString("clave");
					descrip_jv=rset__001.getString("descr");
					lote2_jv=rset__001.getString("lote");
					lote_aux_jv=rset__001.getString("lote");
					cad2_jv=rset__001.getString("cadu");
					ubi_jv=rset__001.getString("ubi");
					exi_jv=rset__001.getString("cant");		   
				  }
%>
            <tr>
              <td width="101" height="38" class="bodyText">CLAVE:</td>
              <td colspan="2"><input name="txtf_2" type="text" size="50" onkeypress="return handleEnter(this, event)" value="<%=clave_jv%>" onchange="toUppercaseCve();" readonly="true"/>
                  <label></label></td>
              <td width="33">&nbsp;</td>
            </tr>
            <tr>
              <td class="bodyText">DESCRIPCI&Oacute;N:</td>
              <td colspan="2"><input name="txtf_descrip" type="text" size="50" onkeypress="return handleEnter(this, event)" value="<%=descrip_jv%>" readonly="true"/></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="bodyText">LOTE:</td>
              <td colspan="2"><input name="txtf_lote_aux" type="hidden" value="<%=lote_aux_jv%>"/>
                  <input name="txtf_lote" type="text" size="50" value="<%=lote2_jv%>" onchange="toUppercaseLote();" onkeypress="return handleEnter(this, event)"/></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="40" class="bodyText">CADUCIDAD:</td>
              <td colspan="2"><label>
                <input type='text' name='txtf_caduc' id='txtf_caduc' title='DD/MM/AAAA' size='10' maxlength='10' onclick='scwShow(this, event);' value="<%=cad2_jv%>"/>
                </label>
                  <img src="ico_calendario.gif" width="27" height="26" border="0" onclick="scwShow(scwID('txtf_caduc'),event);"/> </td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="38" class="bodyText">UBICACI&Oacute;N:</td>
              <td colspan="2"><label>
                <input type='text' name='txtf_ubi' id='txtf_ubi' title='DD/MM/AAAA' size='10' maxlength='10' value="<%=ubi_jv%>"/>
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="35" class="bodyText">CANTIDAD:</td>
              <td colspan="2"><label>
                <input type='text' name='txtf_exi' id='txtf_exi' size='10' maxlength='10' value="<%=exi_jv%>"/>
              </label></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="21" class="bodyText"><label></label></td>
              <td width="249" height="21"><input name="Submit" type="submit" class="subHeader" value="Modificar"/></td>
              <td width="234" height="21"><a href='captura_InvBCAlmLeo.jsp?id_prov=<%=eliminar_jv%>&amp;hora_ini_vi=<%=hora_ini_jv%>&amp;equi_vi=<%=equipo_jv%>&amp;integran_vi=<%=integrantes_jv%>' class="style7">Regresar a Captura de Remisi&oacute;n</a></td>
              <td height="21">&nbsp;</td>
            </tr>
          </table>          </td>
      </tr>
    </table>
    <p class="style6">&nbsp;</p>
    <table width="877" border="0">
	
  <tr>
    <td colspan="3">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="73">&nbsp;</td>
    <td width="240">&nbsp;</td>
    <td width="105">&nbsp;</td>
    <td width="175">&nbsp;</td>
    <td width="67">&nbsp;</td>
    <td width="83">&nbsp;</td>
    <td width="88">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
  </tr>
  <tr>
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
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
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
  </tr>
  <tr>
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
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
	</table>
	
    
    <p><br />
      <br />
    </p>
	  </form>    </td>
    <td width="50">&nbsp;</td>
        <td width="225" valign="top"><br />
		&nbsp;<br />
		<table border="0" cellspacing="0" cellpadding="0" width="190">
			<tr>
			<td colspan="3" class="subHeader" align="center">&nbsp;</td>
			</tr>

			<tr>
			<td width="40"><img src="mm_spacer.gif" alt="" width="40" height="1" border="0" /></td>
			<td width="110" id="sidebar" class="smallText"><br />
			<p><br />
			  .<br />
			<a href="javascript:;"></a></p>

			<p><br />
			</p>
			 <br />
			&nbsp;<br />
			&nbsp;<br />			</td>
			<td width="40">&nbsp;</td>
			</tr>
	</table>	</td>
	<td width="69">&nbsp;</td>
  </tr>
  <tr>
    <td width="165">&nbsp;</td>
    <td width="50">&nbsp;</td>
    <td width="6">&nbsp;</td>
    <td width="462">&nbsp;</td>
    <td width="50">&nbsp;</td>
    <td width="225">&nbsp;</td>
	<td width="69">&nbsp;</td>
  </tr>
</table>
<img src="mm_spacer.gif" alt="" width="50" height="1" border="0" />
</body>
</html>
