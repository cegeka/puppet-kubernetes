require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_resource_quota_status).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        hard: instance.hard.respond_to?(:to_hash) ? instance.hard.to_hash : instance.hard,
      
    
      
        used: instance.used.respond_to?(:to_hash) ? instance.used.to_hash : instance.used,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('resource_quota_status', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('resource_quota_status', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('resource_quota_status', name)
  end

  private
  def self.list_instances
    list_instances_of('resource_quota_status')
  end

  def build_params
    params = {
    
      
        hard: resource[:hard],
      
    
      
        used: resource[:used],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
