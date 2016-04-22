module ServersHelper

  def resource_format(resource)
    number_to_percentage resource.to_f || 0, precision: 2
  end

end
