require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_git_repo_volume_source).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        repository: instance.repository.respond_to?(:to_hash) ? instance.repository.to_hash : instance.repository,
      
    
      
        revision: instance.revision.respond_to?(:to_hash) ? instance.revision.to_hash : instance.revision,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('git_repo_volume_source', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('git_repo_volume_source', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('git_repo_volume_source', name)
  end

  private
  def self.list_instances
    list_instances_of('git_repo_volume_source')
  end

  def build_params
    params = {
    
      
        repository: resource[:repository],
      
    
      
        revision: resource[:revision],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
