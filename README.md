# AutoPWN-Web

## Visão Geral

O **AutoPWN Web** é uma ferramenta de automação de pentest desenvolvida para profissionais de cibersegurança. Ela integra uma série de ferramentas de análise de segurança, permitindo a execução eficiente de testes de vulnerabilidades em aplicações web. O objetivo é fornecer uma solução abrangente e organizada para a detecção de fraquezas de segurança.

## Funcionalidades Principais

### 1. Varredura de Portas e Serviços
Utiliza o **Nmap** para realizar varreduras profundas, identificando portas abertas, serviços em execução e suas versões. Isso ajuda a mapear a superfície de ataque do alvo.

### 2. Descoberta de Subdomínios
Emprega o **Subfinder** para descobrir subdomínios associados ao alvo, expandindo o escopo da análise e ajudando a identificar áreas adicionais que podem ser vulneráveis.

### 3. Análise de Diretórios e Arquivos
Utiliza ferramentas como **Dirb** e **Gobuster** para realizar brute-force em diretórios e arquivos, permitindo identificar conteúdos ocultos ou sensíveis que possam ser explorados.

### 4. Injeção SQL
Implementa o **SQLMap**, que automatiza o processo de detecção e exploração de vulnerabilidades de injeção SQL, proporcionando uma análise aprofundada do potencial de exploração.

### 5. Análise de Versão de HTTP
Utiliza um scanner auxiliar do **Metasploit** para determinar a versão do servidor HTTP, ajudando a identificar potenciais vulnerabilidades conhecidas associadas a versões específicas.

### 6. Integração com Nessus
Permite a execução de scans com o **Nessus**, uma das ferramentas de gerenciamento de vulnerabilidades mais reconhecidas, desde que configurada previamente. Isso adiciona uma camada extra de análise detalhada.

## Requisitos do Sistema

- Sistema Operacional: Linux 
- Bash Shell
- Nmap
- Subfinder
- Dirb
- Gobuster
- SQLMap
- Metasploit Framework
- Nessus (opcional)

## Instalação

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/P3g4su/AutoPWN-Web
   cd AutoPWN-Web
   ```

2. **Instale as dependências**:

   Certifique-se de que todas as ferramentas necessárias estão instaladas e acessíveis no PATH.

   Exemplo de instalação no Ubuntu:

   ```bash
   sudo apt install nmap subfinder dirb gobuster sqlmap metasploit-framework
   ```

3. **Configuração do Nessus** (opcional):

   Siga as instruções no site oficial do Nessus para configuração inicial.

## Uso

Para executar a ferramenta, forneça o alvo (IP ou domínio) como argumento:

```bash
chmod +x APW.sh
./APW.sh <IP ou domínio>
```

### Exemplo de Execução:

```bash
chmod +x APW.sh
./APW.sh example.com
```

### Estrutura dos Resultados

Os resultados de cada ferramenta serão salvos em um diretório criado especificamente para o alvo. A estrutura será a seguinte:

```
<target>/
├── dirb_scan.txt
├── gobuster_scan.txt
├── nmap_scan.txt
├── sqlmap_scan.txt
├── subdomains.txt
└── metasploit_scan.txt
```

## Contribuições

Contribuições são bem-vindas! Para contribuir:

- Abra um issue para discutir melhorias.
- Sinta-se à vontade para enviar pull requests com correções ou novas funcionalidades.

## Licença

Este projeto é licenciado sob a **MIT License**. Consulte o arquivo LICENSE para mais informações.

