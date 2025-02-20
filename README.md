# Коллективный блог

---

### Hexlet tests and linter status:
[![Actions Status](https://github.com/DmitriyKosnikov/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/DmitriyKosnikov/rails-project-64/actions)

[![Lint Status](https://github.com/DmitriyKosnikov/rails-project-64/actions/workflows/linter.yml/badge.svg)](https://github.com/DmitriyKosnikov/rails-project-64/actions/workflows/linter.yml)

### Link to site:
Проект развернут на [Render](https://render.com).  
Ссылка на приложение: (https://mysite-rcsr.onrender.com)

---

### Описание
Это коллективный блог, в котором пользователи могут:  
- Создавать посты  
- Добавлять комментарии к постам  
- Ставить лайки постам  
Также проект включает систему регистрации и авторизации.

---

### Требования
- Ruby `3.2.2`
- Rails `7.2.2`
- PostgreSQL `14+` или SQLite3

---

### Установка

1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/DmitriyKosnikov/rails-project-64.git
   cd rails-project-64
   ```

2. Установите зависимости:
   ```bash
   bundle install
   yarn install
   ```

3. Настройте базу данных. Укажите свои данные в файле `config/database.yml` для PostgreSQL  
   или используйте SQLite3, добавив следующее в `config/database.yml`:
   ```yaml
   development:
     <<: *default
     adapter: sqlite3
   ```

4. Выполните команды для настройки базы данных:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

---

### Использование

Для запуска приложения перейдите в директорию проекта и выполните:
```bash
bin/dev
```

---

### Тестирование

Для запуска тестов используйте команду:
```bash
make test
```

В проекте используются:  
- `Minitest`  
- `minitest-power_assert`