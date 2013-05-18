server {
  listen       80;
  server_name  jujuca.com;

  return 301 http://www.jujuca.com$request_uri;
}

server {
  listen       80;
  server_name  www.jujuca.com;

  root /www/jujuca/current;

  error_page   500 502 503 504  /50x.html;
  location = /50x.html {
    root   html;
  }
}