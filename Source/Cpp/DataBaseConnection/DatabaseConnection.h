#ifndef DATABASECONNECTION_H
#define DATABASECONNECTION_H

#include <QString>
#include <QWeakPointer>

class DatabaseConnection
{
public:
    DatabaseConnection();

public:

    static class QJsonDocument Query(const QString& InQuery);

private:

    static void Connect();

private:

    static QWeakPointer<class QSqlDatabase> Database;

private:

    static QString DatabaseName;
    static QString DatabaseHost;
    static QString UserName;
    static QString Password;

public:

    inline static void SetDatabaseName(const QString& NewDatabaseName) { DatabaseName = NewDatabaseName; }
    inline static void SetDatabaseHost(const QString& NewDatabaseHost) { DatabaseHost = NewDatabaseHost; }
    inline static void SetUserName(const QString& NewUserName) { UserName = NewUserName; }
    inline static void SetPassword(const QString& NewPassword) { Password = NewPassword; }

    static void SetDatabaseCredentials(const QString& NewDatabaseName, const QString& NewDatabaseHost, const QString& NewPassword, const QString& NewUserName);
};

#endif // DATABASECONNECTION_H
