

## Описание парсера

Репозиторий содержит Rails-приложение, упакованное в docker.

Приложение позволяет создавать задачи, в рамках каждой можно передать неограниченное число адресов ресурсов, которые будут опрошены в фоновом режиме (faraday + sidekiq).

Из полученного ответа будет извлечен заголовок `<title>`, если он есть. В случае неудачи будет выведено сообщение о причине.

Динамического обновления страницы задачи нет, для результата страничку придется обновить руками.

Структурные компоненты: Rails 6, Sidekiq, Redis, Postgresql (выделены в отдельные сервисы).

Дашборд sidekiq'а доступен по адресу `/sidekiq`, реквизиты доступа необходимо указать в .env-файле.

**ВАЖНО**

URL должен быть fully qualified (с указание протокола). Запрос адреса вида `ikea.com` не будет выполнен.

---

## Демо

[https://worki.beonrails.ru/](https://worki.beonrails.ru/)

---

## Инструкция по установке и запуску

Сначала:

```
$ git clone git@github.com:oleg-cnnr/worki-test.git
$ cd worki-test/
$ cp .env.example .env
$ docker build .
$ docker-compose up -d
```

Разберемся с базой:

```
$ docker exec -it worki-test_postgres_1 bash
$ su - postgres
$ psql
$ CREATE USER worki WITH PASSWORD 'password';
$ ALTER ROLE worki WITH LOGIN CREATEDB;
```

Выходим из контейнера базы и продолжаем внутри контейнера приложения:

```
$ docker exec -it worki-test_app_1 bash
$ rake db:create
$ rake db:migrate
```

Тесты:

```
$ docker exec -it worki-test_app_1 bash
$ rspec ./spec/
```
