import QtQuick  2.15
import QtQuick.Controls 6.6

import HackHeroesProject

Item
{
    id: root
    anchors.fill: parent

    MouseArea
    {
        anchors.fill: parent
        z: -1
    }

    Rectangle
    {
        anchors.fill: parent
        gradient: Gradient
        {
            GradientStop { position: 0.4; color: "transparent" }
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.7; color: "transparent" }
            GradientStop { position: 1; color: "black" }
        }
        opacity: 0.5
    }

    Rectangle
    {
        id: logo
        width: parent.width /1.75
        height: parent.width/1.75
        radius: 20

        anchors
        {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: parent.height / 5
        }

        color:"orange"
    }

    Rectangle
    {
        id: loginRec
        width: parent.width /5 * 3.5
        height: 32

        anchors
        {
            horizontalCenter: parent.horizontalCenter
            top: logo.bottom
            topMargin: parent.height /18
        }

        border
        {
            color: "#FF7A00"
            width: 2
        }

        color: "white"
        radius: 2

        TextField
        {
            id: login
            font.pixelSize: 15
            width: parent.width
            background: null
            anchors
            {
                verticalCenter: parent.verticalCenter
            }
            placeholderText: "Numer ucznia"

        }
    }

    Rectangle
    {
        width: loginRec.width + 15
        height: loginRec.height + 15
        anchors.centerIn: loginRec
        color: "transparent"
        border
        {
            color: "#FFB800"
            width: 2
        }

        radius: 5
    }

    Rectangle
    {
        id: passwordRec
        width: parent.width /5 * 3.5
        height: 32

        anchors
        {
            horizontalCenter: parent.horizontalCenter
            top: loginRec.bottom
            topMargin: parent.height /18
        }

        border
        {
            color: "#FF7A00"
            width: 2
        }

        radius: 2
        color: "white"

        TextField
        {
            id: password
            font.pixelSize: 15
            background: null
            width: parent.width
            echoMode: TextField.Password

            anchors
            {
                verticalCenter: parent.verticalCenter
            }

            placeholderText: "Haslo"


        }
    }

    Rectangle
    {
        id: outPassRec
        width: passwordRec.width + 15
        height: passwordRec.height + 15
        anchors.centerIn: passwordRec
        color: "transparent"

        border
        {
            color: "#FFB800"
            width: 2
        }

        radius: 5
    }

    RoundButton
    {
        height:  40
        width: passwordRec.width / 2

        anchors
        {
            horizontalCenter: parent.horizontalCenter
            top: outPassRec.bottom
            topMargin: parent.height /18
        }

        radius: 15
        text: "Zaloguj się"
        font.pixelSize: 13

        onClicked:
        {
            Data.tryLogin(login.text, password.text)
        }
    }
}
