[xml]$xml = @"
<?xml version="1.0"?>
<WebPart xmlns="http://schemas.microsoft.com/WebPart/v2">
   <Assembly>AssemblyName(with no .dll extension), Version=VersionNumber, Culture=Culture, PublicKeyToken=PublicKeyToken</Assembly>
   <TypeName>WebPartNamespace.WebPartClassName</TypeName>
   <Title>DefaultWebPartTitle</Title>
   <Description>WebPartDescription</Description>
</WebPart>
"@

$ns = @{dns="schemas.microsoft.com/WebPart/v2"}
$items = Select-Xml -Xml $xml -XPath '//dns:WebPart' -Namespace $ns
$items | Foreach {$_.Node.Name}

[System.Xml.XmlNamespaceManager] $nsMgr = New-Object -TypeName System.Xml.XmlNamespaceManager($xml.NameTable)
$nsMgr.AddNamespace("ns", "http://schemas.microsoft.com/WebPart/v2");
$nodes = $xml.SelectNodes("/ns:WebPart/ns:Assembly", $nsMgr);
$nodes
