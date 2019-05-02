#include <service>
#include <net/interfaces>
#include <cstdio>

void Service::start()
{
  auto& inet = net::Interfaces::get(0);
  inet.network_config({10,0,0,59}, {255,255,255,0}, {10,0,0,1});
  const uint16_t port = 666;

  auto& server = inet.tcp().listen(port);
  server.on_connect(
  [port] (auto conn)
  {
    auto* buffer = new std::vector<uint8_t>;
    // retrieve binary
    conn->on_read(9000,
    [conn, buffer] (auto buf)
    {
      buffer->insert(buffer->end(), buf->begin(), buf->end());
    })
    .on_close(
    [buffer] () {
      printf("* Blob size: %zu b  at %p\n", buffer->size(), buffer->data());
      delete buffer;
    });
  });
}
