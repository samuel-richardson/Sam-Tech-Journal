# Set Params

param(
[Parameter()][string]$ip,
[Parameter()][string]$dns

)

# Resolve DNS

for ($i = 0; $i -le 255; $i++ )
{

$res = Resolve-DnsName -DnsOnly $ip'.'$i -Server $dns -ErrorAction Ignore
if ($res) { write-host "$ip.$i $($res.NameHost)" }

}
