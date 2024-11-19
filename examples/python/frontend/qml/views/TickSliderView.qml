// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import CommonQml.SidebarApp 0.1
import CommonQml.Icons 0.1
import CommonQml.Items 0.1

SidebarAppView {
    id: fileOpenerView

    viewProperties.name: "Tick Slider"

    RowLayout {

        spacing: 4
        anchors.fill: parent

        anchors.margins: 10

        TickSlider {

            Layout.fillHeight: true

            Layout.preferredWidth: 100

            name: "Test"
            unit: "km/h"

            from: -10
            to: 20

            ticks: [-10, -5, 0, 1, 5.5, 10, 20]
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
