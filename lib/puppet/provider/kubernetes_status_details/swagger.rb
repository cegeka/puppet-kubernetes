require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_status_details).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        name: instance.name.respond_to?(:to_hash) ? instance.name.to_hash : instance.name,
      
    
      
        kind: instance.kind.respond_to?(:to_hash) ? instance.kind.to_hash : instance.kind,
      
    
      
        causes: instance.causes.respond_to?(:to_hash) ? instance.causes.to_hash : instance.causes,
      
    
      
        retryAfterSeconds: instance.retryAfterSeconds.respond_to?(:to_hash) ? instance.retryAfterSeconds.to_hash : instance.retryAfterSeconds,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('status_details', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('status_details', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('status_details', name)
  end

  private
  def self.list_instances
    list_instances_of('status_details')
  end

  def build_params
    params = {
    
      
        name: resource[:name],
      
    
      
        kind: resource[:kind],
      
    
      
        causes: resource[:causes],
      
    
      
        retryAfterSeconds: resource[:retryAfterSeconds],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
