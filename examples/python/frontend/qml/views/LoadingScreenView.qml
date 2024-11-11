// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Controls 2.15

import CommonQml.SidebarApp 0.1
import CommonQml.SidebarApp.Views 0.1
import CommonQml.Items 0.1
import CommonQml.Icons 0.1

SidebarAppView {
    id: loadingScreenView

    viewProperties.name: "Loading screens"
    viewProperties.closeable: true
    viewProperties.iconUrl: IconLoader.getIconPath("twyleg/rotation_loading")

    Button {
        text: rotatingLoadingScreen.running ? "Stop" : "Start"
        anchors.centerIn: parent
        onClicked: startStopLoading()
    }

    RotatingLoadingScreen {
        id: rotatingLoadingScreen

        anchors.centerIn: parent
        width: parent.width / 2
        height: parent.height / 2

        running: false
    }

    function startStopLoading() {
        if(rotatingLoadingScreen.running){
            rotatingLoadingScreen.stop()
        } else {
            rotatingLoadingScreen.start()
        }


    }
}
