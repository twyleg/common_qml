import QtQuick 2.15

import CommonQml.SidebarApp 0.1

SidebarAppView {
    id: settingsView

    viewProperties.name: "Settings"
    viewProperties.iconUrl: Qt.resolvedUrl("../img/svg/material/settings.svg")

    Rectangle {

        anchors.fill: parent

        color: "blue"

    }
}
