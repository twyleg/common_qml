// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import CommonQml.SidebarApp 0.1
import CommonQml.Icons 0.1

import "./views"

ApplicationWindow {
    id: window

    width: 800
    height: 480
    visible: true
    title: qsTr("Frontend")

    color: "black"

    SidebarApp {
        id: sidebarApp

        anchors.fill: parent

        defaultView: sliderView

        StartView {
            id: startView
            viewProperties.closeable: false

            onAddViewRequested: {
                var fileOpenerViewComponent = Qt.createComponent("views/FileOpenerView.qml");
                var fileOpenerView = fileOpenerViewComponent.createObject(sidebarApp.content, {})
                sidebarApp.addView(fileOpenerView)
                sidebarApp.handleActivateViewRequest(fileOpenerView)
            }
        }

        FileOpenerView {
            id: fileOpenerView
        }

        LoadingScreenView {
            id: loadingScreenView
        }

        SliderView {
            id: sliderView
        }

        SettingsView {
            id: settingsView
            viewProperties.alignment: SidebarAppView.Alignment.Bottom
        }

        onCloseViewRequested: (view) => {
            console.info(`Close view requested: name=${view.viewProperties.name}`)
        }
    }
}
