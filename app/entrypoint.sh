#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# python manage.py flush --no-input   #This command clears out the database, so commented out.
# python manage.py migrate            #Do not want to run the migrate command each time docker lodes up, so commented out.

exec "$@"
