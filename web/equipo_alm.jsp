<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% Class.forName("org.gjt.mm.mysql.Driver");
     int tam=0,tam2=0,x1=0;
     String cad1[]=new String[1000];  //array for show clients 
     String arr[]= new String[5000];     //array for the 
	 String lotes[]= new String[5000];
	 String cad[]= new String[5000];
	 lotes[0]="";
	 cad[0]="";
     String name="";
     String service_jv="";
	 String integrantes_jv="";
	 String lugar_jv="";
	 String hora_ini_jv="";
	 String equipo_jv="";
	 int pos=0;
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
	 String unis_jv="";
     String cs_jv="";
	 String lotes2_jv="";
	 String h_cat_jv="";
	 
	 String check=request.getParameter("txtf_5");
	 int c=0;
	
	 mail[0]="lasalle_tur@yahoo.com";
     String val="h";
	 String user="h";
	 //variables para mostrar en campos
	    String clave_jv= "";
		String desc_jv=  "";
	    String lote_jv= "";
		String cadu_jv= "";
		String exis_jv= "";
		String costo_jv= "";
		String encar3_jv="";
int cont=1;
//Rutina para obtener las claves 
	         Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost/gnk");
        Statement stmt1 = conn1.createStatement();
        ResultSet rset1=stmt1.executeQuery("SELECT clave FROM clav1 order by (clave+0)");
          while (rset1.next()) 
                  { 
                    
                    cad1[tam2]=rset1.getString("clave");     
                     tam2++;
                   }

	 
	 
	 

try{
        altaOK=Integer.parseInt(request.getParameter("altaok"));   
       }catch(Exception e){ System.out.print("Doesn't make the altaOK"); }
	   
   try { 
        but=""+request.getParameter("Submit2");
        //altaOK="no";
    }catch(Exception e){System.out.print("not");}
	
	if(but.equals("Mostrar"))
{

 

  juris_jv= request.getParameter("Category");
  unis_jv= request.getParameter("SubCat");
 out.print("Mostrar"+juris_jv+"Uni"+unis_jv);
  //out.print("Juris"+juris_jv+"Unidad"+unis_jv);
   //customerId2=0;   
   Connection conn_1 = 
                  DriverManager.getConnection("jdbc:mysql://localhost/gnk");
                  Statement stmt_1 = conn_1.createStatement();
                  
                  //cs_jv= request.getParameter("SubCat");
           ResultSet rset_1 = stmt_1.executeQuery("select * from test_cve where unidad='"+unis_jv+"' and juris='"+juris_jv+"' ");
				  //select clave from test_cve where juris='DOLORES HIDALGO' and unidad='DOLORES HIDALGO'
				  //ResultSet rset_2 = stmt_1.executeQuery("select * from cla_lotes where clave='"+juris_jv+"'"); 
         /* while(rset_2.next())
				     {
  
		  lote_jv=  rset_1.getString("lote");
                      } 		  
         */
		 
		  while(rset_1.next())
				     {
                  clave_jv=  rset_1.getString("clave");
				  desc_jv=  rset_1.getString("unidad");
				  lote_jv=  rset_1.getString("juris");  
				  				  
				  

}
//out.print("raymond"+cont+lotes[0]);
}				
 
 	if(but.equals("Capturar Inventario"))
     {
	 integrantes_jv=request.getParameter("txtf_cla");
	 lugar_jv=request.getParameter("txtf_lug");
	 hora_ini_jv=request.getParameter("txtf_hf");
	 equipo_jv=request.getParameter("txtf_Equ");
	 %>
		<script>			
		 	self.location='captura_InvBCAlmLeo.jsp?hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>&lugar_vi=<%=lugar_jv%>';			
		</script>
	<%		 	 	 	                 
     }    
%>

