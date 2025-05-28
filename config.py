class Config:
    SECRET_KEY = 'fgjrgjdfhrdjfgndf'
    DEBUG      = True

class DevelopmentConfig(Config):
    MYSQL_HOST      = 'localhost'
    MYSQL_USER       = 'root'
    MYSQL_PASSWORD  = 'mysql'
    MYSQL_DB         = 'antojo'

config = {
    'development':DevelopmentConfig
}