#include "Database.h"
#include <QtSql>
#include <QSqlDatabase>
#include <QDebug>
#include <QSharedPointer>
#include <QtConcurrent>

QWeakPointer<QSqlDatabase> Database::DatabaseConnection = QSharedPointer<QSqlDatabase>(nullptr);
//QString Database::DatabaseName = "";
//QString Database::DatabaseHost = "";
//QString Database::UserName = "";
//QString Database::Password = "";


Database::Database()
{
    qDebug() << "test";
}

//QFuture<void> Database::open()
//{
//    return QtConcurrent::run(m_pool, [this]()
//    {
//        auto database = QSqlDatabase::addDatabase("QSQL", "main-connection");

//        database.setHostName("lunchlidnkdb");
//        database.setDatabaseName("www.db4free.net");
//        database.setPassword("@adSZKr2!PVFxK3");
//        database.setUserName("hitormissmedude");

//        database.open();

//        // of course you should do some more checks here to see
//        // whether everything went well :)
//    });
//}

void Database::Connect()
{
    QSqlDatabase Database = QSqlDatabase::addDatabase("QMYSQL");

    Database.setDatabaseName("lunchlinkdb");
    Database.setHostName("www.db4free.net");
    Database.setPassword("@adSZKr2!PVFxK3");
    Database.setUserName("hitormissmedude");

    Database.open();
}

QJsonDocument Database::Query(const QString &InQuery)
{
    QSqlQuery Query(InQuery);
    QJsonDocument Json;

    if (Query.exec())
    {
        QJsonArray RecordsArray;

        while (Query.next())
        {
            QJsonObject DataRecord;

            for (int i = 0; i < Query.record().count(); i++)
            {
                DataRecord[Query.record().fieldName(i)] = QJsonValue::fromVariant(Query.value(i));
            }

            RecordsArray.push_back(DataRecord);
        }

        Json.setArray(RecordsArray);
    }

    return Json;
}

