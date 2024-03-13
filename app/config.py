import os
basedir = os.path.abspath(os.path.dirname(__file__))

class Config:
    SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(basedir, 'datebase.db')
    SQLALCHEMY_TRAK_NOTIFICATIONS = True
    SECRET_KEY ="123456789"