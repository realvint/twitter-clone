# Twitter-clone

Аналог Twitter на Ruby on Rails

## В проекте используется:
* Ruby 3.1.3
* Rails 7.0.4
* PostgreSQL 14.6
* Redis
* Node JS 16
* Yarn 1.22

## Запуск проекта по классике
1. Настроить локальное окружение (Ruby etc.)
2. Скачать или склонировать репозиторий
3. Запустить bundler и yarn для установки нужных гемов и зависимостей

```bash
$ bundle install
$ yarn
```
4. Создаём `.env` файл по примеру `.env.example`
```bash
$ cp .env.example .env
```
При необходимости запустить локально PostgreSQL можно используя Docker

(`service.yml` настроен для запуска PostgreSQL)
```bash
$ docker-compose -f services.yml up -d
```
5. Создать и настроить базу данных для проекта
```bash
$ rails db:prepare
```
6. Запустить проект
```bash
$ bin/dev
```
