# 🛒 MercadoLivreChallenge

Este é o projeto **MercadoLivreChallenge**, um aplicativo iOS para exibir e explorar produtos do Mercado Livre. O app permite visualizar detalhes do produto, incluindo imagens, avaliações e outras informações relevantes, usando uma arquitetura MVVM para manter o código limpo e organizado.

## 🚀 Funcionalidades

- **Busca de Produtos:** Encontre produtos por meio da integração com a API do Mercado Livre.
- **Detalhes do Produto:** Visualize informações detalhadas, incluindo nome, preço, descrição, e avaliações.
- **Galeria de Imagens com Carrossel:** Deslize para ver várias imagens de cada produto com indicador de página.
  
## 🛠️ Arquitetura e Tecnologias

O projeto foi desenvolvido com **Swift** e utiliza a arquitetura **MVVM** para manter o código modular e de fácil manutenção.

- **Arquitetura MVVM:** Facilita a separação de responsabilidades e a testabilidade, além de ser uma das arquiteturas mais usadas no mercado atualmente.
- **Kingfisher:** Para carregar as imagens de forma assíncrona, evitando bugs visuais e também uso de cache de imagens.
- **CollectionView:** Exibição em carrossel das imagens do produto para melhor experiência do usuário.
- **Auto Layout Programático:** Configurações de layout programático para flexibilidade e manutenção de UI, menor suscetibilidade a bugs visuais, além de melhor desempenho da IDE, evitando renderização e etc.
- **API Mercado Livre:** Integração com a API para busca e exibição de produtos, categorias e etc.

## 🧪 Testes

A arquitetura MVVM permitiu criar testes unitários simples e eficazes para os `ViewModels`, `ViewControllers` e `Models`, que incluem:

- **Sucesso e Falha na Busca de Produto**
- **Atualização do Carrossel de Imagens**
- **Exibição de Avaliações e Garantia**

## 💻 Pré-requisitos

- **iOS 13.0+**
- **Xcode 12.0+**
- **Swift 5**

## 📦 Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/seuusuario/MercadoLivreChallenge.git
Abra o projeto no Xcode:

``` cd MercadoLivreChallenge ```

``` open MercadoLivreChallenge.xcodeproj ```
    
   Instale as dependências com CocoaPods e execute o projeto!
   
   **Nota: Este projeto é pessoal e não tem nenhuma afiliação oficial com o Mercado Livre!**
