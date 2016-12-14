# Detta är alltså Agila Sveriges konferens-sajt.

## Hur man kör siten lokalt

...eller hur vi gjorde 2016-12-14 för att få den att snurra på en mac:

### 1. Installera rvm
```bash
$ curl -sSL https://get.rvm.io | bash -s stable --ruby
$ source <your/home/dir>/.rvm/scripts/rvm
```
### 2. Installera ruby 1.9.3
```
$ rvm install ruby-1.9.3
```

### 3. Installera bundler
```
$ gem install bundler
```

### 4. Installera alla dependencies
```
$ cd <path/to/agilasverige_site>
$ bundle install
```

### 5. Få tag på database.yml och payson.yml från någon som har dem, lägg dem under
```
$ <path/to/agilasverige_site>/config
```

### 7. Starta en postgres-server
```
$ pg_ctl init
$ pg_ctl start
```

### 8. Initiera databasen
```
$ cd <path/to/agilasverige_site>
$ rake db:setup
$ rake db:migrate
```

### 9. Starta siten!
```
$ rails s
```

### 10. Vid problem: byt Gemfile...
```
$ cp Gemfile.works.on.mac Gemfile
```

## Hur man deployar siten

Enkelt!

```
$ cap deploy
```
