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

    Row {

        anchors.fill: parent

        Rectangle {

            height: parent.height
            width: parent.width * 0.5

            color: "transparent"
            border.width: 1
            border.color: "white"

            RowLayout {

                spacing: 4

                anchors.fill: parent
                anchors.margins: 10

                SliderSpinBox {
                    id: sliderSpinBoxH

                    Layout.fillHeight: true
                    Layout.preferredWidth: 100

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                }

                SliderSpinBox {
                    id: sliderSpinBoxHTwo

                    Layout.fillHeight: true
                    Layout.preferredWidth: 100

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]
                    showTicks: true
                }

                // TickSlider {
                //     id: tickSliderH

                //     Layout.fillHeight: true
                //     Layout.preferredWidth: 100

                //     name: "Test"
                //     unit: "km/h"

                //     from: -10
                //     to: 20

                //     ticks: [-10, -5, 0, 1, 5.5, 10, 20]
                // }



                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }

        }

        Rectangle {

            height: parent.height
            width: parent.width * 0.5

            color: "transparent"
            border.width: 1
            border.color: "white"



            ColumnLayout {

                spacing: 4

                anchors.fill: parent
                anchors.margins: 10

                SliderSpinBox {
                    id: sliderSpinBoxV

                    Layout.fillWidth: true
                    Layout.preferredHeight: 100

                    alignment: SliderSpinBox.Alignment.Horizontal

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                }

                SliderSpinBox {
                    id: sliderSpinBoxVTwo

                    Layout.fillWidth: true
                    Layout.preferredHeight: 100

                    alignment: SliderSpinBox.Alignment.Horizontal

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]
                    showTicks: true
                }

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }

        }


    }


}
