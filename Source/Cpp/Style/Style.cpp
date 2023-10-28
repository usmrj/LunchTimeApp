#include "Style.h"

Style::Style(QObject *parent)
    : QObject{parent}
    , m_accentColor{255, 122, 0}
    , m_secondaryColor{255, 184, 0}
    , m_textColor{0, 0, 0}
    , m_mainColor{255, 138, 0}
    , m_detailColor{255, 145, 66}
    , m_barColor{68, 68, 68}
    , m_backgroundColor{48, 48, 48}
    , m_isDarkTheme{true}
{
    changeTheme();
}

void Style::changeTheme()
{
    setIsDarkTheme(!m_isDarkTheme);

    if(!m_isDarkTheme)
    {
        setAccentColor(QColor(122, 41, 255));
        setMainColor(QColor(133, 89, 227));
        setSecondaryColor(QColor(179, 103, 255));
        setDetailColor(QColor(158, 111, 255));
        setBarColor(QColor(217, 217, 217));
        setBackgroundColor(QColor(195, 195, 195));
    }
    else
    {
        setAccentColor(QColor(255, 122, 0));
        setMainColor(QColor(255, 138, 0));
        setSecondaryColor(QColor(255, 184, 0));
        setDetailColor(QColor(255, 145, 66));
        setBarColor(QColor(68, 68, 68));
        setBackgroundColor(QColor(48, 48, 48));
    }
}

QColor Style::accentColor() const
{
    return m_accentColor;
}

void Style::setAccentColor(const QColor &newAccentColor)
{
    if (m_accentColor == newAccentColor)
        return;
    m_accentColor = newAccentColor;
    emit accentColorChanged();
}

QColor Style::secondaryColor() const
{
    return m_secondaryColor;
}

void Style::setSecondaryColor(const QColor &newSecondaryColor)
{
    if (m_secondaryColor == newSecondaryColor)
        return;
    m_secondaryColor = newSecondaryColor;
    emit secondaryColorChanged();
}

QColor Style::textColor() const
{
    return m_textColor;
}

void Style::setTextColor(const QColor &newTextColor)
{
    if (m_textColor == newTextColor)
        return;
    m_textColor = newTextColor;
    emit textColorChanged();
}

QColor Style::mainColor() const
{
    return m_mainColor;
}

void Style::setMainColor(const QColor &newMainColor)
{
    if (m_mainColor == newMainColor)
        return;
    m_mainColor = newMainColor;
    emit mainColorChanged();
}

QColor Style::detailColor() const
{
    return m_detailColor;
}

void Style::setDetailColor(const QColor &newDetailColor)
{
    if (m_detailColor == newDetailColor)
        return;
    m_detailColor = newDetailColor;
    emit detailColorChanged();
}



QColor Style::barColor() const
{
    return m_barColor;
}

void Style::setBarColor(const QColor &newBarColor)
{
    if (m_barColor == newBarColor)
        return;
    m_barColor = newBarColor;
    emit barColorChanged();
}

QColor Style::backgroundColor() const
{
    return m_backgroundColor;
}

void Style::setBackgroundColor(const QColor &newBackgroundColor)
{
    if (m_backgroundColor == newBackgroundColor)
        return;
    m_backgroundColor = newBackgroundColor;
    emit backgroundColorChanged();
}

bool Style::isDarkTheme() const
{
    return m_isDarkTheme;
}

void Style::setIsDarkTheme(bool newIsDarkTheme)
{
    if (m_isDarkTheme == newIsDarkTheme)
        return;
    m_isDarkTheme = newIsDarkTheme;
    emit isDarkThemeChanged();
}
