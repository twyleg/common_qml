// Copyright (C) 2024 twyleg
import QtQuick 2.15

import CommonQml.SidebarApp 0.1
import CommonQml.Icons 0.1

SidebarAppView {
    id: settingsView

    viewProperties.name: "Settings"
    viewProperties.iconUrl: IconLoader.getIconPath("material/settings")

    Rectangle {

        anchors.fill: parent

        color: "blue"

    }
}
