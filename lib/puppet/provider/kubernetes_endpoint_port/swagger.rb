require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_endpoint_port).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        name: instance.name.respond_to?(:to_hash) ? instance.name.to_hash : instance.name,
      
    
      
        port: instance.port.respond_to?(:to_hash) ? instance.port.to_hash : instance.port,
      
    
      
        protocol: instance.protocol.respond_to?(:to_hash) ? instance.protocol.to_hash : instance.protocol,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('endpoint_port', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('endpoint_port', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('endpoint_port', name)
  end

  private
  def self.list_instances
    list_instances_of('endpoint_port')
  end

  def build_params
    params = {
    
      
        name: resource[:name],
      
    
      
        port: resource[:port],
      
    
      
        protocol: resource[:protocol],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
