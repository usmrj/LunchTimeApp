#ifndef STYLE_H
#define STYLE_H

#include <QObject>
#include <QtQml/qqml.h>
#include <QColor>

class Style : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(QColor detailColor READ detailColor WRITE setDetailColor NOTIFY detailColorChanged FINAL)
    Q_PROPERTY(QColor mainColor READ mainColor  WRITE setMainColor  NOTIFY mainColorChanged FINAL)
    Q_PROPERTY(QColor textColor READ textColor  WRITE setTextColor  NOTIFY textColorChanged FINAL)
    Q_PROPERTY(QColor accentColor READ accentColor WRITE setAccentColor NOTIFY accentColorChanged FINAL)
    Q_PROPERTY(QColor secondaryColor READ secondaryColor  WRITE setSecondaryColor  NOTIFY secondaryColorChanged FINAL)
    Q_PROPERTY(QColor barColor READ barColor WRITE setBarColor NOTIFY barColorChanged FINAL)
    Q_PROPERTY(QColor backgroundColor READ backgroundColor WRITE setBackgroundColor NOTIFY backgroundColorChanged FINAL)

    Q_PROPERTY(bool isDarkTheme READ isDarkTheme WRITE setIsDarkTheme NOTIFY isDarkThemeChanged FINAL)

public:

    explicit Style(QObject* parent = nullptr);

signals:

    void secondaryColorChanged();
    void textColorChanged();
    void mainColorChanged();
    void detailColorChanged();
    void accentColorChanged();
    void barColorChanged();
    void backgroundColorChanged();

    void isDarkThemeChanged();

private:

    bool m_isDarkTheme;

private:

    QColor m_accentColor;
    QColor m_secondaryColor;
    QColor m_textColor;
    QColor m_mainColor;
    QColor m_detailColor;
    QColor m_barColor;
    QColor m_backgroundColor;

public:

    QColor secondaryColor() const;
    void setSecondaryColor(const QColor &newSecondaryColor);

    QColor textColor() const;
    void setTextColor(const QColor &newTextColor);

    QColor mainColor() const;
    void setMainColor(const QColor &newMainColor);

    QColor detailColor() const;
    void setDetailColor(const QColor &newDetailColor);

    QColor accentColor() const;
    void setAccentColor(const QColor &newAccentColor);

    QColor barColor() const;
    void setBarColor(const QColor &newBarColor);

    QColor backgroundColor() const;
    void setBackgroundColor(const QColor &newBackgroundColor);

    bool isDarkTheme() const;
    void setIsDarkTheme(bool newIsDarkTheme);

public:

    Q_INVOKABLE void changeTheme();
};

#endif // STYLE_H
