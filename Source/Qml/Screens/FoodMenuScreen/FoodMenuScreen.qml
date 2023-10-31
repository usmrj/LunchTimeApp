import QtQuick 2.15

import HackHeroesProject

Item
{
    id: root
    anchors.fill: parent

    Connections
    {
        target: Data
        function onMenuUpdated()
        {
            mondayTile.secondDish = Data.getDish(1, 1)
            mondayTile.mainDish = Data.getDish(1, 2)
            mondayTile.firstIngr = Data.getDish(1, 3)
            mondayTile.secondIngr = Data.getDish(1, 4)

            tuesdayTile.secondDish = Data.getDish(2, 1)
            tuesdayTile.mainDish = Data.getDish(2, 2)
            tuesdayTile.firstIngr = Data.getDish(2, 3)
            tuesdayTile.secondIngr = Data.getDish(2, 4)

            wednesdayTile.secondDish = Data.getDish(3, 1)
            wednesdayTile.mainDish = Data.getDish(3, 2)
            wednesdayTile.firstIngr = Data.getDish(3, 3)
            wednesdayTile.secondIngr = Data.getDish(3, 4)

            thursdayTile.secondDish = Data.getDish(4, 1)
            thursdayTile.mainDish = Data.getDish(4, 2)
            thursdayTile.firstIngr = Data.getDish(4, 3)
            thursdayTile.secondIngr = Data.getDish(4, 4)

            fridayTile.secondDish = Data.getDish(5, 1)
            fridayTile.mainDish = Data.getDish(5, 2)
            fridayTile.firstIngr = Data.getDish(5, 3)
            fridayTile.secondIngr = Data.getDish(5, 4)
        }
    }

    DayTile
    {
        id: mondayTile
        innerText: "Poniedziałek"

        Component.onCompleted:
        {
            console.log(Data.getDish("Monday", 1))
        }

        anchors
        {
            left: parent.left
            leftMargin: 80 / 4
            top: parent.top
            topMargin: 340 / 4
        }

        onTilePressed: function()
        {
            tuesdayTile.stopAnimation()
            wednesdayTile.stopAnimation()
            thursdayTile.stopAnimation()
            fridayTile.stopAnimation()
        }
    }

    DayTile
    {
        id: wednesdayTile
        innerText: "Środa"

        anchors
        {
            top: mondayTile.bottom
            topMargin: 80 / 4
            left: mondayTile.left
        }

        onTilePressed: function()
        {
            mondayTile.stopAnimation()
            tuesdayTile.stopAnimation()
            thursdayTile.stopAnimation()
            fridayTile.stopAnimation()
        }
    }

    DayTile
    {
        id: fridayTile
        innerText: "Piątek"

        anchors
        {
            top: wednesdayTile.bottom
            topMargin: 80 / 4
            left: wednesdayTile.left
        }

        onTilePressed: function()
        {
            mondayTile.stopAnimation()
            tuesdayTile.stopAnimation()
            wednesdayTile.stopAnimation()
            thursdayTile.stopAnimation()
        }
    }

    DayTile
    {
        id: tuesdayTile
        innerText: "Wtorek"

        anchors
        {
            bottom: thursdayTile.top
            bottomMargin: 80 / 4
            left: wednesdayTile.right
            leftMargin: 100 / 4
        }

        onTilePressed: function()
        {
            mondayTile.stopAnimation()
            wednesdayTile.stopAnimation()
            thursdayTile.stopAnimation()
            fridayTile.stopAnimation()
        }
    }

    DayTile
    {
        id: thursdayTile
        innerText: "Czwartek"

        anchors
        {
            bottom: parent.bottom
            bottomMargin: 1000 / 4
            left: wednesdayTile.right
            leftMargin: 100 / 4
        }

        onTilePressed: function()
        {
            mondayTile.stopAnimation()
            tuesdayTile.stopAnimation()
            wednesdayTile.stopAnimation()
            fridayTile.stopAnimation()
        }
    }
}
