$key = New-Object byte[](512)
$rng = [System.Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($key)
[Convert]::ToBase64String($key) | Out-File "C:\Projects\Experiments\encrypted_data_bag_secret" -encoding "UTF8"
[array]::Clear($key, 0, $key.Length)