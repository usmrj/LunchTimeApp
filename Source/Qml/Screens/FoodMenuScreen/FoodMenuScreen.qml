import QtQuick 2.15


Item
{
    id: root
    anchors.fill: parent

    DayTile
    {
        id: mondayTile
        innerText: "Poniedziałek"

        mainDish: "Schabowy"
        secondDish: "Zupa grzybowa"
        firstIngr: "Ziemniaki"
        secondIngr: "Kiszona kapusta"

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
        mainDish: "Schabowy"
        secondDish: "Zupa grzybowa"
        firstIngr: "Ziemniaki"
        secondIngr: "Kiszona kapusta"

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
        mainDish: "Schabowy"
        secondDish: "Zupa grzybowa"
        firstIngr: "Ziemniaki"
        secondIngr: "Kiszona kapusta"

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
        mainDish: "Schabowy"
        secondDish: "Zupa grzybowa"
        firstIngr: "Ziemniaki"
        secondIngr: "Kiszona kapusta"

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
        mainDish: "Kotlet Schabowy"
        secondDish: "Zupa grzybowa"
        firstIngr: "Ziemniaki"
        secondIngr: "Kiszona kapusta"

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
