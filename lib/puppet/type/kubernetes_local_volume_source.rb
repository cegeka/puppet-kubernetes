
# This file is automatically generated by puppet-swagger-generator and
# any manual changes are likely to be clobbered when the files
# are regenerated.

require_relative '../../puppet_x/puppetlabs/swagger/fuzzy_compare'

Puppet::Type.newtype(:kubernetes_local_volume_source) do
  
  @doc = "Local represents directly-attached storage with node affinity"
  

  ensurable

  
  validate do
    required_properties = [
    
      path,
    
    ]
    required_properties.each do |property|
      # We check for both places so as to cover the puppet resource path as well
      if self[property].nil? and self.provider.send(property) == :absent
        fail "You must provide a #{property}"
      end
    end
  end
  

  newparam(:name, namevar: true) do
    desc 'Name of the local_volume_source.'
  end
  
    
      newproperty(:path) do
        
        desc "The full path to the volume on the node For alpha, this path must be a directory Once block as a source is supported, then this path can point to a block device"
        
        def insync?(is)
          PuppetX::Puppetlabs::Swagger::Utils::fuzzy_compare(is, should)
        end
      end
    
  
end