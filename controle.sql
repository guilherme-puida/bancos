CREATE ROLE administrador;
GRANT ALL ON tf1GuilhermeMoreiraAnaPereira.* TO administrador;

CREATE USER dono IDENTIFIED BY '@dono';
GRANT administrador TO dono;

CREATE USER socio IDENTIFIED BY 'socio!!';
GRANT administrador TO socio;

CREATE ROLE funcionario;
GRANT INSERT, SELECT, DELETE ON tf1GuilhermeMoreiraAnaPereira.* TO funcionario;

CREATE USER maria IDENTIFIED BY 'maria123';
GRANT funcionario TO maria;

CREATE USER jose IDENTIFIED BY 'zezao';
GRANT funcionario TO jose;

FLUSH PRIVILEGES;
