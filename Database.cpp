#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSqlQuery>
#include <exception>
#include <memory>

//fully static class

class Database {
private:
    Database() { }

    QSqlDatabase makeConnection()
    {
//        QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
//        db.setHostName("bigblue");
//        db.setDatabaseName("flightdb");
//        db.setUserName("acarlson");
//        db.setPassword("1uTbSbAs");
//        if(db.open())
//        {
//            return db;
//        }
//        else
//        {

//        }
    }
public:
};
