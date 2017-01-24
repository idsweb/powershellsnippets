[xml]$xml = @"
<?xml version="1.0"?>
<WebPart xmlns="http://schemas.microsoft.com/WebPart/v2">
   <Assembly>AssemblyName(with no .dll extension), Version=VersionNumber, Culture=Culture, PublicKeyToken=PublicKeyToken</Assembly>
   <TypeName>WebPartNamespace.WebPartClassName</TypeName>
   <Title>DefaultWebPartTitle</Title>
   <Description>WebPartDescription</Description>
</WebPart>
"@

# XML can be treated as an object, or selected using XPath
# When dealing with a default namespace as above add it to your XPath

$ns = @{dns="http://schemas.microsoft.com/WebPart/v2"}
$items = Select-Xml -Xml $xml -XPath '//dns:WebPart' -Namespace $ns
# $items | Foreach {Write-Host $_.Node.Name}

[xml]$xml2 = @"
<?xml version="1.0"?>
<table xmlns="http://www.w3schools.com/furniture" xmlns:foo="http://www.w3schools.com/furniture" >
  <name>African Coffee Table</name>
  <width>80</width>
  <length>120</length>
</table> 
"@

# Get the value of $xml2.table
# $xml2.table.GetType() #returns XmlElement
# $xml2.table.name.GetType() #returns string

#$xml2.table.AppendChild($xml2.CreateElement("foo")) # Gives output <foo xmlns="" />

# Add a namespace to the namespace manager
[System.Xml.XmlNamespaceManager] $nsm = new-object System.Xml.XmlNamespaceManager $xml2.NameTable
$nsm.AddNamespace("foo", "http://www.w3schools.com/furniture")

# This adds the namespace with the uri
# $xml2.table.AppendChild($xml2.CreateElement("foo:bar", $nsm)) #Gives <foo:bar xmlns:foo=" xmlns xml foo" />

# This adds the namespace WITHOUT the uri
$xml2.table.AppendChild($xml2.CreateElement("foo:bar", $nsm.LookupNamespace("foo"))) # Gives <foo:bar /> />

# Note the empty element is of type string so append to add a further one WONT WORK
# Write-host "bar is of type " + $xml2.table.bar.GetType() # Returns string

Write-Host $xml2.InnerXml
