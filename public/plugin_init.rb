Rails.application.config.after_initialize do
  ResourcesController.class_eval do
    before_action lambda {
      flash[:notice] = t('plugins.aeon_fulfillment.request_flash_notice')
    }, only: :show
  end
  ObjectsController.class_eval do
    before_action lambda {
      if @obj_type == 'archival_object'
        flash[:notice] = t('plugins.aeon_fulfillment.request_flash_notice')
      end
    }, only: :show
  end
end
