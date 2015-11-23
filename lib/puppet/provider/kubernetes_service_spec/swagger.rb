require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_service_spec).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        ports: instance.ports.respond_to?(:to_hash) ? instance.ports.to_hash : instance.ports,
      
    
      
        selector: instance.selector.respond_to?(:to_hash) ? instance.selector.to_hash : instance.selector,
      
    
      
        clusterIP: instance.clusterIP.respond_to?(:to_hash) ? instance.clusterIP.to_hash : instance.clusterIP,
      
    
      
        type: instance.type.respond_to?(:to_hash) ? instance.type.to_hash : instance.type,
      
    
      
        externalIPs: instance.externalIPs.respond_to?(:to_hash) ? instance.externalIPs.to_hash : instance.externalIPs,
      
    
      
        deprecatedPublicIPs: instance.deprecatedPublicIPs.respond_to?(:to_hash) ? instance.deprecatedPublicIPs.to_hash : instance.deprecatedPublicIPs,
      
    
      
        sessionAffinity: instance.sessionAffinity.respond_to?(:to_hash) ? instance.sessionAffinity.to_hash : instance.sessionAffinity,
      
    
      
        loadBalancerIP: instance.loadBalancerIP.respond_to?(:to_hash) ? instance.loadBalancerIP.to_hash : instance.loadBalancerIP,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('service_spec', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('service_spec', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('service_spec', name)
  end

  private
  def self.list_instances
    list_instances_of('service_spec')
  end

  def build_params
    params = {
    
      
        ports: resource[:ports],
      
    
      
        selector: resource[:selector],
      
    
      
        clusterIP: resource[:clusterIP],
      
    
      
        type: resource[:type],
      
    
      
        externalIPs: resource[:externalIPs],
      
    
      
        deprecatedPublicIPs: resource[:deprecatedPublicIPs],
      
    
      
        sessionAffinity: resource[:sessionAffinity],
      
    
      
        loadBalancerIP: resource[:loadBalancerIP],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
