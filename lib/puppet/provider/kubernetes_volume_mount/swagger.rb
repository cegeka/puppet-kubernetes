require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_volume_mount).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        name: instance.name.respond_to?(:to_hash) ? instance.name.to_hash : instance.name,
      
    
      
        readOnly: instance.readOnly.respond_to?(:to_hash) ? instance.readOnly.to_hash : instance.readOnly,
      
    
      
        mountPath: instance.mountPath.respond_to?(:to_hash) ? instance.mountPath.to_hash : instance.mountPath,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('volume_mount', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('volume_mount', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('volume_mount', name)
  end

  private
  def self.list_instances
    list_instances_of('volume_mount')
  end

  def build_params
    params = {
    
      
        name: resource[:name],
      
    
      
        readOnly: resource[:readOnly],
      
    
      
        mountPath: resource[:mountPath],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
