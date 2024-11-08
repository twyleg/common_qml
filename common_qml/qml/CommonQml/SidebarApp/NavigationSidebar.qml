// Copyright (C) 2024 twyleg
import QtQuick 2.0
import QtQuick.Layouts 1.15

Rectangle {
    id: navigationSidebar

    width: 100
    color: "#FF404142"

    // default property alias data: column.data
    property alias topColumn: topColumn
    property alias bottomColumn: bottomColumn
    property int activeView: 1

    ColumnLayout {
        id: column

        anchors.fill: parent
        spacing: 0

        ColumnLayout {
            id: topColumn

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignTop

        }

        ColumnLayout {
            id: bottomColumn

            Layout.fillWidth: true
            Layout.fillHeight: false

            Layout.alignment: Qt.AlignBottom
        }
    }


}
