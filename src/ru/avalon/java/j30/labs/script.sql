create table USERINFO
(
    ID int primary key,
    "NAME" varchar(255),
    SURNAME varchar(255)
);

create table ROLES
(
    ID int,
    "NAME" varchar(255) not null,
    constraint UN_ID_ROLES unique(ID),
    constraint PK_NAME_ROLES primary key ("NAME")
);

create table "USER"
(
    ID int generated always as identity(start with 1, increment by 1),
    EMAIL varchar(255) not null,
    PASSWORD varchar(255) not null,
    INFO int not null references USERINFO(ID),
    "ROLE" int not null references ROLES(ID),
    constraint PK_USER primary key(EMAIL),
    constraint UK_ID_USER unique(ID),
    constraint UK_INFO_USER unique(INFO)
);

create table "ORDER"
(
    ID int generated always as identity(start with 1, increment by 1),
    "USER" int not null references "USER"(ID),
    CREATED timestamp not null,
    constraint UK_ID_ORDER unique(ID)
);

create table SUPPLIER
(
    ID int generated always as identity(start with 1, increment by 1),
    "NAME" varchar(255) not null primary key,
    ADDRESS varchar(255),
    PHONE varchar(255) not null,
    REPRESENTATIVE varchar(255),
    constraint UK_ID_SUPPLIER unique(ID)
);

create table PRODUCT
(
    ID int generated always as identity(start with 1, increment by 1),
    CODE varchar(255) not null primary key,
    TITLE varchar(255) not null,
    SUPPLIER int not null references SUPPLIER(ID),
    INITIAL_PRICE double not null,
    RETAIL_VALUE double not null,
    constraint UK_ID_PRODUCT unique(ID)
);

create table ORDER2PRODUCT
(
    "ORDER" int not null,
    PRODUCT int not null,
    constraint FK_ORDER2PRODUCT_ORDER 
        foreign key ("ORDER") references "ORDER"(ID),
    constraint FK_ORDER2PRODUCT_PRODUCT
        foreign key (PRODUCT) references PRODUCT(ID)
);
