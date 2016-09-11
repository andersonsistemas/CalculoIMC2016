<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="header.html" %>
<title>C�lculo IMC</title>
</head>
<body>
  <div class="container">
				    
				   <form class="form-horizontal">
				<fieldset>
				
				<!-- Form Name -->
				<legend>C�lculo de IMC</legend>
				
				<!-- Multiple Radios -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="radios">Selecione Uma Op��o</label>
				  <div class="col-md-4">
				  <div class="radio">
				    <label for="radios-0">
				      <input type="radio" name="radios" id="radios-0" value="0" checked="checked">
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
				    <button id="button1id" name="btnCalcular" class="btn btn-success">Calcular</button>
				    <button id="button2id" name="btnLimpar" class="btn btn-info">Limpar</button>
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
      
      
      if (altura == 0 || peso ==0){
      %><div class="alert alert-danger" role="alert">Informe dados V�lidos!</div><%}
      if(sexo==0){  
    	  double pesoIdeal=(altura*altura)*20.7;
    	  if(imc<20.7){
    %><div class="alert alert-warning" role="alert">Abaixo do Peso.</div><br><%}
      else if(imc>=20.7&&imc<26.4){
    %><div class="alert alert-sucess" role="alert">Peso Normal.</div><%}
      else if(imc>=26.4&&imc<27.8)
      {%><div class="alert alert-success" role="alert">Marginalmente acima do Peso.</div><%}
      else if(imc>=27.8&&imc<31.1)
      {%><div class="alert alert-warning" role="alert">Acima do peso Ideal.</div><%}
      else if(imc>=31.1)
      {%><div class="alert alert-danger" role="alert">Obeso.</div><%}
      }
      else{
    	  double pesoIdeal=(altura*altura)*19.1;	
    	  if(imc<19.1){
    		    %><div class="alert alert-warning" role="alert">Abaixo do Peso.</div><%}
    		      else if(imc>=19.1&&imc<25.8){
    		    %><div class="alert alert-success" role="alert">Peso Normal.</div><%}
    		      else if(imc>=25.8&&imc<27.3)
    		      {%><div class="alert alert-success" role="alert">Marginalmente acima do Peso.</div><%}
    		      else if(imc>=27.3&&imc<32.3)
    		      {%><div class="alert alert-warning" role="alert">Acima do peso Ideal.</div><%}
    		      else if(imc>=32.3)
    		      {%><div class="alert alert-danger" role="alert">Obeso.</div><%}
      	
      }%>
    
  </div>
</body>
</html>