require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_tcp_socket_action).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        port: instance.port.respond_to?(:to_hash) ? instance.port.to_hash : instance.port,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('tcp_socket_action', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('tcp_socket_action', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('tcp_socket_action', name)
  end

  private
  def self.list_instances
    list_instances_of('tcp_socket_action')
  end

  def build_params
    params = {
    
      
        port: resource[:port],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
