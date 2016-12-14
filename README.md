# Detta är alltså Agila Sveriges konferens-sajt.

## Hur man kör siten lokalt

...eller hur vi gjorde 2016-12-14 för att få den att snurra på en mac:

### 1. Installera rvm
```bash
$ curl -sSL https://get.rvm.io | bash -s stable --ruby
$ source <your/home/dir>/.rvm/scripts/rvm
```
### 2. Installera ruby 1.9.3
```bash
$ rvm install ruby-1.9.3
```

### 3. Installera bundler
```bash
$ gem install bundler
```

### 4. Installera alla dependencies
```bash
$ cd <path/to/agilasverige_site>
$ bundle install
```

### 5. Få tag på database.yml och payson.yml från någon som har dem, lägg dem under
```bash
$ <path/to/agilasverige_site>/config
```

### 7. Starta en postgres-server
```bash
$ pg_ctl init
$ pg_ctl start
```

### 8. Initiera databasen
```bash
$ cd <path/to/agilasverige_site>
$ rake db:setup
$ rake db:migrate
```

### 9. Starta siten!
```bash
$ rails s
```

### 10. Vid problem: byt Gemfile...
```bash
$ cp Gemfile.works.on.mac Gemfile
```

## Hur man deployar siten

Enkelt!

```bash
$ cap deploy
```
