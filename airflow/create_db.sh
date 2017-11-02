#!/usr/bin/env bash

mysql \
    -uroot \
    #-proot \
    -e "CREATE DATABASE airflow
        DEFAULT CHARACTER SET utf8
        DEFAULT COLLATE utf8_general_ci;

        GRANT ALL PRIVILEGES
        ON airflow.*
        TO 'airflow'@'localhost'
        IDENTIFIED BY 'airflow';

        FLUSH PRIVILEGES;"
