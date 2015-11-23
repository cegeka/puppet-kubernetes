require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_component_condition).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        type: instance.type.respond_to?(:to_hash) ? instance.type.to_hash : instance.type,
      
    
      
        status: instance.status.respond_to?(:to_hash) ? instance.status.to_hash : instance.status,
      
    
      
        message: instance.message.respond_to?(:to_hash) ? instance.message.to_hash : instance.message,
      
    
      
        error: instance.error.respond_to?(:to_hash) ? instance.error.to_hash : instance.error,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('component_condition', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('component_condition', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('component_condition', name)
  end

  private
  def self.list_instances
    list_instances_of('component_condition')
  end

  def build_params
    params = {
    
      
        type: resource[:type],
      
    
      
        status: resource[:status],
      
    
      
        message: resource[:message],
      
    
      
        error: resource[:error],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
