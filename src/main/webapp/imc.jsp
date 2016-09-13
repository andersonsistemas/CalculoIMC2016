<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="header.html" %>
<title>Cálculo IMC</title>
</head>
<body>
  <div class="container">
				    
				   <form class="form-horizontal">
				<fieldset>
				
				<!-- Form Name -->
				<legend>Cálculo de IMC</legend>
				
				<!-- Multiple Radios -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="radios">Selecione Uma Opção</label>
				  <div class="col-md-4">
				  <div class="radio">
				    <label for="radios-0">
				      <input type="radio" name="radios" id="radios-0" value="0">
				      Masculino
				    </label>
					</div>
				  <div class="radio">
				    <label for="radios-1">
				      <input type="radio" name="radios" id="radios-1" value="1">
				      Feminino
				    </label>
					</div>
				  </div>
				</div>
				<br>
				
		<!--  	
			<select name="sex"> 
   				<option value="0">Masculino
			   	<option value="1">Feminino 
			</select> 
			
			-->
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">Sua Altura</label>  
				  <div class="col-md-4">
				  <input id="number" name="altura" type="number" min="0" max="9999" step="0.01" placeholder="" class="form-control input-md">
				    
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="textinput">Seu Peso</label>  
				  <div class="col-md-4">
				  <input id="textinput" name="peso" type="number" min="0" max="9999" step="0.1" placeholder="" class="form-control input-md">
				    
				  </div>
				</div>
				
				<!-- Button (Double) -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="button1id"></label>
				  <div class="col-md-8">
				  	<input type="submit" class="btn btn-success" value="Calcular"> </input>
				  	<input type="reset" class="btn btn-info" value="Limpar"> </input>
				    
				  </div>
				</div>
				
				</fieldset>
				</form>
   
    
    <%
    String sexoStr = request.getParameter("radios");  
    String alturaStr = request.getParameter("altura");
	String pesoStr = request.getParameter("peso");
		alturaStr = (alturaStr == null ? "0" : alturaStr);
      	pesoStr = (pesoStr == null ? "0" : pesoStr);
      	sexoStr = (sexoStr == null ? "3" : sexoStr);
      double altura = 0;
      double peso = 0;
      int sexo = 0;
      try {
        altura = Double.parseDouble(alturaStr);
        peso = Double.parseDouble(pesoStr);
        sexo =Integer.parseInt(sexoStr);
        
      } catch (Exception e) {
      }
      double imc = peso/(altura*altura);
      
      
      switch (sexo)
	      { 
	      case 0: 
	    	  if (altura == 0 || peso == 0)
	 	     	{%><div class="alert alert-danger" role="alert">Informe dados Válidos!</div><%}
	    	  else
	    	  {
	    	  	double pesoIdeal=(altura*altura)*20.7;
		    	  if(imc<20.7)
			    	  {%><div class="alert alert-warning" role="alert">Abaixo do Peso.</div><br><%}
			      else if(imc>=20.7&&imc<26.4)
			     	 {%><div class="alert alert-sucess" role="alert">Peso Normal.</div><%}
			      else if(imc>=26.4&&imc<27.8)
			      	{%><div class="alert alert-success" role="alert">Marginalmente acima do Peso.</div><%}
			      else if(imc>=27.8&&imc<31.1)
			       {%><div class="alert alert-warning" role="alert">Acima do peso Ideal.</div><%}
			      else if(imc>=31.1)
			        {%><div class="alert alert-danger" role="alert">Obeso.</div><%}
	    	  }  
		    	  break;
	      	case 1:
	      		if (altura == 0 || peso == 0)
	 	     	{%><div class="alert alert-danger" role="alert">Informe dados Válidos!</div><%}
	    	  	else 
		    	  	{
		      			double pesoIdeal=(altura*altura)*19.1;	
			    	  	if(imc<19.1)
			    	 		 {%><div class="alert alert-warning" role="alert">Abaixo do Peso.</div><%}
			    		 else if(imc>=19.1&&imc<25.8)
			    		 {%><div class="alert alert-success" role="alert">Peso Normal.</div><%}
			    		    else if(imc>=25.8&&imc<27.3)
			    		      	{%><div class="alert alert-success" role="alert">Marginalmente acima do Peso.</div><%}
			    		      else if(imc>=27.3&&imc<32.3)
			    		      		{%><div class="alert alert-warning" role="alert">Acima do peso Ideal.</div><%}
			    		      else if(imc>=32.3)
		    	  		     			 {%><div class="alert alert-danger" role="alert">Obeso.</div><%}
		    	  	}
		    	  	break;
		    	  	
	      	case 3:
	  	  		%><div class="alert alert-danger" role="alert">Selecione Uma opção para prosseguir!</div><%
		     if (altura == 0 || peso == 0)
		     {%><div class="alert alert-danger" role="alert">Informe dados Válidos!</div><%}
		     break;
		    }%>
    
  </div>
</body>
</html>