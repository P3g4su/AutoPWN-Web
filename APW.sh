#!/bin/bash

# Função para exibir um banner
banner() {
    echo "==============================================="
    echo "            Ferramenta de Pentest Web           "
    echo "           Automação de Exploração Web          "
    echo "==============================================="
    echo
}

# Função para inicializar diretório de resultados
inicializar_diretorio() {
    local target=$1
    echo "Inicializando diretório para $target..."
    mkdir -p "$target"
    echo
}

# Função para executar Nmap
executar_nmap() {
    local target=$1
    echo "Executando Nmap em $target..."
    nmap -sS -sV -p- -T4 "$target" -oN "$target/nmap_scan.txt"
    echo "Resultado do Nmap salvo em $target/nmap_scan.txt"
    echo
}

# Função para buscar subdomínios com Subfinder
executar_subfinder() {
    local target=$1
    echo "Executando Subfinder para subdomínios de $target..."
    subfinder -d "$target" -o "$target/subdomains.txt"
    echo "Subdomínios encontrados salvos em $target/subdomains.txt"
    echo
}

# Função para executar Dirb
executar_dirb() {
    local target=$1
    echo "Executando Dirb para busca de diretórios..."
    dirb "http://$target" -o "$target/dirb_scan.txt"
    echo "Resultado do Dirb salvo em $target/dirb_scan.txt"
    echo
}

# Função para executar Gobuster
executar_gobuster() {
    local target=$1
    echo "Executando Gobuster para força bruta de diretórios..."
    gobuster dir -u "http://$target" -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o "$target/gobuster_scan.txt"
    echo "Resultado do Gobuster salvo em $target/gobuster_scan.txt"
    echo
}

# Função para executar SQLMap
executar_sqlmap() {
    local target=$1
    echo "Executando SQLMap para injeção SQL em $target..."
    sqlmap -u "http://$target" --batch --random-agent --crawl=2 --level=5 --risk=3 -o "$target/sqlmap_scan.txt"
    echo "Resultado do SQLMap salvo em $target/sqlmap_scan.txt"
    echo
}

# Função para executar Metasploit (auxiliary scanner HTTP)
executar_metasploit() {
    local target=$1
    echo "Executando Metasploit Auxiliary HTTP Scanner em $target..."
    msfconsole -q -x "use auxiliary/scanner/http/http_version; set RHOSTS $target; run; exit" > "$target/metasploit_scan.txt"
    echo "Resultado do Metasploit salvo em $target/metasploit_scan.txt"
    echo
}

# Função para rodar Nessus (usuário deve configurar antes)
executar_nessus() {
    local target=$1
    echo "Executando Nessus scan em $target (supondo que já esteja configurado)..."
    echo "Inicie o Nessus manualmente e adicione o target: $target"
    echo
}

# Função principal de execução de todas as ferramentas
executar_pentest() {
    local target=$1
    inicializar_diretorio "$target"
    
    # Executar cada ferramenta
    executar_nmap "$target"
    executar_subfinder "$target"
    executar_dirb "$target"
    executar_gobuster "$target"
    executar_sqlmap "$target"
    executar_metasploit "$target"
    executar_nessus "$target"
    
    echo "Pentest completo em $target. Resultados organizados no diretório $target."
}

# Função para validar o endereço de IP ou domínio
validar_alvo() {
    if [[ -z "$1" ]]; then
        echo "Erro: Nenhum alvo foi fornecido. Utilize um IP ou domínio válido."
        exit 1
    fi
}

# Exibir o banner
banner

# Validar o alvo fornecido
target=$1
validar_alvo "$target"

# Executar o pentest
executar_pentest "$target"
