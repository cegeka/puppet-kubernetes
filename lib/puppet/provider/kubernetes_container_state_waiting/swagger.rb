require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_container_state_waiting).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        reason: instance.reason.respond_to?(:to_hash) ? instance.reason.to_hash : instance.reason,
      
    
      
        message: instance.message.respond_to?(:to_hash) ? instance.message.to_hash : instance.message,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('container_state_waiting', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('container_state_waiting', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('container_state_waiting', name)
  end

  private
  def self.list_instances
    list_instances_of('container_state_waiting')
  end

  def build_params
    params = {
    
      
        reason: resource[:reason],
      
    
      
        message: resource[:message],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
