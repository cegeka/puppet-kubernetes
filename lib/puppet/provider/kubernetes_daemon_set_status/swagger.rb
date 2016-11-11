# This file is automatically generated by puppet-swagger-generator and
# any manual changes are likely to be clobbered when the files
# are regenerated.

require_relative '../../../puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_daemon_set_status).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        currentNumberScheduled: instance.currentNumberScheduled.respond_to?(:to_hash) ? instance.currentNumberScheduled.to_hash : instance.currentNumberScheduled,
      
    
      
        numberMisscheduled: instance.numberMisscheduled.respond_to?(:to_hash) ? instance.numberMisscheduled.to_hash : instance.numberMisscheduled,
      
    
      
        desiredNumberScheduled: instance.desiredNumberScheduled.respond_to?(:to_hash) ? instance.desiredNumberScheduled.to_hash : instance.desiredNumberScheduled,
      
    
      
        numberReady: instance.numberReady.respond_to?(:to_hash) ? instance.numberReady.to_hash : instance.numberReady,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating kubernetes_daemon_set_status #{name}")
    create_instance_of('daemon_set_status', name, build_params)
  end

  def flush
   unless @property_hash.empty?
     unless resource[:ensure] == :absent
        flush_instance_of('daemon_set_status', name, @property_hash[:object], build_params)
      end
    end
  end

  def destroy
    Puppet.info("Deleting kubernetes_daemon_set_status #{name}")
    destroy_instance_of('daemon_set_status', name)
    @property_hash[:ensure] = :absent
  end

  private
  def self.list_instances
    list_instances_of('daemon_set_status')
  end

  def build_params
    params = {
    
      
        currentNumberScheduled: resource[:currentNumberScheduled],
      
    
      
        numberMisscheduled: resource[:numberMisscheduled],
      
    
      
        desiredNumberScheduled: resource[:desiredNumberScheduled],
      
    
      
        numberReady: resource[:numberReady],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end