#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QQmlEngine>
#include <QString>


struct DayMenu
{
    int DishId;
    QString FirstDish;
    QString MainDish;
    QString Ingr1;
    QString Ingr2;
};

struct LoginData
{
    int StudentId;
    int SchoolId;
    QString FirstName;
};


class Data : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(bool loading READ loading WRITE setLoading NOTIFY loadingChanged FINAL)
    Q_PROPERTY(bool sendingSurvey READ sendingSurvey WRITE setSendingSurvey NOTIFY sendingSurveyChanged FINAL)
    Q_PROPERTY(bool login READ login WRITE setLogin NOTIFY loginChanged FINAL)
    Q_PROPERTY(bool error READ error WRITE setError NOTIFY errorChanged FINAL)

public:
    explicit Data(QObject *parent = nullptr);
    ~Data();



private:

    class Database* m_Database;
    QMap<int, DayMenu> WeekDishes;
    LoginData LoginData;

private:

    void OnLoggedIn();
    void RetrieveWeekServings();
    void RetrieveSurveyData();

private: //callbacks

    void CheckConnectionReply(class QNetworkReply* Reply);
    void TryLoginReply(QNetworkReply* Reply);
    void WeekServingsReply(QNetworkReply* Reply);
    void SurveyDataReply(QNetworkReply* Reply);

public:

    Q_INVOKABLE void checkConnection();
    Q_INVOKABLE QString getQrContent() const;
    Q_INVOKABLE void tryLogin(const QString& StudentNumber, const QString& Password);
    Q_INVOKABLE QString getDish(int InDay, int Value) const;
    Q_INVOKABLE void sendSurvey(int Choice);
    Q_INVOKABLE QString getStudentName() const { return LoginData.FirstName; }

private:

    bool m_sendingSurvey;
    bool m_login;
    bool m_loading;
    bool m_error;

private:

    QMap<QString, QMetaObject::Connection> RequestConnections;

signals:

    void loadingChanged();
    void sendingSurveyChanged();
    void loginChanged();
    void errorChanged();

    void menuUpdated();
    void loggedIn();
    void surveyDataUpdated(int surveyChoice);

public:

    void setSendingSurvey(bool newSendingSurvey);
    bool sendingSurvey() const;

    void setLogin(bool newLogin);
    bool login() const;

    bool loading() const;
    void setLoading(bool newLoading);

    bool error() const;
    void setError(bool newError);
};

#endif // DATA_H
