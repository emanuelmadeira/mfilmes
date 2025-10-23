# README
# 🎬 MFilmes

Aplicação web desenvolvida em **Ruby on Rails 8.0.3**, com o objetivo de gerenciar e exibir informações sobre filmes, incluindo comentários e usuários cadastrados.  
O projeto utiliza **PostgreSQL** como banco de dados e foi configurado para **deploy automático via Render**.

---

## 🚀 Tecnologias Utilizadas

- **Ruby:** 3.4.5 
- **Rails:** 8.0.3  
- **PostgreSQL:** Banco de dados principal  
- **Puma:** Servidor web  
- **Bootstrap / CSS:** Estilização da interface  
- **Devise (ou autenticação própria):** Controle de login e cadastro de usuários  
- **Dockerfile:** Configuração para build em produção (Render)

---

## ⚙️ Configuração do Projeto (Local)

### 1️Clonar o repositório

```bash
git clone https://github.com/emanuelmadeira/mfilmes
cd mfilmes

2️Instalar dependências
bundle install

3️ Configurar o banco de dados

Em config/puma.rb
    Mudar isso :
    port ENV['PORT'] || 80
    
    Para isso:
    port ENV['PORT'] || 3000

Crie e rode as migrações:
rails db:create db:migrate


Rodando o Servidor Localmente

rails server