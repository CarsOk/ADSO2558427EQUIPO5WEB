class EmpresasController < ApplicationController
    def show
        @empresa = Empresa.find(params[:id])
      end
end
