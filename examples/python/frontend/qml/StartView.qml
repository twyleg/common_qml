import QtQuick 2.15

import CommonQml.SidebarApp 0.1

SidebarAppView {
    id: startView

    viewProperties.name: "Home"
    viewProperties.iconUrl: Qt.resolvedUrl("../img/svg/material/home.svg")

    Rectangle {

        anchors.fill: parent

        color: "red"

    }
}
