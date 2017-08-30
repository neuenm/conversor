# encoding: UTF-8
require 'sinatra'
require 'slim'
require "phys/units"
Q = Phys::Quantity
U = Phys::Unit
medidasDist=["km","m","cm","mm","inch","ft","yd","mi"]
medidasTemp=["tempF","tempC"]
medidasPeso=["mg","g","kg","t","oz","lb"]

get "/conversor/distancia" do 
	slim:distancia
end
get "/conversor/peso" do 
	slim:peso
end
get "/conversor/temperatura" do 
	slim:temperatura
end


post "/solucion" do 
  @valor = params[:valor].to_i
  @unidadIni= params[:unidadInicial].to_s
  @unidadFin= params[:unidadFinal].to_s
  @res= Q[(@valor),(@unidadIni)].want(@unidadFin)   
  @res=@res.value
  {resultado: @res, unidadIni: @unidadIni, unidadFin: @unidadFin, valor: @valor}.to_json
end

