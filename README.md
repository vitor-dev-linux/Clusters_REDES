### Instruções de uso do ambiente docker ###
* Execute
```
./install.sh
```
* Abra o POST_Install que existe dentro de cluster2 e abra a imagem e faça o pedido para poder acessar o DNS no navegador.


![](/home/vmoreira/Downloads/REDES/cluster2/POS_Install/DNS%20no%20navegador.png)
```
sudo nano /etc/resolv.conf
```

### Observações
* Ainda falta consigurar o cluster1 para usar a hora do cluster2 mas acho melhor fazer isso manualmente porque na verdade a config no cluster1 deve ocorrer na verdade na vm1.

### Possível solução:
//chat
[Link](https://chatgpt.com/c/671651e6-9c5c-800c-aaca-0eeea8fe1a9e)

-------------------chat GPT Inicio

O erro que você está vendo (`bash: nano: command not found`) indica que o editor de texto `nano` não está instalado no contêiner do seu servidor web. Isso é comum em contêineres baseados em Nginx, pois eles geralmente são minimalistas e não incluem muitos pacotes.

### Alternativas para Editar o `ntp.conf`

1. **Usar `vi` ou `vim`**:
   - Se `vi` ou `vim` estiver disponível, você pode usar um desses editores para editar o arquivo:
   ```bash
   vi /etc/ntp.conf
   ```
   - Para editar no `vi`, pressione `i` para entrar no modo de inserção, faça suas alterações e depois pressione `ESC`, seguido de `:wq` para salvar e sair.

2. **Instalar um Editor de Texto**:
   - Se você deseja usar `nano` ou outro editor, você pode instalar um diretamente no contêiner. Tente executar:
   ```bash
   apt-get update
   apt-get install nano
   ```
   - Se o comando `apt-get` não estiver disponível, pode ser que você esteja usando uma imagem minimalista que não tem esse gerenciador de pacotes.

3. **Criar um Novo Arquivo `ntp.conf` Localmente**:
   - Você pode criar um novo arquivo de configuração localmente na sua máquina e copiá-lo para o contêiner. Primeiro, crie um arquivo chamado `ntp.conf` na sua máquina com o conteúdo desejado:
   ```plaintext
   server <IP_do_cluster2_ntp> iburst
   ```
   - Depois, copie esse arquivo para o contêiner:
   ```bash
   docker cp ntp.conf cluster1-web-1:/etc/ntp.conf
   ```

4. **Usar o Comando `echo` para Adicionar a Linha**:
   - Se você só precisa adicionar uma linha ao arquivo e não precisa de um editor, pode usar o comando `echo`:
   ```bash
   echo "server <IP_do_cluster2_ntp> iburst" >> /etc/ntp.conf
   ```

### Verificação

Depois de editar ou substituir o arquivo `ntp.conf`, não esqueça de reiniciar o serviço NTP:
```bash
service ntp restart
```

E verifique a sincronização com:
```bash
ntpq -p
```

Se você tiver mais dúvidas ou precisar de mais assistência, sinta-se à vontade para perguntar!

-------------------chat GPT Fim

