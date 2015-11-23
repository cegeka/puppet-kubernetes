require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_container_status).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        name: instance.name.respond_to?(:to_hash) ? instance.name.to_hash : instance.name,
      
    
      
        state: instance.state.respond_to?(:to_hash) ? instance.state.to_hash : instance.state,
      
    
      
        lastState: instance.lastState.respond_to?(:to_hash) ? instance.lastState.to_hash : instance.lastState,
      
    
      
        ready: instance.ready.respond_to?(:to_hash) ? instance.ready.to_hash : instance.ready,
      
    
      
        restartCount: instance.restartCount.respond_to?(:to_hash) ? instance.restartCount.to_hash : instance.restartCount,
      
    
      
        image: instance.image.respond_to?(:to_hash) ? instance.image.to_hash : instance.image,
      
    
      
        imageID: instance.imageID.respond_to?(:to_hash) ? instance.imageID.to_hash : instance.imageID,
      
    
      
        containerID: instance.containerID.respond_to?(:to_hash) ? instance.containerID.to_hash : instance.containerID,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('container_status', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('container_status', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('container_status', name)
  end

  private
  def self.list_instances
    list_instances_of('container_status')
  end

  def build_params
    params = {
    
      
        name: resource[:name],
      
    
      
        state: resource[:state],
      
    
      
        lastState: resource[:lastState],
      
    
      
        ready: resource[:ready],
      
    
      
        restartCount: resource[:restartCount],
      
    
      
        image: resource[:image],
      
    
      
        imageID: resource[:imageID],
      
    
      
        containerID: resource[:containerID],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
