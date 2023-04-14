param (
    [string]$filename
)

# Substituir "arquivo" pelo nome do arquivo fornecido como parâmetro
$command = "ml /Cx /coff $filename.asm /link /SUBSYSTEM:console /out:${filename}exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib"

# Executar o comando
Invoke-Expression $command