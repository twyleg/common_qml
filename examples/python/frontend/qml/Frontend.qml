// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import CommonQml.TestModule 0.1
import CommonQml.SidebarApp 0.1


ApplicationWindow {
    id: window

    width: 800
    height: 480
    visible: true
    title: qsTr("Frontend")

    color: "black"

    SidebarApp {
        anchors.fill: parent

        StartView {
            id: startView
        }

        SettingsView {
            id: settingsView
            viewProperties.alignment: SidebarAppView.Alignment.Bottom
        }
    }
}
