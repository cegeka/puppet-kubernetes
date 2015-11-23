require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_object_reference).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        kind: instance.kind.respond_to?(:to_hash) ? instance.kind.to_hash : instance.kind,
      
    
      
        namespace: instance.namespace.respond_to?(:to_hash) ? instance.namespace.to_hash : instance.namespace,
      
    
      
        name: instance.name.respond_to?(:to_hash) ? instance.name.to_hash : instance.name,
      
    
      
        uid: instance.uid.respond_to?(:to_hash) ? instance.uid.to_hash : instance.uid,
      
    
      
        apiVersion: instance.apiVersion.respond_to?(:to_hash) ? instance.apiVersion.to_hash : instance.apiVersion,
      
    
      
        resourceVersion: instance.resourceVersion.respond_to?(:to_hash) ? instance.resourceVersion.to_hash : instance.resourceVersion,
      
    
      
        fieldPath: instance.fieldPath.respond_to?(:to_hash) ? instance.fieldPath.to_hash : instance.fieldPath,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('object_reference', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('object_reference', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('object_reference', name)
  end

  private
  def self.list_instances
    list_instances_of('object_reference')
  end

  def build_params
    params = {
    
      
        kind: resource[:kind],
      
    
      
        namespace: resource[:namespace],
      
    
      
        name: resource[:name],
      
    
      
        uid: resource[:uid],
      
    
      
        apiVersion: resource[:apiVersion],
      
    
      
        resourceVersion: resource[:resourceVersion],
      
    
      
        fieldPath: resource[:fieldPath],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
