require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_persistent_volume_claim_spec).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        accessModes: instance.accessModes.respond_to?(:to_hash) ? instance.accessModes.to_hash : instance.accessModes,
      
    
      
        resources: instance.resources.respond_to?(:to_hash) ? instance.resources.to_hash : instance.resources,
      
    
      
        volumeName: instance.volumeName.respond_to?(:to_hash) ? instance.volumeName.to_hash : instance.volumeName,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('persistent_volume_claim_spec', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('persistent_volume_claim_spec', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('persistent_volume_claim_spec', name)
  end

  private
  def self.list_instances
    list_instances_of('persistent_volume_claim_spec')
  end

  def build_params
    params = {
    
      
        accessModes: resource[:accessModes],
      
    
      
        resources: resource[:resources],
      
    
      
        volumeName: resource[:volumeName],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
