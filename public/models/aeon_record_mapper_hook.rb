AeonRecordMapper.class_eval do
  def top_containers
    instances = Array.wrap(record.json['instances'])
    return [] unless instances
    instances.map do |instance|
      sub_container = instance.dig('sub_container')
      next unless sub_container
      sub_container.dig('top_container')
    end.compact
  end
end
