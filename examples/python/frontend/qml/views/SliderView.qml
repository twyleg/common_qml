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
                    id: sliderSpinBoxV

                    Layout.fillHeight: true
                    Layout.preferredWidth: 200

                    name: "Test [kmh]"

                    from: -10
                    to: 20
                }

                SliderSpinBox {
                    id: sliderSpinBoxWithTicksV

                    Layout.fillHeight: true
                    Layout.preferredWidth: 200

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]
                }

                SliderSpinBoxFading {
                    id: sliderSpinBoxWithTicksFadingV

                    Layout.fillHeight: true
                    Layout.preferredWidth: 200

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]
                }

                SliderSpinBox {
                    id: sliderSpinBoxWithTicksCustomBackgroundV

                    Layout.fillHeight: true
                    Layout.preferredWidth: 200

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]

                    background: Item {
                        Rectangle {
                            height: sliderSpinBoxWithTicksCustomBackgroundV.backgroundHeight
                            width: sliderSpinBoxWithTicksCustomBackgroundV.backgroundWidth / 2.0
                            color: "red"
                            opacity: 0.2
                        }
                    }
                }

                SliderSpinBox {
                    id: sliderSpinBoxWithTicksHighlightedV

                    Layout.fillHeight: true
                    Layout.preferredWidth: 200

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]

                    background: SliderSpinBoxHighlightedBackground {
                        id: sliderSpinBoxHighlightedBackground

                        height: sliderSpinBoxWithTicksHighlightedV.backgroundHeight
                        width: sliderSpinBoxWithTicksHighlightedV.backgroundWidth / 2.0
                        opacity: 0.2

                        highlights: [
                            [-10, -5, true],
                            [-5, 0, false],
                            [0, 10, true],
                            [10, 20, false]
                        ]

                    }

                    Timer {
                        interval: 1000
                        running: true
                        repeat: true
                        onTriggered: {
                            if(sliderSpinBoxHighlightedBackground.highlights.length < 5 ) {
                                sliderSpinBoxHighlightedBackground.highlights = [
                                    [-10, -2, false],
                                    [-2, 0, true],
                                    [0, 5, false],
                                    [5, 10, true],
                                    [10, 20, false]
                                ]
                            } else {
                                sliderSpinBoxHighlightedBackground.highlights = [
                                    [-10, -5, true],
                                    [-5, 0, false],
                                    [0, 10, true],
                                    [10, 20, false]
                                ]
                            }
                        }
                    }
                }

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
                    id: sliderSpinBoxH

                    Layout.fillWidth: true
                    Layout.preferredHeight: 200

                    alignment: Qt.Horizontal

                    name: "Test [kmh]"

                    from: -10
                    to: 20
                }

                SliderSpinBox {
                    id: sliderSpinBoxWithTicksH

                    Layout.fillWidth: true
                    Layout.preferredHeight: 200

                    alignment: Qt.Horizontal

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]
                }

                SliderSpinBoxFading {
                    id: sliderSpinBoxWithTicksFadingH

                    Layout.fillWidth: true
                    Layout.preferredHeight: 200

                    alignment: Qt.Horizontal

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]
                }

                SliderSpinBox {
                    id: sliderSpinBoxWithTicksColoredBackgroundH

                    Layout.fillWidth: true
                    Layout.preferredHeight: 200

                    alignment: Qt.Horizontal

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]

                    background: Item {
                        Rectangle {
                            height: sliderSpinBoxWithTicksColoredBackgroundH.backgroundHeight / 2.0
                            width: sliderSpinBoxWithTicksColoredBackgroundH.backgroundWidth
                            color: "red"
                            opacity: 0.2
                        }
                    }
                }

                SliderSpinBoxFading{
                    id: sliderSpinBoxWithTicksHighlightedBackgroundH

                    Layout.fillWidth: true
                    Layout.preferredHeight: 200

                    alignment: Qt.Horizontal

                    name: "Test [kmh]"

                    from: -10
                    to: 20

                    ticks: [-10, -5, 0, 1, 5.5, 10, 20]

                    background: SliderSpinBoxHighlightedBackground {
                        id: sliderSpinBoxHighlightedBackgroundH

                        height: sliderSpinBoxWithTicksHighlightedBackgroundH.backgroundHeight / 2.0
                        opacity: 0.2

                        highlights: [
                            [-10, -2, false],
                            [-2, 0, true],
                            [0, 5, false],
                            [5, 10, true],
                            [10, 20, false]
                        ]
                    }

                    Timer {
                        interval: 1000
                        running: true
                        repeat: true
                        onTriggered: {
                            if(sliderSpinBoxHighlightedBackgroundH.highlights.length < 5 ) {
                                sliderSpinBoxHighlightedBackgroundH.highlights = [
                                    [-10, -2, false],
                                    [-2, 0, true],
                                    [0, 5, false],
                                    [5, 10, true],
                                    [10, 20, false]
                                ]
                            } else {
                                sliderSpinBoxHighlightedBackgroundH.highlights = [
                                    [-10, -5, true],
                                    [-5, 0, false],
                                    [0, 10, true],
                                    [10, 20, false]
                                ]
                            }
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }
    }
}
