create database blog;
use blog;
create table usuario(
    id int not null auto_increment,
    nome varchar(50)  not null,
    email varchar(255) not null,
    senha varchar(60) not null,
    data_criacao datetime not null default current_timestamp,
    ativo tinyint not null default '0',
    adm tinyint not null default '0',
    PRIMARY KEY (id)
);

create table post (
    id int not null auto_increment,
    titulo varchar(255) not null,
    texto text not null,
    usuario_id int not null,
    data_criacao datetime not null default current_timestamp,
    data_postagem datetime not null,
    PRIMARY KEY (id),
    KEY fk_post_usuario_idx (usuario_id),
    constraint fk_post_usuario foreign key (usuario_id) references usuario (id)
);

create table avaliacao(
    id int NOT NULL AUTO_INCREMENT,
    nota int NOT NULL, 
    comentario varchar(255) NOT NULL,
    usuario_id int NOT NULL,
    post_id int NOT NULL,
    data_criacao datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_avaliacao_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id),
    CONSTRAINT fk_avaliacao_post FOREIGN KEY (post_id) REFERENCES post (id)
);