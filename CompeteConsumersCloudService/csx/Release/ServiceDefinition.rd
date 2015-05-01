<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="CompeteConsumersCloudService" generation="1" functional="0" release="0" Id="fe2cd079-00cc-4ed0-a7d9-6df151224cfc" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="CompeteConsumersCloudServiceGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="ProducerService:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/LB:ProducerService:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Certificate|ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapCertificate|ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </maps>
        </aCS>
        <aCS name="Certificate|SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapCertificate|SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </maps>
        </aCS>
        <aCS name="ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </maps>
        </aCS>
        <aCS name="ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </maps>
        </aCS>
        <aCS name="ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </maps>
        </aCS>
        <aCS name="ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </maps>
        </aCS>
        <aCS name="ProducerService:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
          </maps>
        </aCS>
        <aCS name="ProducerService:ServiceBusConnectionString_Producer" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapProducerService:ServiceBusConnectionString_Producer" />
          </maps>
        </aCS>
        <aCS name="ProducerServiceInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapProducerServiceInstances" />
          </maps>
        </aCS>
        <aCS name="SubscriberService:MessageStorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapSubscriberService:MessageStorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapSubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </maps>
        </aCS>
        <aCS name="SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapSubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </maps>
        </aCS>
        <aCS name="SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapSubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </maps>
        </aCS>
        <aCS name="SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapSubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </maps>
        </aCS>
        <aCS name="SubscriberService:ServiceBusConnectionString_Subscriber" defaultValue="">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapSubscriberService:ServiceBusConnectionString_Subscriber" />
          </maps>
        </aCS>
        <aCS name="SubscriberServiceInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/MapSubscriberServiceInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:ProducerService:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput">
          <toPorts>
            <inPortMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </toPorts>
        </lBChannel>
        <sFSwitchChannel name="SW:ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp">
          <toPorts>
            <inPortMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
          </toPorts>
        </sFSwitchChannel>
        <sFSwitchChannel name="SW:SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp">
          <toPorts>
            <inPortMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberService/Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
          </toPorts>
        </sFSwitchChannel>
      </channels>
      <maps>
        <map name="MapCertificate|ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" kind="Identity">
          <certificate>
            <certificateMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </certificate>
        </map>
        <map name="MapCertificate|SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" kind="Identity">
          <certificate>
            <certificateMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberService/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </certificate>
        </map>
        <map name="MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </setting>
        </map>
        <map name="MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </setting>
        </map>
        <map name="MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </setting>
        </map>
        <map name="MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </setting>
        </map>
        <map name="MapProducerService:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
          </setting>
        </map>
        <map name="MapProducerService:ServiceBusConnectionString_Producer" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/ServiceBusConnectionString_Producer" />
          </setting>
        </map>
        <map name="MapProducerServiceInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerServiceInstances" />
          </setting>
        </map>
        <map name="MapSubscriberService:MessageStorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberService/MessageStorageConnectionString" />
          </setting>
        </map>
        <map name="MapSubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberService/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </setting>
        </map>
        <map name="MapSubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberService/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </setting>
        </map>
        <map name="MapSubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberService/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </setting>
        </map>
        <map name="MapSubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberService/Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </setting>
        </map>
        <map name="MapSubscriberService:ServiceBusConnectionString_Subscriber" kind="Identity">
          <setting>
            <aCSMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberService/ServiceBusConnectionString_Subscriber" />
          </setting>
        </map>
        <map name="MapSubscriberServiceInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberServiceInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="ProducerService" generation="1" functional="0" release="0" software="C:\Users\hakeemsm\Documents\Learning\Azure\PatternsRedux\CompetingConsumersAzure.Topshelf\CompeteConsumersCloudService\csx\Release\roles\ProducerService" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp" />
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp" portRanges="3389" />
              <outPort name="ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SW:ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
              <outPort name="SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SW:SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="" />
              <aCS name="ServiceBusConnectionString_Producer" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;ProducerService&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;ProducerService&quot;&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;SubscriberService&quot;&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
            <storedcertificates>
              <storedCertificate name="Stored0Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
                </certificate>
              </storedCertificate>
            </storedcertificates>
            <certificates>
              <certificate name="Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
            </certificates>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerServiceInstances" />
            <sCSPolicyUpdateDomainMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerServiceUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerServiceFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="SubscriberService" generation="1" functional="0" release="0" software="C:\Users\hakeemsm\Documents\Learning\Azure\PatternsRedux\CompetingConsumersAzure.Topshelf\CompeteConsumersCloudService\csx\Release\roles\SubscriberService" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp" portRanges="3389" />
              <outPort name="ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SW:ProducerService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
              <outPort name="SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SW:SubscriberService:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="MessageStorageConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="" />
              <aCS name="ServiceBusConnectionString_Subscriber" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;SubscriberService&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;ProducerService&quot;&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;SubscriberService&quot;&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
            <storedcertificates>
              <storedCertificate name="Stored0Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberService/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
                </certificate>
              </storedCertificate>
            </storedcertificates>
            <certificates>
              <certificate name="Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
            </certificates>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberServiceInstances" />
            <sCSPolicyUpdateDomainMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberServiceUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/SubscriberServiceFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="ProducerServiceUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="SubscriberServiceUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="ProducerServiceFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="SubscriberServiceFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="ProducerServiceInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="SubscriberServiceInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="c65a9dcc-ecae-4426-ac77-321075930cf7" ref="Microsoft.RedDog.Contract\ServiceContract\CompeteConsumersCloudServiceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="e09b0c64-39e9-4b3e-b28c-74060b0d4ff2" ref="Microsoft.RedDog.Contract\Interface\ProducerService:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/CompeteConsumersCloudService/CompeteConsumersCloudServiceGroup/ProducerService:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>