# Dockerfile

# Define a imagem base
FROM ruby:3.2.1

# Instala dependências
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo Gemfile e Gemfile.lock do projeto para o container
COPY Gemfile Gemfile.lock ./

# Instala as gems do projeto
RUN gem install bundler && bundle install

# Copia todos os arquivos do projeto para o container
COPY . .

# Define a porta a ser exposta
EXPOSE 3000

# Roda os comandos de inicialização do projeto
CMD ["rails", "server", "-b", "0.0.0.0"]
