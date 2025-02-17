module CrudActions
    extend ActiveSupport::Concern
  
    def create
      @resource = resource_class.new(resource_params)
  
      respond_to do |format|
        if @resource.save
          format.html { redirect_to after_create_path }
          format.json { render :show, status: :created, location: @resource }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if resource.update(resource_params)
          format.html { redirect_to after_update_path }
          format.json { render :show, status: :ok, location: resource }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: resource.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      resource.destroy!
  
      respond_to do |format|
        format.html { redirect_to after_destroy_path, status: :see_other }
        format.json { head :no_content }
      end
    end

    private

    def resource_class
      controller_name.classify.constantize
    end

    def resource
      instance_variable_get("@#{controller_name.singularize}")
    end

    def resources_path
      send("#{controller_name}_path")
    end

    def after_destroy_path
      resources_path
    end

    def after_update_path
      resources_path
    end

    def after_create_path
      resources_path
    end
end