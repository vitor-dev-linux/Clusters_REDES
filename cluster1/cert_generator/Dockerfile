FROM alpine:latest

# Instalar dependências necessárias
RUN apk add --no-cache curl openssl

# Baixar e instalar o mkcert manualmente
RUN curl -Lo /usr/local/bin/mkcert https://dl.filippo.io/mkcert/latest?for=linux/amd64 \
    && chmod +x /usr/local/bin/mkcert

# Criar um diretório para os certificados
RUN mkdir -p /certs

# Gerar o certificado autoassinado
RUN mkcert -install && mkcert -cert-file /certs/cert.pem -key-file /certs/key.pem "localhost"

# Definir o ponto de montagem para compartilhar os certificados
VOLUME ["/certs"]
