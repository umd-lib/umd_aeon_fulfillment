class AeonContainerMapper < AeonRecordMapper
  register_for_record_type(Container)

  def initialize(top_container)
    super(top_container)
  end

  # Returns a hash that maps from Aeon OpenURL
  # values to values in the provided record.
  def record_fields
    mappings = super
    display_string = record.json['display_string']
    mappings['title'] = display_string
    if mappings['identifier'].blank?
      mappings['identifier'] = display_string
    end
    mappings
  end

  def json_fields
    mappings = super
    json = record.json
    mappings['Requests'] ||= []
    return mappings unless json
    request = { "Request": 1,
                "instance_top_container_ref_1": json['uri'],
                "instance_top_container_long_display_string_1": json['long_display_string'],
                "instance_top_container_last_modified_by_1": json['last_modified_by'],
                "instance_top_container_display_string_1": json['display_string'],
                "instance_top_container_restricted_1": json['restricted'],
                "instance_top_container_created_by_1": json['created_by'],
                "instance_top_container_indicator_1": json['indicator'],
                "instance_top_container_barcode_1": json['barcode'],
                "instance_top_container_type_1": json['type'],
                "instance_top_container_uri_1": json['uri'] }

    collection = json['collection']
    if collection
      request['instance_top_container_collection_identifier_1'] =
        collection
        .select { |c| c['identifier'].present? }
        .map { |c| c['identifier'] }
        .join('; ')
    end

    series = json['series']
    if series
      request['instance_top_container_series_identifier_1'] =
        series
        .select { |s| s['display_string'].present? }
        .map { |s| s['display_string'] }
        .join('; ')
    end

    mappings['Requests'] << request
    puts mappings.inspect
    mappings
  end
end
