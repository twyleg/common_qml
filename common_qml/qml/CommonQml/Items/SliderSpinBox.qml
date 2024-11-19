// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import CommonQml.Helper 0.1

Item {
    id: sliderSpinBox

    enum Alignment {
        Vertical,
        Horizontal
    }

    property alias name: headerText.text

    property double value: 0
    property double to
    property double from
    property double stepSize: 0.1
    property list<double> ticks

    property alias nameAngle: headerText.rotation
    property bool showTicks: false

    property int alignment: SliderSpinBox.Alignment.Vertical

    property Item background: null

    GridLayout {
        id: layout

        anchors.fill: parent

        columns: sliderSpinBox.alignment === SliderSpinBox.Alignment.Horizontal ? 3 : 1
        rows: sliderSpinBox.alignment === SliderSpinBox.Alignment.Vertical ? 3 : 1

        Item {
            id: header

            Layout.fillWidth: sliderSpinBox.alignment === SliderSpinBox.Alignment.Vertical
            Layout.fillHeight: sliderSpinBox.alignment === SliderSpinBox.Alignment.Horizontal

            height: Math.max(headerText.height, headerText.width)
            width: Math.max(headerText.height, headerText.width)

            Text {
                id: headerText

                anchors.centerIn: parent
                rotation: -45
                color: "white"
                font.bold: true
            }
        }

        Item {
            id: sliderContainer

            Layout.fillWidth: true
            Layout.fillHeight: true

            Slider {
                id: slider

                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: sliderSpinBox.alignment === SliderSpinBox.Alignment.Vertical && sliderSpinBox.showTicks ? parent.horizontalCenter : parent.right
                anchors.bottom: sliderSpinBox.alignment === SliderSpinBox.Alignment.Horizontal && sliderSpinBox.showTicks ? parent.verticalCenter : parent.bottom

                orientation: sliderSpinBox.alignment === SliderSpinBox.Alignment.Vertical ? Qt.Vertical : Qt.Horizontal

                from: sliderSpinBox.from
                to: sliderSpinBox.to

                stepSize: sliderSpinBox.stepSize
                live: false

                onValueChanged: sliderSpinBox.update(value)

                function update(newValue: double) {
                    if(Math.abs(value - newValue) >= stepSize * 0.9) {
                        value = newValue
                    }
                }
            }

            Repeater {
                model: sliderSpinBox.ticks

                visible: sliderSpinBox.showTicks

                Item {
                    id: tickmark

                    width: sliderSpinBox.alignment === SliderSpinBox.Alignment.Vertical ? parent.width : 10
                    height: sliderSpinBox.alignment === SliderSpinBox.Alignment.Horizontal ? parent.height : 10

                    y: sliderSpinBox.alignment === SliderSpinBox.Alignment.Vertical ? calcY(modelData) : 0
                    x: sliderSpinBox.alignment === SliderSpinBox.Alignment.Horizontal ? calcX(modelData) : 0

                    Rectangle {
                        id: tickmarkLabel

                        color: "white"

                        Component.onCompleted: {
                            if(sliderSpinBox.alignment === SliderSpinBox.Alignment.Vertical) {
                                anchors.verticalCenter = parent.verticalCenter
                                anchors.left = parent.left
                                anchors.right = parent.horizontalCenter
                                height = 1
                            } else {
                                anchors.horizontalCenter = parent.horizontalCenter
                                anchors.top = parent.top
                                anchors.bottom = parent.verticalCenter
                                width = 1
                            }
                        }
                    }

                    Text {
                        id: tickmarkText

                        anchors.top: sliderSpinBox.alignment === SliderSpinBox.Alignment.Vertical ? parent.verticalCenter : parent.top
                        anchors.left: sliderSpinBox.alignment === SliderSpinBox.Alignment.Horizontal ? parent.left : parent.horizontalCenter
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom

                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        height: 20

                        color: "white"
                        text:  "%1".arg(modelData)
                    }

                    function calcY(v) {
                        return (slider.y + slider.height - slider.bottomPadding - height/2.0 - slider.implicitHandleHeight/2.0) - ((slider.height - slider.bottomPadding - slider.topPadding - slider.implicitHandleHeight) / (slider.to - slider.from)) * (v - slider.from)
                    }

                    function calcX(v) {
                        return (slider.x + slider.width - slider.rightPadding - width/2.0 - slider.implicitHandleWidth/2.0) - ((slider.width - slider.rightPadding - slider.leftPadding - slider.implicitHandleWidth) / (slider.to - slider.from)) * (v - slider.from)
                    }

                }
            }

            Component.onCompleted: {
                if(sliderSpinBox.background) {
                    sliderSpinBox.background.parent = sliderContainer
                    sliderSpinBox.background.z = -1
                    sliderSpinBox.background.anchors.fill = sliderContainer
                }
            }
        }

        DoubleSpinBox {
            id: valueBox

            to: sliderSpinBox.to
            from: sliderSpinBox.from
            stepSize: sliderSpinBox.stepSize

            value: sliderSpinBox.value

            Layout.fillWidth: sliderSpinBox.alignment === SliderSpinBox.Alignment.Vertical
            Layout.fillHeight: sliderSpinBox.alignment === SliderSpinBox.Alignment.Horizontal

            Layout.minimumHeight: 50
            Layout.minimumWidth: 50

            onValueChanged: sliderSpinBox.update(value)
        }
    }

    function update(value: double) {
        sliderSpinBox.value = value

        valueBox.update(value)
        slider.update(value)
    }
}
