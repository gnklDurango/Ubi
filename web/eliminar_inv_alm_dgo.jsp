<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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
Nombre del Archivo: eliminar_inv_alm.jsp
Fecha:2010
Autor: RHW
  ----------------------------------------------------------------------------------------------------------------------*/
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
	  
	  ResultSet rset =null;
    Statement stmt = null ;
	Class.forName("org.gjt.mm.mysql.Driver");
	 Connection conn_001 = DriverManager.getConnection("jdbc:mysql://localhost/dgo");
 stmt = conn_001.createStatement();
	
	rset = stmt.executeQuery("SELECT STR_TO_DATE('"+date+"', '%d/%m/%Y')"); 
                    while(rset.next()){
                    date= rset.getString("STR_TO_DATE('"+date+"', '%d/%m/%Y')");
					}	

%>
<%!
String clave1_jv="",descrip1_jv="",lote21_jv="",cad21_jv="",ubi1_jv="",cajas1_jv="",pzas1_jv="",resto1_jv="",exi1_jv="";
int correct1=0;

public int ban=0;
public void eliminarReg(String id_inv,int ban) {
  
  System.out.print("valor"+id_inv);
  //int aux=0;
 //aux=Integer.parseInt(request.getParameter("id_dat_aux"));
 if(ban==1){ 
 System.out.print("dato eliminado"+id_inv);
 String idDS="0";
 idDS=id_inv;
 
 //veces=1;
        ResultSet rset__002=null;
	Statement stmt__001 = null ;
	ResultSet rset_elimDS =null;
        Statement stmt_elimDS =null;
	try {
			
     		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/dgo");         
     		        stmt_elimDS = conn.createStatement();
			stmt__001 = conn.createStatement();
			System.out.print("id2"+idDS); 
			
			rset__002=stmt__001.executeQuery("select clave,descr,lote,cadu,ubi,cant,cajas,piezas,resto from datos_inv_cod where id_cap_inv='"+id_inv+"'");
  			
  //out.print("clave"+folgnk_jv);
   			while(rset__002.next()) 
                  {
				 	clave1_jv=rset__002.getString("clave");
				        descrip1_jv=rset__002.getString("descr");
					lote21_jv=rset__002.getString("lote");
				//lote_aux1_jv=rset__002.getString("lote");
					cad21_jv=rset__002.getString("cadu");
					ubi1_jv=rset__002.getString("ubi");
					exi1_jv=rset__002.getString("cant");	
				        cajas1_jv=rset__002.getString("cajas");	
					pzas1_jv=rset__002.getString("piezas");
					resto1_jv=rset__002.getString("resto");
					
				  }
		
          		  
     						  		
		stmt_elimDS.executeUpdate(" DELETE FROM datos_inv_cod WHERE id_cap_inv='"+id_inv+"'"); 
                        System.out.print("Entra");
			
		while(rset_elimDS.next()){			
			rset_elimDS.deleteRow();
		}
		//conn.close();

	}catch(Exception e){
        e.printStackTrace();
        
        }				  
  
  }
}%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<form action="eliminar_inv_alm_dgo.jsp?id_prov=<%=eliminar_jv%>&hora_ini_vi=<%=hora_ini_jv%>&equi_vi=<%=equipo_jv%>&integran_vi=<%=integrantes_jv%>" method="post" name="form" onSubmit="javascript:return ValidateFar1(this)">
<%eliminarReg(eliminar_jv,1);%>
<%
if(!(eliminar_jv.equals("0"))){
	
	correct1=4;
		    
	
	stmt.execute("insert into eliminar_dgo values ('"+usu_jv+"','"+correct1+"','"+date+"','"+clave1_jv+"','"+descrip1_jv+"','"+lote21_jv+"','"+cad21_jv+"','"+ubi1_jv+"','"+cajas1_jv+"','"+pzas1_jv+"','"+resto1_jv+"','"+exi1_jv+"',0)");
	
	%>
<script>
alert("El dato ha sido Eliminado");
self.location='consulta2_inv2.jsp'
</script>
<%}else{%><script>
self.location='consulta2_inv2.jsp'
</script>
<%}%>

</form>
</body>

</html>
