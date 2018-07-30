class AeonContainerMapper < AeonRecordMapper
  register_for_record_type(Container)

  def initialize(top_container)
    super(top_container)
  end

  # Returns a hash that maps from Aeon OpenURL
  # values to values in the provided record.
  def record_fields
    mappings = super
    if mappings['identifier'].blank?
      mappings['identifier'] = record.display_string
    end
    mappings
  end
end
