🛒 
MercadoLivreChallenge
Este é o projeto MercadoLivreChallenge, um aplicativo iOS para exibir e explorar produtos do Mercado Livre. O app permite visualizar detalhes do produto, incluindo imagens, avaliações e outras informações relevantes, usando uma arquitetura MVVM para manter o código limpo e organizado.
Essa ainda é a versão 1.0 e em breve terá novas funcionalidades, como lista de favoritos, Light e DarkMode e etc.

🚀
 Funcionalidades
Busca de Produtos: Encontre produtos por meio da integração com a API do Mercado Livre.
Detalhes do Produto: Visualize informações detalhadas, incluindo nome, preço, descrição, e avaliações.
Galeria de Imagens com Carrossel: Deslize para ver várias imagens de cada produto com indicador de página.

🛠️
Arquitetura e Tecnologias
O projeto foi desenvolvido com Swift e utiliza a arquitetura MVVM para manter o código modular e de fácil manutenção.

Arquitetura MVVM: Facilita a separação de responsabilidades e a testabilidade.
Kingfisher: Para carregar e cache de imagens.
UIKit com CollectionView: Exibição em carrossel das imagens do produto.
Auto Layout Programático: Configurações de layout programático para flexibilidade e manutenção de UI.
API Mercado Livre: Integração com a API para busca e exibição de produtos.
    
🧪 
Testes
A arquitetura MVVM permitiu criar testes unitários simples e eficazes para os ViewModels e Models que incluem: 
Sucesso e Falha na Busca dos produtoa
Atualização do Carrossel de Imagens
Exibição de Avaliações e Garantia dos produtos
💻 Pré-requisitos
iOS 13.0+
Xcode 12.0+
Swift 5

📦 
Instalação
Clone o repositório:

bash
Copiar código
git clone https://github.com/renatogirao/MercadoLivreChallenge.git
Abra o projeto no Xcode:

bash
Copiar código
cd MercadoLivreChallenge
open MercadoLivreChallenge.xcodeproj
Instale as dependências com cocoaPods e execute o projeto!

Nota: Este projeto é um projeto pessoal e não tem afiliação oficial com o Mercado Livre!



