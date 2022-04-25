# README

## Env
* Ruby 3.1.2

## HomeBrew

if you didn't install vips before please install vips, we will need it in rails 7.

```
brew install vips
```

## Rub Bundle install
```
bundle install
```
## **Start Projects**

1. Create Local db and data。
```
rails db:create
rails db:migrate

rails import_data:campaign_line_items
````
2. run rails server

```
rails s
```
