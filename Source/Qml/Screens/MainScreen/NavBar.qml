import QtQuick 2.15
import QtQuick.Shapes 1.6
import QtQuick.Particles

Item
{
    id: root
    width: parent.width
    height: (parent.height * 229) / 2400

    signal navButtonClicked(var outButtonClicked)

    Rectangle
    {
        id: barRoundness
        height: root.height
        width: height
        radius: height / 2
        color: "#C8FFFF"
        anchors
        {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle
    {
        id: bar
        width: parent.width
        height: (root.parent.height * 164) / 2400
        anchors.bottom: parent.bottom

        gradient: Gradient
        {
            GradientStop{ position: 0.0; color: "#C8FFFF" }
            GradientStop{ position: 1.0; color: "#D9D9D9" }
        }
    }

    Rectangle
    {
        width: (root.width * 177) / (1080)
        height: width
        radius: width / 2
        anchors.centerIn: barRoundness

        color: "green"

        Image
        {
            source: "qrc:/HackHeroesProject/Assets/Icons/Scan.png"
            anchors.centerIn: parent
            height: (root.width * (sourceSize.height)) / (1080)
            width: (root.width * (sourceSize.width)) / (1080)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("Scan")
                }
            }
        }
    }

    Row
    {
        spacing: (root.width * (94)) / (1080)
        anchors
        {
            left: bar.left
            leftMargin: spacing
            verticalCenter: bar.verticalCenter
        }

        Image
        {
            source: "qrc:/HackHeroesProject/Assets/Icons/Home.png"
            height: sourceSize.height / 4 * (Math.min(root.parent.height, root.parent.width / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.height / 4)
            width: sourceSize.width / 4 * (Math.min(root.parent.width, root.parent.height / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.width / 4)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("Home")
                }
            }
        }

        Image
        {
            source: "qrc:/HackHeroesProject/Assets/Icons/FoodMenu.png"
            height: sourceSize.height / 4 * (Math.min(root.parent.height, root.parent.width / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.height / 4)
            width: sourceSize.width / 4 * (Math.min(root.parent.width, root.parent.height / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.width / 4)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("FoodMenu")
                }
            }
        }
    }


    Row
    {
        spacing: (root.width * (94)) / (1080)
        anchors
        {
            right: bar.right
            rightMargin: spacing
            verticalCenter: bar.verticalCenter
        }

        Image
        {
            source: "qrc:/HackHeroesProject/Assets/Icons/Survey.png"
            height: sourceSize.height / 4 * (Math.min(root.parent.height, root.parent.width / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.height / 4)
            width: sourceSize.width / 4 * (Math.min(root.parent.width, root.parent.height / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.width / 4)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("Survey")
                }
            }
        }

        Image
        {
            source: "qrc:/HackHeroesProject/Assets/Icons/Profile.png"
            height: sourceSize.height / 4 * (Math.min(root.parent.height, root.parent.width / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.height / 4)
            width: sourceSize.width / 4 * (Math.min(root.parent.width, root.parent.height / ((sourceSize.width / 4) / (sourceSize.height / 4))) / sourceSize.width / 4)

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    navButtonClicked("Profile")
                }
            }
        }
    }
}