<%! public int customerIds=0;
  public int regulaCont2()
      {
                      
             try { 
                           
                  Connection conn_01 = 
                  DriverManager.getConnection("jdbc:mysql://localhost/gnk");
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

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>:: INVENTARIO INICIAL ::</title>
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
-->
</style>
</head>
<body bgcolor="#C0DFFD" onload="hora_Inv()">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#3366CC">
    <td colspan="3" rowspan="2"><div align="center"><span class="style1"><strong><img src="GNKL_Small.JPG" alt="Header image"  border="0" /></strong></span></div></td>
    <td height="63" colspan="3" id="logo" valign="bottom" align="center" nowrap="nowrap"><div align="left">Sistema de Inventarios  </div></td>
    <td width="69">&nbsp;</td>
  </tr>

  <tr bgcolor="#3366CC">
    <td height="64" colspan="3" id="tagline" valign="top" align="center"><div align="justify" class="style1"><br />
      CAPTURA DE INTEGRANTES DE EQUIPO </div></td>
	<td width="69">&nbsp;</td>
  </tr>

  <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<td colspan="7" id="dateformat" height="25">&nbsp;&nbsp;<script language="JavaScript" type="text/javascript">
      document.write(TODAY);	</script>	</td>
  </tr>
 <tr>
    <td colspan="7" bgcolor="#003366"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

 <tr>
    <td width="165" valign="top" bgcolor="#E6F3FF">
	
 	 
 	<div align="center"><br />
 	  &nbsp;<img src="gnk_toluca.jpg" /><img src="savi1.jpg"  /><br />
 	  &nbsp;<br />
 	  <br />
 	  <strong>Calle 1 Nte<br />
 	    Parque Industrial Toluca 2000 <br />
 	    CP 50200<br />
 	    Tel 01 800 465 2222<br />
 	    <a href="http://www.gnklogistica.com.mx">www.gnklogistica.com.mx</a></strong><br /> 	
    </div></td>
    <td width="50"><img src="mm_spacer.gif" alt="" width="50" height="1" border="0" /></td>
    <td colspan="2" valign="top"><img src="mm_spacer.gif" alt="" width="305" height="1" border="0" /><br />
	&nbsp;<br />
	&nbsp;<br />
	<table border="0" cellspacing="0" cellpadding="0" width="647">
        <tr>
          <td class="pageName">Introduzca los datos</td>
		</tr>

		<tr>
          <td class="bodyText">		 </td>
        </tr>
      </table>
	  <br />
	  <form action="equipo_alm.jsp" method="post" name="form" >

     <!--onSubmit="javascript:return ValidateFormCant(this)"-->
    <table width="764" border="1">
      
      <tr>
        <td colspan="2">Hora inicio &nbsp;:
          <label>
          <input type="text" name="txtf_hf" id="txtf_hf" size="10" readonly="true"/>
          </label>          &nbsp;&nbsp;
          <label></label>
          &nbsp;
          <label></label>          </td>
        </tr>
      <tr>
        <td>No de Equipo :</td>
        <td><label>
          <input type="text" name="txtf_Equ" />
        </label>
           <select name="sclt_Equ" class="bodyText" onchange="putEqu(this.form);">
          <option>--Selecionar No. Equipo--</option>
		  <option value="AL-RACK-AB-1-4">AL-RACK-AB-1-4</option>
			<option value="AL-RACK-AB-5-8">AL-RACK-AB-5-8</option>
			<option value="AL-RACK-AB-9-12">AL-RACK-AB-9-12</option>
			<option value="AL-RACK-AB-13-16">AL-RACK-AB-13-16</option>
			<option value="AL-RACK-AB-17-20">AL-RACK-AB-17-20</option>
			<option value="AL-RACK-AB-21-24">AL-RACK-AB-21-24</option>
			<option value="AL-RACK-AB-25-28">AL-RACK-AB-25-28</option>
			<option value="AL-RACK-AB-29-32">AL-RACK-AB-29-32</option>
			<option value="AL-RACK-AB-33-36">AL-RACK-AB-33-36</option>
			<option value="AL-RACK-AB-37-40">AL-RACK-AB-37-40</option>
			<option value="AL-RACK-AB-41-44">AL-RACK-AB-41-44</option>
			<option value="AL-RACK-AB-45-48">AL-RACK-AB-45-48</option>
			<option value="AL-RACK-CD-1-4">AL-RACK-CD-1-4</option>
			<option value="AL-RACK-CD-5-8">AL-RACK-CD-5-8</option>
			<option value="AL-RACK-CD-9-12">AL-RACK-CD-9-12</option>
			<option value="AL-RACK-CD-13-16">AL-RACK-CD-13-16</option>
			<option value="AL-RACK-CD-17-20">AL-RACK-CD-17-20</option>
			<option value="AL-RACK-CD-21-24">AL-RACK-CD-21-24</option>
			<option value="AL-RACK-CD-25-28">AL-RACK-CD-25-28</option>
			<option value="AL-RACK-CD-29-32">AL-RACK-CD-29-32</option>
			<option value="AL-RACK-CD-33-36">AL-RACK-CD-33-36</option>
			<option value="AL-RACK-CD-37-40">AL-RACK-CD-37-40</option>
			<option value="AL-RACK-EF-1-4">AL-RACK-EF-1-4</option>
			<option value="AL-RACK-EF-5-8">AL-RACK-EF-5-8</option>
			<option value="AL-RACK-EF-9-12">AL-RACK-EF-9-12</option>
			<option value="AL-RACK-EF-13-16">AL-RACK-EF-13-16</option>
			<option value="AL-RACK-EF-17-20">AL-RACK-EF-17-20</option>
			<option value="AL-RACK-EF-21-24">AL-RACK-EF-21-24</option>
			<option value="AL-RACK-EF-25-28">AL-RACK-EF-25-28</option>
			<option value="AL-RACK-EF-29-32">AL-RACK-EF-29-32</option>
			<option value="AL-RACK-EF-33-35">AL-RACK-EF-33-35</option>
			<option value="AL-RACK-EF-36-38">AL-RACK-EF-36-38</option>
			<option value="AL-RACK-GH-1-4">AL-RACK-GH-1-4</option>
			<option value="AL-RACK-GH-5-8">AL-RACK-GH-5-8</option>
			<option value="AL-RACK-GH-9-12">AL-RACK-GH-9-12</option>
			<option value="AL-RACK-GH-13-16">AL-RACK-GH-13-16</option>
			<option value="AL-RACK-GH-17-20">AL-RACK-GH-17-20</option>
			<option value="AL-RACK-GH-21-24">AL-RACK-GH-21-24</option>
			<option value="AL-RACK-GH-25-28">AL-RACK-GH-25-28</option>
			<option value="AL-RACK-GH-29-32">AL-RACK-GH-29-32</option>
			<option value="AL-RACK-GH-33-35">AL-RACK-GH-33-35</option>
			<option value="AL-RACK-GH-36-38">AL-RACK-GH-36-38</option>
			<option value="AL-RACK-IJ-1-4">AL-RACK-IJ-1-4</option>
			<option value="AL-RACK-IJ-5-8">AL-RACK-IJ-5-8</option>
			<option value="AL-RACK-IJ-9-12">AL-RACK-IJ-9-12</option>
			<option value="AL-RACK-IJ-13-16">AL-RACK-IJ-13-16</option>
			<option value="AL-RACK-IJ-17-20">AL-RACK-IJ-17-20</option>
			<option value="AL-RACK-IJ-21-24">AL-RACK-IJ-21-24</option>
			<option value="AL-RACK-IJ-25-28">AL-RACK-IJ-25-28</option>
			<option value="AL-RACK-IJ-29-32">AL-RACK-IJ-29-32</option>
			<option value="AL-RACK-IJ-33-36">AL-RACK-IJ-33-36</option>
			<option value="AL-RACK-IJ-37-40">AL-RACK-IJ-37-40</option>
			<option value="AL-RACK-KL-1-4">AL-RACK-KL-1-4</option>
			<option value="AL-RACK-KL-5-8">AL-RACK-KL-5-8</option>
			<option value="AL-RACK-KL-9-12">AL-RACK-KL-9-12</option>
			<option value="AL-RACK-KL-13-16">AL-RACK-KL-13-16</option>
			<option value="AL-RACK-KL-17-20">AL-RACK-KL-17-20</option>
			<option value="AL-RACK-KL-21-24">AL-RACK-KL-21-24</option>
			<option value="AL-RACK-KL-25-28">AL-RACK-KL-25-28</option>
			<option value="AL-RACK-KL-29-32">AL-RACK-KL-29-32</option>
			<option value="AL-RACK-KL-33-36">AL-RACK-KL-33-36</option>
			<option value="AL-RACK-KL-37-40">AL-RACK-KL-37-40</option>
			<option value="AL-RACK-KL-41-44">AL-RACK-KL-41-44</option>
				<option value="F-A">F-A</option>
				<option value="F-B">F-B</option>
				<option value="F-C">F-C</option>
				<option value="F-D">F-D</option>
				<option value="F-E">F-E</option>
				<option value="F-F">F-F</option>
				<option value="F-G">F-G</option>
				<option value="F-H">F-H</option>
				<option value="F-I">F-I</option>
				<option value="F-J">F-J</option>
				<option value="F-K">F-K</option>
				<option value="F-L">F-L</option>
				<option value="F-M">F-M</option>
				<option value="F-N">F-N</option>
				<option value="F-O">F-O</option>
				<option value="F-P">F-P</option>
				<option value="F-Q">F-Q</option>
				<option value="F-R">F-R</option>
				<option value="F-S">F-S</option>
				<option value="F-T">F-T</option>
				<option value="F-U">F-U</option>
				<option value="F-V">F-V</option>
				<option value="F-W">F-W</option>
				<option value="F-X">F-X</option>
				<option value="F-Y">F-Y</option>
				<option value="F-Z">F-Z</option>
				<option value="F-AA">F-AA</option>
				<option value="F-AB">F-AB</option>
				<option value="F-AC">F-AC</option>
				<option value="F-AD">F-AD</option>
				<option value="F-AE">F-AE</option>
				<option value="F-AF">F-AF</option>
				<option value="F-AG">F-AG</option>
				<option value="F-AH">F-AH</option>
				<option value="F-AI">F-AI</option>
				<option value="F-AJ">F-AJ</option>
				<option value="F-AK">F-AK</option>
				<option value="F-AL">F-AL</option>
				<option value="F-AM">F-AM</option>
				<option value="F-AN">F-AN</option>
				<option value="F-AO">F-AO</option>
				<option value="DENTAL1">DENTAL1</option>
				<option value="DENTAL2">DENTAL2</option>

			
		   <option value="JERINGAS"> JERINGAS</option>
		   
                  </select></td>
      </tr>
      
      <tr>
        <td>Lugar de Elaboración :</td>
        <td><label>
          <input type="text" name="txtf_lug" value="BODEGA" />
        </label></td>
      </tr>
      
      <tr>
        <td>Integrantes&nbsp;:</td>
        <td><input name="txtf_cla" type="text" size="50" onkeypress="return handleEnter(this, event)"/>
           <- Capture Integrantes del Equipo </td>
      </tr>
      
      
      <tr>
        <td>&nbsp;</td>
        <td><input name="Submit2" type="submit" class="subHeader" value="Capturar Inventario"/></td>
      </tr>
    </table>
    <p><br />
      <br />
    </p>
	  </form>    </td>
    <td width="50"><img src="mm_spacer.gif" alt="" width="50" height="1" border="0" /></td>
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
</body>
</html>
