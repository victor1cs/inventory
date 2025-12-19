# 📦 Sistema de Gerenciamento de Inventário

Sistema desenvolvido para gerenciar o estoque de produtos de uma loja de iPhones, substituindo o controle manual via planilhas Excel e automatizando o envio diário de relatórios via WhatsApp.

## 🎯 Objetivo

Este projeto foi criado para resolver problemas identificados no gerenciamento de estoque de uma loja de iPhones:

- **Problema 1**: Controle de estoque feito manualmente em planilhas Excel
- **Problema 2**: Falta de histórico de produtos vendidos (itens eram apagados para manter a planilha atualizada)
- **Problema 3**: Trabalho manual e repetitivo de formatação e envio diário de relatórios de estoque via WhatsApp

## ✨ Funcionalidades Principais

### 📋 Gerenciamento de Produtos
- Cadastro completo de produtos com informações detalhadas:
  - Nome do produto
  - Categoria
  - Cor
  - Armazenamento
  - Condição (Novo/Usado)
  - Status (Em Estoque/Vendido)
  - Preço
  - Porcentagem de bateria
  - Descrição

### 📁 Categorias
- Sistema de categorias para facilitar a organização e consulta dos produtos
- Categorias pré-configuradas: Celular, Tablet, Notebook, Smartwatch, Smart TV, AirPods, Acessórios

### 📊 Histórico Completo
- **Diferencial principal**: Todos os produtos vendidos são mantidos no sistema com status "Vendido"
- Histórico completo de vendas preservado
- Possibilidade de consultar produtos vendidos a qualquer momento

### 🛒 Venda de Produtos (Essa função seria para ter o estoque atualizado 100%)
- Botão "Vender" que marca automaticamente o produto como vendido
- Validação para garantir que apenas produtos em estoque possam ser vendidos 
- Atualização automática do status

### 📱 Relatórios Automáticos
- **Job agendado diariamente** às 9h da manhã
- Geração automática de relatório com todos os produtos em estoque
- Formatação pronta para envio via WhatsApp
- Elimina o trabalho manual de formatação de mensagens

## 🚀 Tecnologias Utilizadas

- **Ruby on Rails 8.0** - Framework web
- **PostgreSQL** - Banco de dados
- **Docker & Docker Compose** - Containerização
- **Sidekiq** - Processamento de jobs em background
- **Redis** - Fila de jobs
- **Devise** - Autenticação de usuários
- **Sidekiq Cron** - Agendamento de tarefas

