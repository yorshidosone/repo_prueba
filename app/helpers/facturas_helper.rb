module FacturasHelper
  def importe(cant, precio)
    tempo = cant * precio
  end
  
  def calcular_subtotal(st, temp)
    subtotal = st + temp
  end
  
  def subtotal
    @subtotal = self.subtotal
  end
  
  def calcular_iva(st)
    iva = st.to_f * 0.16
  end
  #SI LO QUE SE QUIERE ES RESTAR EL IVA AL SUBTOTAL, AGREGAR @ A LA VARIABLE IVA EN CALCULAR IVA Y TOTAL
  def total(sub, desc)
    @total = sub.to_f - desc.to_f + (sub.to_f * 0.16)
    if @total < 0
      @total = 0
    else @total
    end
  end
  
  def cantidad_en_letras(cant)
    c = cant.to_i
    sufijo = (cant.modulo(1)+0.01).to_s
    n = Numlet.new(c, sufijo)
    n.a_letra
  end
end

