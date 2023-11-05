class UsuariosController < ApplicationController
    def index
        @usuarios = Usuario.all
    end
    
      #def new
        #@usuario = Usuario.new
      #end
    
      def show
        @usuario = Usuario.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      end
    
      #def edit
        #@usuario = Usuario.find(params[:id])
      #end
end
