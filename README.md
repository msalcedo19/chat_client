# Proyecto Distribución

Para este proyecto se uso como base el código de chatClient provisto por Nicolas Cardozo.
Asumiendo que se probara en la misma máquina siga las siguientes instrucciones:

Uso: 
-------------------
  1. Abrir consola dentro de la carpeta chatclient
  2. Ejecutar el comando **iex --sname nombre@localhost -S mix** donde nombre es el nombre que se desee para el cliente
  3. Ejecutar el comando **Chatclient.Application.start 1,1**
    1. Ejecutar los pasos anteriores dependiendo la cantidad de clientes que se desean
  4. Ejecutar el comando **Chatclient.send_message2 :####@localhost, :connect, duration** donde #### es el nombre del cliente con el cual se desea comunicar y duration es la cantidad de tiempo en milisegundos que durara la conexión
  5. Ejecutar el comando **Chatclient.send_message cliente@localhost, message** donde message es el mensaje que se le quiere enviar al cliente
  6. Al momento de enviar un mensaje a un cliente con el cual no se tiene tiempo disponible se mostrara el mensaje **"No Time"**. Por otro lado, al momento de enviar un mensaje a un cliente que no esta conectado a la aplicación se mostrara el mensaje **"impossible connection"**.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `chatclient` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chatclient, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/chatclient](https://hexdocs.pm/chatclient).

