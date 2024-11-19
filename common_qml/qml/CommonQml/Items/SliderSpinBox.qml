// Copyright (C) 2024 twyleg
import QtQuick 2.15
import QtQuick.Controls 2.15

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

    property int alignment: Alignment.Vertical

    Item {
        id: header

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        height: 50

        Text {
            id: headerText

            anchors.centerIn: parent
            rotation: -45
            color: "white"

            font.bold: true
        }

    }

    Slider {
        id: slider

        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: sliderSpinBox.showTicks ? parent.horizontalCenter : parent.right
        anchors.bottom: valueBox.top

        orientation: Qt.Vertical

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

            anchors.left: parent.left
            anchors.right: parent.right

            height: tickmarkText.height

            y: calcY(modelData)

            function calcY(v) {
                return (slider.y + slider.height - slider.bottomPadding - height/2.0 - slider.implicitHandleHeight/2.0) - ((slider.height - slider.bottomPadding - slider.topPadding - slider.implicitHandleHeight) / (slider.to - slider.from)) * (v - slider.from)
            }

            Rectangle {
                id: tickmarkLabel

                anchors.left: parent.left
                anchors.right: parent.horizontalCenter
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter

                color: "white"
                height: 1
            }


            Text {
                id: tickmarkText

                anchors.left: parent.horizontalCenter
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                height: 20

                color: "white"
                text:  "%1".arg(modelData)
            }

        }
    }

    DoubleSpinBox {
        id: valueBox

        to: sliderSpinBox.to
        from: sliderSpinBox.from
        stepSize: sliderSpinBox.stepSize

        value: sliderSpinBox.value

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        height: 50

        onValueChanged: sliderSpinBox.update(value)
    }

    function update(value: double) {
        sliderSpinBox.value = value

        valueBox.update(value)
        slider.update(value)
    }

}
