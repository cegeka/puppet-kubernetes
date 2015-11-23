require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_event).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        kind: instance.kind.respond_to?(:to_hash) ? instance.kind.to_hash : instance.kind,
      
    
      
        apiVersion: instance.apiVersion.respond_to?(:to_hash) ? instance.apiVersion.to_hash : instance.apiVersion,
      
    
      
        metadata: instance.metadata.respond_to?(:to_hash) ? instance.metadata.to_hash : instance.metadata,
      
    
      
        involvedObject: instance.involvedObject.respond_to?(:to_hash) ? instance.involvedObject.to_hash : instance.involvedObject,
      
    
      
        reason: instance.reason.respond_to?(:to_hash) ? instance.reason.to_hash : instance.reason,
      
    
      
        message: instance.message.respond_to?(:to_hash) ? instance.message.to_hash : instance.message,
      
    
      
        source: instance.source.respond_to?(:to_hash) ? instance.source.to_hash : instance.source,
      
    
      
        firstTimestamp: instance.firstTimestamp.respond_to?(:to_hash) ? instance.firstTimestamp.to_hash : instance.firstTimestamp,
      
    
      
        lastTimestamp: instance.lastTimestamp.respond_to?(:to_hash) ? instance.lastTimestamp.to_hash : instance.lastTimestamp,
      
    
      
        count: instance.count.respond_to?(:to_hash) ? instance.count.to_hash : instance.count,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('event', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('event', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('event', name)
  end

  private
  def self.list_instances
    list_instances_of('event')
  end

  def build_params
    params = {
    
      
        kind: resource[:kind],
      
    
      
        apiVersion: resource[:apiVersion],
      
    
      
        metadata: resource[:metadata],
      
    
      
        involvedObject: resource[:involvedObject],
      
    
      
        reason: resource[:reason],
      
    
      
        message: resource[:message],
      
    
      
        source: resource[:source],
      
    
      
        firstTimestamp: resource[:firstTimestamp],
      
    
      
        lastTimestamp: resource[:lastTimestamp],
      
    
      
        count: resource[:count],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
