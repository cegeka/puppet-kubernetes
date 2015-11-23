require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_volume).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        name: instance.name.respond_to?(:to_hash) ? instance.name.to_hash : instance.name,
      
    
      
        hostPath: instance.hostPath.respond_to?(:to_hash) ? instance.hostPath.to_hash : instance.hostPath,
      
    
      
        emptyDir: instance.emptyDir.respond_to?(:to_hash) ? instance.emptyDir.to_hash : instance.emptyDir,
      
    
      
        gcePersistentDisk: instance.gcePersistentDisk.respond_to?(:to_hash) ? instance.gcePersistentDisk.to_hash : instance.gcePersistentDisk,
      
    
      
        awsElasticBlockStore: instance.awsElasticBlockStore.respond_to?(:to_hash) ? instance.awsElasticBlockStore.to_hash : instance.awsElasticBlockStore,
      
    
      
        gitRepo: instance.gitRepo.respond_to?(:to_hash) ? instance.gitRepo.to_hash : instance.gitRepo,
      
    
      
        secret: instance.secret.respond_to?(:to_hash) ? instance.secret.to_hash : instance.secret,
      
    
      
        nfs: instance.nfs.respond_to?(:to_hash) ? instance.nfs.to_hash : instance.nfs,
      
    
      
        iscsi: instance.iscsi.respond_to?(:to_hash) ? instance.iscsi.to_hash : instance.iscsi,
      
    
      
        glusterfs: instance.glusterfs.respond_to?(:to_hash) ? instance.glusterfs.to_hash : instance.glusterfs,
      
    
      
        persistentVolumeClaim: instance.persistentVolumeClaim.respond_to?(:to_hash) ? instance.persistentVolumeClaim.to_hash : instance.persistentVolumeClaim,
      
    
      
        rbd: instance.rbd.respond_to?(:to_hash) ? instance.rbd.to_hash : instance.rbd,
      
    
      
        cinder: instance.cinder.respond_to?(:to_hash) ? instance.cinder.to_hash : instance.cinder,
      
    
      
        cephfs: instance.cephfs.respond_to?(:to_hash) ? instance.cephfs.to_hash : instance.cephfs,
      
    
      
        flocker: instance.flocker.respond_to?(:to_hash) ? instance.flocker.to_hash : instance.flocker,
      
    
      
        downwardAPI: instance.downwardAPI.respond_to?(:to_hash) ? instance.downwardAPI.to_hash : instance.downwardAPI,
      
    
      
        fc: instance.fc.respond_to?(:to_hash) ? instance.fc.to_hash : instance.fc,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('volume', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('volume', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('volume', name)
  end

  private
  def self.list_instances
    list_instances_of('volume')
  end

  def build_params
    params = {
    
      
        name: resource[:name],
      
    
      
        hostPath: resource[:hostPath],
      
    
      
        emptyDir: resource[:emptyDir],
      
    
      
        gcePersistentDisk: resource[:gcePersistentDisk],
      
    
      
        awsElasticBlockStore: resource[:awsElasticBlockStore],
      
    
      
        gitRepo: resource[:gitRepo],
      
    
      
        secret: resource[:secret],
      
    
      
        nfs: resource[:nfs],
      
    
      
        iscsi: resource[:iscsi],
      
    
      
        glusterfs: resource[:glusterfs],
      
    
      
        persistentVolumeClaim: resource[:persistentVolumeClaim],
      
    
      
        rbd: resource[:rbd],
      
    
      
        cinder: resource[:cinder],
      
    
      
        cephfs: resource[:cephfs],
      
    
      
        flocker: resource[:flocker],
      
    
      
        downwardAPI: resource[:downwardAPI],
      
    
      
        fc: resource[:fc],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
