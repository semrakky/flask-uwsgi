if envsubst < /app/alembic.txt > /app/alembic.ini && [ -d "/app/migration" ] && alembic upgrade head
then
  alembic upgrade head
fi
/usr/bin/supervisord