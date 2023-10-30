#ifndef DATA_H
#define DATA_H

#include <QObject>
#include <QQmlEngine>
#include <QString>


struct DayMenu
{
    QString FirstDish;
    QString MainDish;
    QString Ingr1;
    QString Ingr2;
};


class Data : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(bool loading READ loading WRITE setLoading NOTIFY loadingChanged FINAL)
    Q_PROPERTY(bool sendingSurvey READ sendingSurvey WRITE setSendingSurvey NOTIFY sendingSurveyChanged FINAL)

public:
    explicit Data(QObject *parent = nullptr);
    ~Data();

signals:

    void loadingChanged();

    void sendingSurveyChanged();

private:

    class Database* m_Database;

    bool m_loading;

private:

    void RetrieveWeekServings();

public:

    bool loading() const;
    void setLoading(bool newLoading);

public:

    Q_INVOKABLE QString getQrContent() const;

private:

    QMap<int, DayMenu> WeekDishes;

    bool m_sendingSurvey;

public:

    Q_INVOKABLE QString getDish(int InDay, int Value) const;
    Q_INVOKABLE void sendSurvey(int Choice);
    bool sendingSurvey() const;
    void setSendingSurvey(bool newSendingSurvey);

public:

    Q_INVOKABLE void tryLogin(const QString& StudentNumber, const QString& Password);
};

#endif // DATA_H
