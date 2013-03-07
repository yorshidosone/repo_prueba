#*******************************************************************************
#Clase Numlet crea objetos los cuales son convertidos a su respectiva
# representaciòn en texto a traves del metodo  a_letra
# p.e
# 2734 = dos mil setecientos treinta y cuatro
#
# Las conversiones se realizan con numeros entre:
# 0 y 999,999,999
#
# Autor:  Faustino Vasquez limon
# Con ayuda de  http://www.ruby-doc.org/
#
#Asi que "COMIENZA EL DESPAPAYE"
#*******************************************************************************
class Numlet
  def initialize(numero, sufijo)
    @numero = numero.to_s.reverse.split("")
    @decimal = sufijo[2..3]
    @i = 0
    @j = 0
    @parte1 = []
    @parte2 = []
    @especial = ""
    @numlet = []
    @bandera=0
    @bandera1=0
    @a =[["UNO","DOS","TRES","CUATRO","CINCO","SEIS","SIETE","OCHO","NUEVE"],
      ["DIEZ","VEINTE","TREINTA","CUARENTA","CINCUENTA","SESENTA","SETENTA","OCHENTA","NOVENTA"],       
      ["CIENTO","DOSCIENTOS","TRESCIENTOS","CUATROCIENTOS","QUINIENTOS","SEISCIENTOS","SETECIENTOS","OCHOCIENTOS","NOVECIENTOS"]]
  end

  def especial 
    @numlet[@j]  = case @especial
    when "11" then  "ONCE"
    when "12" then  "DOCE"
    when "13" then  "TRECE"
    when "14" then  "CATORCE"
    when "15" then  "QUINCE"
    when "16" then  "DIECISEIS"
    when "17" then  "DIECISIETE"
    when "18" then  "DIECIOCHO"
    when "19" then  "DIECINUEVE"
    when "21" then  "VEINTIUN"
    when "22" then  "VEINTIDOS"
    when "23" then  "VEINTITRES"
    when "24" then  "VEINTICUATRO"
    when "25" then  "VEINTICINCO"
    when "26" then  "VEINTISEIS"
    when "27" then  "VEINTISIETE"
    when "28" then  "VEINTIOCHO"
    when "29" then  "VEINTINUEVE"
    else return 0
    end
  end

  def repetir
    case @numero.length
    when 0..3 then @parte1[0] = @numero[0..@numero.length]
    when 4..6 then @parte1[0] = @numero[0..2];@parte1[1] = @numero[3..@numero.length]
    when 7..9 then @parte1[0] = @numero[0..2];@parte1[1] = @numero[3..5]; @parte1[2] = @numero[6..@numero.length]
    else return 0
    end
  end

  def convierte
    @bandera1=0
    @i=0
    case @bandera
    when 1 then @numlet[@j]="MIL";@j+=1
    when 2 then (@parte2.length==1 and @parte2[0]==1) ? @numlet[@j]="millon" : @numlet[@j]="millones";@j+=1
    end
    @especial = [@parte2[@i+1],@parte2[@i]].join("")
    if especial != 0
      @i+=2
      @j+=1
    else
      if @parte2[@i].to_s =="1"
        @numlet[@j]="UN"
        @i+=1
        @j+=1
      end
    end
    while @i < @parte2.length
      if @parte2[@i].to_i ==0
        @i+=1
        @bandera1+=1
      else
        if @parte2.length != 1 and @bandera1 ==0
          if @i == 1
            @numlet[@j]="Y"
            @j+=1
          end
        end
        @numlet[@j] = @a[@i][@parte2[@i].to_i-1]
        if  @i == 2  and @bandera1==2 and @numlet[@j]=="CIENTO"
          @numlet[@j]="CIEN"
        end
        @j+=1
        @i+=1    
      end
    end
    @bandera+=1
  end

  def termina
    @numlet.reverse.join(" ")
  end

  def a_letra
    if  repetir != 0
      @parte1.each do |arg|
  @parte2 = arg
        convierte
      end
        @numlet.reverse.join(" ") + " PESOS " + @decimal + "/100 M.N"
    else
      print "Este numero no puede ser convertido\n"
    end
   end
end
