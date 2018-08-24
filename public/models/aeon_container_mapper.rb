class AeonContainerMapper < AeonRecordMapper
  register_for_record_type(Container)

  def initialize(top_container)
    super(top_container)
  end

  # Returns a hash that maps from Aeon OpenURL
  # values to values in the provided record.
  def record_fields
    mappings = super
    # we pull the title info from the json_fields. Also ditch any blank values. 
    mappings['title'] = nil
    mappings.delete_if { |k,v| v.blank?  } 
    mappings['identifier'] ||= record.json['display_string']
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
    collection_title = ''

    if collection
      collection
        .select { |c| c['display_string'].present? }
        .each { |c| collection_title << "#{c['display_string']} " }

      request['instance_top_container_collection_identifier_1'] =
        collection
        .select { |c| c['identifier'].present? }
        .map { |c| c['identifier'] }
        .join('; ')
    end

    series = json['series']
    if series
      series_identifier = series
                          .select { |s| s['display_string'].present? }
                          .map { |s| s['display_string'] }
                          .join('; ')
      collection_title << series_identifier
      request['instance_top_container_series_identifier_1'] = series_identifier
      mappings['level'] = series
                          .select { |s| s['level_display_string'].present? }
                          .map { |s| s['level_display_string'] }
                          .join('; ')
    end

    request['title'] = collection_title.chomp
    mappings['Requests'] << request
    mappings
  end
end
