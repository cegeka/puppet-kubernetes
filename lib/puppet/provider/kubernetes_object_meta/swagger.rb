require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_object_meta).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        name: instance.name.respond_to?(:to_hash) ? instance.name.to_hash : instance.name,
      
    
      
        generateName: instance.generateName.respond_to?(:to_hash) ? instance.generateName.to_hash : instance.generateName,
      
    
      
        namespace: instance.namespace.respond_to?(:to_hash) ? instance.namespace.to_hash : instance.namespace,
      
    
      
        selfLink: instance.selfLink.respond_to?(:to_hash) ? instance.selfLink.to_hash : instance.selfLink,
      
    
      
        uid: instance.uid.respond_to?(:to_hash) ? instance.uid.to_hash : instance.uid,
      
    
      
        resourceVersion: instance.resourceVersion.respond_to?(:to_hash) ? instance.resourceVersion.to_hash : instance.resourceVersion,
      
    
      
        generation: instance.generation.respond_to?(:to_hash) ? instance.generation.to_hash : instance.generation,
      
    
      
        creationTimestamp: instance.creationTimestamp.respond_to?(:to_hash) ? instance.creationTimestamp.to_hash : instance.creationTimestamp,
      
    
      
        deletionTimestamp: instance.deletionTimestamp.respond_to?(:to_hash) ? instance.deletionTimestamp.to_hash : instance.deletionTimestamp,
      
    
      
        deletionGracePeriodSeconds: instance.deletionGracePeriodSeconds.respond_to?(:to_hash) ? instance.deletionGracePeriodSeconds.to_hash : instance.deletionGracePeriodSeconds,
      
    
      
        labels: instance.labels.respond_to?(:to_hash) ? instance.labels.to_hash : instance.labels,
      
    
      
        annotations: instance.annotations.respond_to?(:to_hash) ? instance.annotations.to_hash : instance.annotations,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('object_meta', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('object_meta', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('object_meta', name)
  end

  private
  def self.list_instances
    list_instances_of('object_meta')
  end

  def build_params
    params = {
    
      
        name: resource[:name],
      
    
      
        generateName: resource[:generateName],
      
    
      
        namespace: resource[:namespace],
      
    
      
        selfLink: resource[:selfLink],
      
    
      
        uid: resource[:uid],
      
    
      
        resourceVersion: resource[:resourceVersion],
      
    
      
        generation: resource[:generation],
      
    
      
        creationTimestamp: resource[:creationTimestamp],
      
    
      
        deletionTimestamp: resource[:deletionTimestamp],
      
    
      
        deletionGracePeriodSeconds: resource[:deletionGracePeriodSeconds],
      
    
      
        labels: resource[:labels],
      
    
      
        annotations: resource[:annotations],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
