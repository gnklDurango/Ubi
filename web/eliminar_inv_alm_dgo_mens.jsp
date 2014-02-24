<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%

String lugar_jv="";
   try {
		lugar_jv = request.getParameter("lugar_vi"); 
		//only = request.getParameter("id_only");      			   
} catch (Exception e) { }


String usu_jv="";
   try {
		usu_jv = request.getParameter("usuario"); 
		//only = request.getParameter("id_only");      			   
} catch (Exception e) { }

String eliminar_jv="";
 	  try {
       		eliminar_jv = request.getParameter("id_prov");       			   
	  } catch (Exception e) { }

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
	  
	 
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<form action="eliminar_inv_alm_dgo_mens.jsp?id_prov=<%=eliminar_jv%>&hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>" method="post" name="form" onSubmit="javascript:return ValidateFar1(this)">


<script>
var entrar =  confirm("¿DESEAS ELIMINARLA?");
if(entrar==true)
{
	
	self.location='eliminar_inv_alm_dgo.jsp?id_prov=<%=eliminar_jv%>&hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>&lugar_vi=<%=lugar_jv%>&usuario=<%=usu_jv%>';
	
}
else
{
	alert("DATOS NO ELIMINADOS");
	
	self.location='consulta2_inv2.jsp?id_prov=<%=eliminar_jv%>&hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>&usuario=<%=usu_jv%>'
	
}

</script>


</form>
</body>

</html>
