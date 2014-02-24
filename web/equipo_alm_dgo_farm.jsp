<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" 
import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date" errorPage="" session="true"%>
<%
HttpSession sesion = request.getSession(); 
//out.print("Id de sesion: "+sesion.getId());
String vali="", user1="",id_sesion="";


//out.print(sesion.getAttribute("valida"));
if (sesion.getAttribute("valida")!=null){
	vali=(String)sesion.getAttribute("valida");
	user1=(String)sesion.getAttribute("nombre");
        id_sesion=(String)sesion.getAttribute("id");
	//out.print(val+"---"+user);
}

//out.print(user);
if(!vali.equals("valida")){
	//out.print("regresa al index");
	%>
    <script>self.location='index.jsp';</script>
    <%
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String usu_jv="";
   try {
		usu_jv = request.getParameter("usuario"); 
		//only = request.getParameter("id_only");      			   
} catch (Exception e) { }


%>
<% 
/*----------------------------------------------------------------------------------------------------------------------
Nombre del Archivo: equipo_alm.jsp
Fecha:2010
Autor: RHW
  ----------------------------------------------------------------------------------------------------------------------*/

Class.forName("org.gjt.mm.mysql.Driver");
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
	         Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost/dgo");
        Statement stmt1 = conn1.createStatement();
     /*   ResultSet rset1=stmt1.executeQuery("SELECT clave FROM clav1 order by (clave+0)");
          while (rset1.next()) 
                  { 
                    
                    cad1[tam2]=rset1.getString("clave");     
                     tam2++;
                   }*/

	 
	 
	 

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
                  DriverManager.getConnection("jdbc:mysql://localhost/dgo");
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
		 	self.location='consulta2_inv2_farm.jsp?hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>&lugar_vi=<%=lugar_jv%>&usuario=<%=usu_jv%>';			
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
.style2 {
	color: #000066;
	font-size: 16px;
	font-family: Georgia, "Times New Roman", Times, serif;
}
.style3 {color: #333333; font-size: 16px; font-family: Georgia, "Times New Roman", Times, serif; font-weight: bold; }
.style6 {line-height:20px; margin-top:0px; font: 11px Verdana, Arial, Helvetica, sans-serif;}
.style7 {color: #333333}
.style9 {color: #003300}
.style10 {color: #333333; font-weight: bold; }
.style11 {color: #333333; font: bold 10px Verdana, Arial, Helvetica, sans-serif; }
-->
</style>
</head>
<body bgcolor="#ffffff" onload="hora_Inv()">
<table width="94%" border="0" cellspacing="0" cellpadding="0">
  <tr bgcolor="#3366CC">
    <td colspan="3" rowspan="3" bgcolor="#FFFFFF"><a href="ubi_dgo.jsp">Regresar a Menú</a></td>
    <td height="46" colspan="3" align="center" valign="bottom" nowrap="nowrap" bgcolor="#FFFFFF" id="logo"><img src="imagenes/logo_conjun.jpg"  /></td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr bgcolor="#3366CC">
    <td height="40" colspan="3" align="center" valign="middle" nowrap="nowrap" background="fondo.jpg" bgcolor="#FFFFFF" id="logo"><div align="center">Sistema de Inventarios  </div></td>
    <td width="43" background="fondo.jpg">&nbsp;</td>
  </tr>

  <tr bgcolor="#3366CC">
    <td height="19" colspan="3" align="center" valign="top" bgcolor="#FFFFFF" id="tagline"><div align="justify" class="style1">
      <div align="center"><span class="style9">CAPTURA DE INTEGRANTES DE EQUIPO </span></div>
    </div></td>
	<td width="43" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>

  <tr>
    <td colspan="7" bgcolor="#003300"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0" /></td>
  </tr>

  <tr bgcolor="#CCFF99">
  	<!--td colspan="7" id="dateformat" height="25">&nbsp;&nbsp;<script language="JavaScript" type="text/javascript">
      document.write(TODAY);	</script>	</td-->
  </tr>
 <tr>
    <td colspan="7" bgcolor="#003366"></td>
  </tr>

 <tr>
    <td width="197" valign="top" bgcolor="#E6F3FF">
	
 	 
 	<div align="center"><br />
 	  &nbsp;<br />
 	  <span class="bodyText">&nbsp;<br />
 	  <br />
 	  </span><strong><br />
 	    <a href="http://www.gnklogistica.com.mx" >www.gnklogistica.com.mx</a></strong><br /> 	
    </div></td>
    <td width="4" class="style2">&nbsp;</td>
    <td colspan="2" valign="top" class="style2"><form action="equipo_alm_dgo_farm.jsp?usuario=<%=usu_jv%>" method="post" name="form" >

     
    <table width="703" height="43" border="1" align="center" bordercolor="#003300">
      <tr>
        <td width="764" height="38"><p align="left" class="style3">Introduzca los datos
          <table width="695" border="0" align="left">
            <tr>
              <td height="28" colspan="2" class="bodyText style7"><strong>Hora inicio  &nbsp;:</strong>
                <label>
                  <input type="text" name="txtf_hf" id="txtf_hf" size="10" readonly="true"/>
                  </label>
                &nbsp;&nbsp;
                <label></label>
                &nbsp;
                <label></label></td>
            </tr>
            <tr>
              <td width="152" class="bodyText"><div align="left" class="style10">No de Equipo :</div></td>
              <td width="533" height="28" class="bodyText style7"><label>
                <input type="text" name="txtf_Equ" />
                </label>
                  <select name="sclt_Equ" class="style6" onchange="putEqu(this.form);">
                    <option>--Seleccionar No. Equipo--</option>
					<option >AREA SURTIDO</option>
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
<option value="BM-33">BM-33</option


                    
                ></select></td>
            </tr>
            <tr>
              <td class="bodyText"><div align="left" class="style10">Lugar de Elaboraci&oacute;n :</div></td>
              <td height="28" class="bodyText"><span class="style7">
                <label>
                <input type="text" name="txtf_lug" value="AREA DE SURTIDO" />
                </label>
              </span></td>
            </tr>
            <tr>
              <td class="bodyText"><div align="left" class="style10">Integrantes&nbsp;:</div></td>
              <td height="28" class="bodyText style7"><input name="txtf_cla" type="text" size="50" onkeypress="return handleEnter(this, event)"/>
                &lt;- Capture Integrantes del Equipo </td>
            </tr>
            <tr>
              <td><span class="style7"></span></td>
              <td height="28"><input name="Submit2" type="submit" class="style11" value="Capturar Inventario"/></td>
            </tr>
          </table>          </td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p><br />
      <br />
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    </form>    </td>
    <td width="4">&nbsp;</td>
        <td width="45" valign="top"><br />
		&nbsp;<br />
		<table border="0" cellspacing="0" cellpadding="0" width="45">
			<tr>
			<td colspan="3" class="subHeader" align="center">&nbsp;</td>
			</tr>

			<tr>
			<td width="16">&nbsp;</td>
			<td width="18" id="sidebar" class="smallText"><br />
			<p><br />
			<br />
			<a href="javascript:;"></a></p>

			<p><br />
			</p>
			 <br />
			&nbsp;<br />
			&nbsp;<br />			</td>
			<td width="156">&nbsp;</td>
			</tr>
	</table>	</td>
	<td width="43">&nbsp;</td>
  </tr>
  <tr>
    <td width="197">&nbsp;</td>
    <td width="4">&nbsp;</td>
    <td width="8">&nbsp;</td>
    <td width="729">&nbsp;</td>
    <td width="4">&nbsp;</td>
    <td width="45">&nbsp;</td>
	<td width="43">&nbsp;</td>
  </tr>
</table>
</body>
</html>
