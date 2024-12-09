class FormsController < ApplicationController
    before_action :set_form, only: [:show, :edit, :update, :destroy]

    # GET /forms/new
    def new
      @form = Form.new
    end

    def index
        @forms = Form.all
    end

    # POST /forms
    def create
      params = form_params
      @email = params[:hidden_email]
      params.delete(:email) if params[:email]
      @form = Form.new(params)
      if @form.save
        if @email.present?
          BackgroundJob.perform_async(@email, @form.description)
        else
          service = OpenService.new(@form.description)
          ai_response_content = service.ask
          @form.create_response(status: "Terminado", ai_response: ai_response_content)
        end
        redirect_to @form, notice: "Formulario creado y respuesta generada exitosamente."
      else
        render :new
      end
    end

    def show
      @form = Form.find(params[:id])
      @response = @form.response
    rescue ActiveRecord::RecordNotFound
      redirect_to forms_path, alert: "Formulario no encontrado."
    end

    # GET /forms/:id/edit
    def edit
    end

    # PATCH/PUT /forms/:id
    def update
      if @form.update(form_params)
        redirect_to @form, notice: "Formulario actualizado exitosamente."
      else
        render :edit
      end
    end

    # DELETE /forms/:id
    def destroy
      @form.destroy
      redirect_to forms_url, notice: "Formulario eliminado exitosamente."
    end

    private

    def set_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:name, :description, :processed_in_job, :email)
    end
end
