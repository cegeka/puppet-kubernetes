require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_node_condition).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        type: instance.type.respond_to?(:to_hash) ? instance.type.to_hash : instance.type,
      
    
      
        status: instance.status.respond_to?(:to_hash) ? instance.status.to_hash : instance.status,
      
    
      
        lastHeartbeatTime: instance.lastHeartbeatTime.respond_to?(:to_hash) ? instance.lastHeartbeatTime.to_hash : instance.lastHeartbeatTime,
      
    
      
        lastTransitionTime: instance.lastTransitionTime.respond_to?(:to_hash) ? instance.lastTransitionTime.to_hash : instance.lastTransitionTime,
      
    
      
        reason: instance.reason.respond_to?(:to_hash) ? instance.reason.to_hash : instance.reason,
      
    
      
        message: instance.message.respond_to?(:to_hash) ? instance.message.to_hash : instance.message,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('node_condition', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('node_condition', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('node_condition', name)
  end

  private
  def self.list_instances
    list_instances_of('node_condition')
  end

  def build_params
    params = {
    
      
        type: resource[:type],
      
    
      
        status: resource[:status],
      
    
      
        lastHeartbeatTime: resource[:lastHeartbeatTime],
      
    
      
        lastTransitionTime: resource[:lastTransitionTime],
      
    
      
        reason: resource[:reason],
      
    
      
        message: resource[:message],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
