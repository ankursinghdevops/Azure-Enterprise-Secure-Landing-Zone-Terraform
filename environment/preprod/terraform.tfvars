resource_group={
    dev={
        resource_group_name="dev_rg"
        location="indiasouthcentral"
    }
}
virtual_network={
        dev={
        virtual_network_name="dev_vnet"
        location="indiasouthcentral"
        resource_group_name="dev_rg"
        address_space=["10.0.0.0/16"]
        
        
    }
}
subnet={ 
        dev={
            subnet_name="dev_subnet"
            virtual_network_name="dev_vnet"
            resource_group_name="dev_rg"
            address_prefixes=["10.0.0.0/24"]
    }

       bastion={
    
            subnet_name="AzureBastionSubnet"
            virtual_network_name="dev_vnet"
            resource_group_name="dev_rg"
            address_prefixes=["10.0.1.0/26"]  
             
}
}
azurebastion={
    dev={
            subnet_name="AzureBastionSubnet"
            virtual_network_name="dev_vnet"
            bastion_name="dev_bastion"
            resource_group_name="dev_rg"
             pubip_name         ="dev_pubip"  
             location="indiasouthcentral"
    }
}
    
    publicip={
        dev={
             pubip_name         ="dev_pubip"
             resource_group_name="dev_rg"
             location          ="indiasouthcentral"
             allocation_method = "Static"
             sku               = "Standard"
        }
    }
    virtualmachine={
        dev={
            subnet_name="dev_subnet"
            virtual_network_name="dev_vnet"
            nic_name="dev_nic"
            location="indiasouthcentral"
            resource_group_name="dev_rg"
            vm_name="devvm"
            size="standard_b2ats_v2"
        }
    }
