require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_pod_spec).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        volumes: instance.volumes.respond_to?(:to_hash) ? instance.volumes.to_hash : instance.volumes,
      
    
      
        containers: instance.containers.respond_to?(:to_hash) ? instance.containers.to_hash : instance.containers,
      
    
      
        restartPolicy: instance.restartPolicy.respond_to?(:to_hash) ? instance.restartPolicy.to_hash : instance.restartPolicy,
      
    
      
        terminationGracePeriodSeconds: instance.terminationGracePeriodSeconds.respond_to?(:to_hash) ? instance.terminationGracePeriodSeconds.to_hash : instance.terminationGracePeriodSeconds,
      
    
      
        activeDeadlineSeconds: instance.activeDeadlineSeconds.respond_to?(:to_hash) ? instance.activeDeadlineSeconds.to_hash : instance.activeDeadlineSeconds,
      
    
      
        dnsPolicy: instance.dnsPolicy.respond_to?(:to_hash) ? instance.dnsPolicy.to_hash : instance.dnsPolicy,
      
    
      
        nodeSelector: instance.nodeSelector.respond_to?(:to_hash) ? instance.nodeSelector.to_hash : instance.nodeSelector,
      
    
      
        serviceAccountName: instance.serviceAccountName.respond_to?(:to_hash) ? instance.serviceAccountName.to_hash : instance.serviceAccountName,
      
    
      
        serviceAccount: instance.serviceAccount.respond_to?(:to_hash) ? instance.serviceAccount.to_hash : instance.serviceAccount,
      
    
      
        nodeName: instance.nodeName.respond_to?(:to_hash) ? instance.nodeName.to_hash : instance.nodeName,
      
    
      
        hostNetwork: instance.hostNetwork.respond_to?(:to_hash) ? instance.hostNetwork.to_hash : instance.hostNetwork,
      
    
      
        hostPID: instance.hostPID.respond_to?(:to_hash) ? instance.hostPID.to_hash : instance.hostPID,
      
    
      
        hostIPC: instance.hostIPC.respond_to?(:to_hash) ? instance.hostIPC.to_hash : instance.hostIPC,
      
    
      
        securityContext: instance.securityContext.respond_to?(:to_hash) ? instance.securityContext.to_hash : instance.securityContext,
      
    
      
        imagePullSecrets: instance.imagePullSecrets.respond_to?(:to_hash) ? instance.imagePullSecrets.to_hash : instance.imagePullSecrets,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('pod_spec', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('pod_spec', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('pod_spec', name)
  end

  private
  def self.list_instances
    list_instances_of('pod_spec')
  end

  def build_params
    params = {
    
      
        volumes: resource[:volumes],
      
    
      
        containers: resource[:containers],
      
    
      
        restartPolicy: resource[:restartPolicy],
      
    
      
        terminationGracePeriodSeconds: resource[:terminationGracePeriodSeconds],
      
    
      
        activeDeadlineSeconds: resource[:activeDeadlineSeconds],
      
    
      
        dnsPolicy: resource[:dnsPolicy],
      
    
      
        nodeSelector: resource[:nodeSelector],
      
    
      
        serviceAccountName: resource[:serviceAccountName],
      
    
      
        serviceAccount: resource[:serviceAccount],
      
    
      
        nodeName: resource[:nodeName],
      
    
      
        hostNetwork: resource[:hostNetwork],
      
    
      
        hostPID: resource[:hostPID],
      
    
      
        hostIPC: resource[:hostIPC],
      
    
      
        securityContext: resource[:securityContext],
      
    
      
        imagePullSecrets: resource[:imagePullSecrets],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
