# 🌐 Terraform Azure – Infraestrutura como Código

Este repositório contém a implementação de uma arquitetura de **Infraestrutura como Código (IaC)** utilizando **Terraform** para provisionar recursos no **Microsoft Azure** seguindo boas práticas, modularização e separação por ambientes.

---

## 🧱 Visão Geral da Arquitetura

A arquitetura foi estruturada para garantir organização, escalabilidade e versionamento seguro do estado (tfstate):

| Camada | Responsabilidade |
|--------|------------------|
| **bootstrap** | Cria os recursos necessários para armazenar o arquivo de estado remoto (backend) |
| **modules** | Módulos reutilizáveis que representam recursos da cloud |
| **env/** | Pastas de ambientes (dev, hml, prod), cada uma com seu próprio ciclo |
| **backend remoto** | `Storage Account + Container` para armazenar o `terraform.tfstate` com segurança |

---

## 📁 Estrutura do Repositório

├── bootstrap/ # Criação do backend remoto (executado apenas 1 vez)
├── modules/ # Módulos reutilizáveis de infraestrutura
├── env/ # Separação por ambientes
│ ├── dev/
│ ├── hml/
│ └── prod/
└── README.md


---

## ⚙️ Pré-requisitos

| Requisito | Versão / Observação |
|----------|---------------------|
| Terraform | >= 1.8 |
| Azure CLI | Instalado e autenticado |
| Subscription Azure | Definida antes de iniciar o `terraform plan` |

Login no Azure:
```sh
az login
```

🚀 Execução do Projeto
    1️⃣ Criar o backend remoto (apenas 1 vez)

    cd bootstrap
    terraform init
    terraform apply

    >> Após a execução, guarde os outputs:
    backend_rg_name
    backend_storage_account_name
    backend_container_name
    >> Eles serão usados automaticamente no backend remoto dos ambientes.

    2️⃣ Executar um ambiente (ex.: desenvolvimento - dev)

    cd env/dev
    terraform init
    terraform plan
    terraform apply
    >> Os ambientes não dependem uns dos outros, permitindo deploy individual de dev, hml e prod.

    🔐 Segurança

    Nenhum arquivo .tfstate fica armazenado localmente

    Nunca envie credenciais ou .tfvars sensíveis para o repositório

    Recomenda-se usar Azure AD + RBAC para controle de acesso ao backend remoto

    🧭 Próximas Evoluções (Roadmap)

    Adicionar CI/CD no GitHub Actions ou Azure DevOps

    Implementar controle de variáveis sensíveis com Key Vault

    Criar módulos adicionais

    Deploy automático por Pull 

    
    👨‍💻 Autor

    Projeto mantido por **Rai Freire**  
    📌 Profissional de Cloud & Dados  
    🔗 GitHub: https://github.com/raifreire  
    💼 LinkedIn: https://www.linkedin.com/in/raifreire/



    ⭐ Dica

    Se este projeto foi útil, considere deixar uma estrela no repositório. Isso ajuda no versionamento e evolução contínua.



