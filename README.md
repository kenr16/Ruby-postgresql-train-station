CREATE DATABASE train_database;
\c train_database;

CREATE TABLE "cities" (
"id"  SERIAL ,
"name" VARCHAR ,
PRIMARY KEY ("id")
);

CREATE TABLE "trains" (
"id"  SERIAL ,
"name" VARCHAR ,
"type" VARCHAR ,
PRIMARY KEY ("id")
);

CREATE TABLE "stops" (
"id"  SERIAL ,
"city_id" INTEGER ,
"train_id" INTEGER ,
"name" VARCHAR ,
"time" TIMESTAMP ,
PRIMARY KEY ("id")
);

CREATE DATABASE train_database_test WITH TEMPLATE train_database;
