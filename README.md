# Cripto Currency - Flutter App com MVVM + Cubit

Este projeto Flutter demonstra a arquitetura **MVVM** (Model-View-ViewModel) com uso de **Cubit** para gerenciamento de estado. A aplicação consome a API da CoinMarketCap para exibir as cripto moedas disponíveis. A estrutura segue princípios de organização limpa, modularidade e separação de responsabilidades.
![image](https://github.com/user-attachments/assets/7846834d-8bc3-48a1-9d19-859c5efeadfa)

---

## 🚀 Funcionalidades

- Listagem de cripto moedas
- Pesquisa de cripto moedas por sigla
- Gerenciamento de estado com Cubit
- Integração com API REST
- Arquitetura escalável com MVVM

---

## 🧱 Arquitetura MVVM

Este projeto segue o padrão **MVVM** com separação de responsabilidades em camadas:

- **View (Camada de UI):** Exibe os dados na tela e envia ações do usuário para a ViewModel.
- **ViewModel:** Contém a lógica da tela, como requisições e controle de estados. Utilizamos o `Bloc` como ViewModel.
- **Modelos:** Representam os dados retornados da API.
- **Repository:** Camada intermediária entre a ViewModel e os serviços.
- **Service:** Responsável por realizar requisições HTTP.
- **Configs:** Ajuda na configuração de ambiente e criação de ViewModels.

---

## 🗂️ Estrutura de Pastas

```
lib/
│
├── configs/
│ ├── environment_helper.dart # Define ambiente da aplicação
│ └── factory_viewmodel.dart # Cria instâncias de viewmodels
│
├── core/
│ └── service/
│   └── http_service.dart # Lida com requisições HTTP
│
├── data/
│ └── datasource/
|   └── remote_datasource.dart # Lida com a logica da requisição e dados vindo da API
| └── repositories/
|   └── currency_repository.dart # Centraliza acesso aos dados
|
├── domain
| └── entities
|   └── core/
|     ├── request_state_entity.dart # entidade para cada estado disponível para tela
|     └── http_response_entity.dart # entidade para valor retornado das requisições http
|   └── currency/
|     └── currency_entity.dart # entidade da cripto moeda
|
├── ui/
| ├─ currency/
│ ├── pages/ # Telas principais da funcionalidade de moedas
│ ├── viewmodel/ # Cubit, eventos e estados (lógica de negócio)
│ └── widgets/ # Componentes reutilizáveis para moedas
│
└── main.dart # Ponto de entrada do app
```

## Começo 
1. Clonando o projeto
2. Instalar dependencias com flutter pub get
3. por fim flutter run

---
![image](https://github.com/user-attachments/assets/5f40cf9a-6bdd-4349-8486-14603782483c)
![image](https://github.com/user-attachments/assets/7bbe7607-0457-4314-8a1c-122e02c51984)
![image](https://github.com/user-attachments/assets/7a8bdd92-2945-44da-bf0b-5f449db64c08)



