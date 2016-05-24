<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnormalian%2Feclipse-wildfly-development-environment%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fnormalian%2Feclipse-wildfly-development-environment%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

# Install WildFly cluster and Eclipse VM with ARM templates
This template deploys below vms.
- A WildFly master node on an CentOS 7.x virtual machines and multiple WildFly slave nodes on other multiple VMs
- An Eclipse Windows Server VM

These templates also provision a storage account, virtual network, availability sets, public IP addresses and network interfaces required by the installation.
![WildFly Eclipse architecture](https://raw.githubusercontent.com/normalian/eclipse-wildfly-development-environment/master/architecture-fig.PNG "WildFly Eclipse architecture")

## Reference
- Install JDK and Eclipse into Windows Server VM with ARM templates https://github.com/normalian/eclipse-script-windows-vm
- Deploy WildFly multi nodes cluster with ARM https://github.com/normalian/apache-wildfly-template
