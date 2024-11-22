// Copyright (C) 2024 twyleg
import QtQuick 2.15

SliderSpinBox {
    id: sliderSpinBoxZoned

    property var zones
    property list<Rectangle> zoneRectangles

    background: Item {
        opacity: 0.2
    }

    onWidthChanged: updateZones()
    onHeightChanged: updateZones()

    function pointToPixel(point) {
        var sliderDelta = sliderSpinBoxZoned.to - sliderSpinBoxZoned.from

        if(sliderSpinBoxZoned.alignment === Qt.Vertical) {
            var factor = background.height / sliderDelta
            return background.height - (point - sliderSpinBoxZoned.from) * factor
        } else {
            var factor = background.width/ sliderDelta
            return (point - sliderSpinBoxZoned.from) * factor
        }
    }

    function updateZones() {

        if (zones.length !== zoneRectangles.length) {
            return
        }

        for(var i=0; i<zones.length; i++) {
            var zone = zones[i]
            var zoneRectangle = zoneRectangles[i]

            var from = zone[0]
            var to = zone[1]

            var pixelFrom = pointToPixel(from)
            var pixelTo = pointToPixel(to)

            if(sliderSpinBoxZoned.alignment === Qt.Vertical) {
                var height = pixelFrom - pixelTo
                zoneRectangle.y = pixelFrom - height
                zoneRectangle.height = height

                zoneRectangle.anchors.left = background.left
                zoneRectangle.anchors.right = background.horizontalCenter
            } else {
                zoneRectangle.x = pixelFrom
                zoneRectangle.width = pixelTo - pixelFrom

                zoneRectangle.anchors.top = background.top
                zoneRectangle.anchors.bottom = background.verticalCenter
            }
        }
    }

    function initZones() {

        for(var i=0; i<zones.length; i++) {
            var zone = zones[i]
            var value = zone[2]

            var component =  Qt.createComponent("QtQuick", "Rectangle", Component.PreferSynchronous, background)
            var obj = component.createObject(background, {
                "color": value ? "green" : "red"
            })

            zoneRectangles.push(obj)
        }
    }

    Component.onCompleted: {
        initZones()
        updateZones()
    }
}
