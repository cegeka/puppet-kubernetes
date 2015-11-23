require 'puppet_x/puppetlabs/swagger/prefetch_error'
require 'puppet_x/puppetlabs/swagger/symbolize_keys'
require 'puppet_x/puppetlabs/kubernetes/provider'

Puppet::Type.type(:kubernetes_persistent_volume_spec).provide(:swagger, :parent => PuppetX::Puppetlabs::Kubernetes::Provider) do

  mk_resource_methods

  def self.instance_to_hash(instance)
    {
    ensure: :present,
    name: instance.metadata.name,
    
      
        capacity: instance.capacity.respond_to?(:to_hash) ? instance.capacity.to_hash : instance.capacity,
      
    
      
        gcePersistentDisk: instance.gcePersistentDisk.respond_to?(:to_hash) ? instance.gcePersistentDisk.to_hash : instance.gcePersistentDisk,
      
    
      
        awsElasticBlockStore: instance.awsElasticBlockStore.respond_to?(:to_hash) ? instance.awsElasticBlockStore.to_hash : instance.awsElasticBlockStore,
      
    
      
        hostPath: instance.hostPath.respond_to?(:to_hash) ? instance.hostPath.to_hash : instance.hostPath,
      
    
      
        glusterfs: instance.glusterfs.respond_to?(:to_hash) ? instance.glusterfs.to_hash : instance.glusterfs,
      
    
      
        nfs: instance.nfs.respond_to?(:to_hash) ? instance.nfs.to_hash : instance.nfs,
      
    
      
        rbd: instance.rbd.respond_to?(:to_hash) ? instance.rbd.to_hash : instance.rbd,
      
    
      
        iscsi: instance.iscsi.respond_to?(:to_hash) ? instance.iscsi.to_hash : instance.iscsi,
      
    
      
        cinder: instance.cinder.respond_to?(:to_hash) ? instance.cinder.to_hash : instance.cinder,
      
    
      
        cephfs: instance.cephfs.respond_to?(:to_hash) ? instance.cephfs.to_hash : instance.cephfs,
      
    
      
        fc: instance.fc.respond_to?(:to_hash) ? instance.fc.to_hash : instance.fc,
      
    
      
        flocker: instance.flocker.respond_to?(:to_hash) ? instance.flocker.to_hash : instance.flocker,
      
    
      
        accessModes: instance.accessModes.respond_to?(:to_hash) ? instance.accessModes.to_hash : instance.accessModes,
      
    
      
        claimRef: instance.claimRef.respond_to?(:to_hash) ? instance.claimRef.to_hash : instance.claimRef,
      
    
      
        persistentVolumeReclaimPolicy: instance.persistentVolumeReclaimPolicy.respond_to?(:to_hash) ? instance.persistentVolumeReclaimPolicy.to_hash : instance.persistentVolumeReclaimPolicy,
      
    
    object: instance,
    }
  end

  def create
    Puppet.info("Creating #{name}")
    create_instance_of('persistent_volume_spec', name, build_params)
  end

  def flush
    if ! @property_hash.empty? and @property_hash[:ensure] != :absent
      flush_instance_of('persistent_volume_spec', name, @property_hash[:object], build_params)
    end
  end

  def destroy
    Puppet.info("Deleting #{name}")
    destroy_instance_of('persistent_volume_spec', name)
  end

  private
  def self.list_instances
    list_instances_of('persistent_volume_spec')
  end

  def build_params
    params = {
    
      
        capacity: resource[:capacity],
      
    
      
        gcePersistentDisk: resource[:gcePersistentDisk],
      
    
      
        awsElasticBlockStore: resource[:awsElasticBlockStore],
      
    
      
        hostPath: resource[:hostPath],
      
    
      
        glusterfs: resource[:glusterfs],
      
    
      
        nfs: resource[:nfs],
      
    
      
        rbd: resource[:rbd],
      
    
      
        iscsi: resource[:iscsi],
      
    
      
        cinder: resource[:cinder],
      
    
      
        cephfs: resource[:cephfs],
      
    
      
        fc: resource[:fc],
      
    
      
        flocker: resource[:flocker],
      
    
      
        accessModes: resource[:accessModes],
      
    
      
        claimRef: resource[:claimRef],
      
    
      
        persistentVolumeReclaimPolicy: resource[:persistentVolumeReclaimPolicy],
      
    
    }
    params.delete_if { |key, value| value.nil? }
    params
  end
end
