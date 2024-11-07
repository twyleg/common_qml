// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import TestModule 0.1

ApplicationWindow {
    id: window

    width: 800
    height: 480
    visible: true
    title: qsTr("Frontend")

    color: "black"

    TestElement {
        anchors.centerIn: parent

        width: parent.width / 2
        height: parent.height / 2
    }

}
