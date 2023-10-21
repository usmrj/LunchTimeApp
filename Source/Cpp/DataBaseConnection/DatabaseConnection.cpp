#include "DatabaseConnection.h"
#include <QtSql>
#include <QSqlDatabase>
#include <QDebug>
#include <QSharedPointer>

QWeakPointer<QSqlDatabase> DatabaseConnection::Database = QSharedPointer<QSqlDatabase>(nullptr);
QString DatabaseConnection::DatabaseName = "";
QString DatabaseConnection::DatabaseHost = "";
QString DatabaseConnection::UserName = "";
QString DatabaseConnection::Password = "";


DatabaseConnection::DatabaseConnection()
{

}

QJsonDocument DatabaseConnection::Query(const QString &InQuery)
{
    if(Database.isNull())
        Connect();

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

void DatabaseConnection::Connect()
{
    QSharedPointer<QSqlDatabase> DatabasePtr = QSharedPointer<QSqlDatabase>::create(QSqlDatabase::addDatabase("QMYSQL"));
    Database = DatabasePtr.toWeakRef();

    auto StrongRef = Database.toStrongRef();
    if(StrongRef.isNull())
        return;

    StrongRef->setHostName(DatabaseHost);
    StrongRef->setDatabaseName(DatabaseName);
    StrongRef->setPassword(Password);
    StrongRef->setUserName(UserName);

    if(!StrongRef->open())
    {
        qDebug() << "Database couldn't open with error:";
        qDebug() << StrongRef->lastError();
    }
}

void DatabaseConnection::SetDatabaseCredentials(const QString &NewDatabaseName, const QString &NewDatabaseHost, const QString &NewPassword, const QString &NewUserName)
{
    DatabaseName = NewDatabaseName;
    DatabaseHost = NewDatabaseHost;
    Password = NewPassword;
    UserName = NewUserName;
}

