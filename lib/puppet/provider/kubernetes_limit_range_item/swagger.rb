require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_limit_range_item).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        type: instance.type.respond_to?(:to_hash) ? instance.type.to_hash : instance.type,
      
    
      
        max: instance.max.respond_to?(:to_hash) ? instance.max.to_hash : instance.max,
      
    
      
        min: instance.min.respond_to?(:to_hash) ? instance.min.to_hash : instance.min,
      
    
      
        default: instance.default.respond_to?(:to_hash) ? instance.default.to_hash : instance.default,
      
    
      
        defaultRequest: instance.defaultRequest.respond_to?(:to_hash) ? instance.defaultRequest.to_hash : instance.defaultRequest,
      
    
      
        maxLimitRequestRatio: instance.maxLimitRequestRatio.respond_to?(:to_hash) ? instance.maxLimitRequestRatio.to_hash : instance.maxLimitRequestRatio,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('limit_range_item', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('limit_range_item', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('limit_range_item', name)
  end

  private
  def self.list_instances
    list_instances_of('limit_range_item')
  end

  def build_params
    params = {
    
      
        type: resource[:type],
      
    
      
        max: resource[:max],
      
    
      
        min: resource[:min],
      
    
      
        default: resource[:default],
      
    
      
        defaultRequest: resource[:defaultRequest],
      
    
      
        maxLimitRequestRatio: resource[:maxLimitRequestRatio],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
