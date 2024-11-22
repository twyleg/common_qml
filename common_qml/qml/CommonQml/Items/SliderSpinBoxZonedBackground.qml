// Copyright (C) 2024 twyleg
import QtQuick 2.15

Item {
    id: sliderSpinBoxZonedBackground

    property var zones
    property list<Rectangle> zoneRectangles

    property var alignment
    property var from
    property var to

    width: parent ? parent.width : 0
    height: parent ? parent.height : 0

    onWidthChanged: updateZones()
    onHeightChanged: updateZones()
    onParentChanged: {
        tryToInheritParametersFromParent()
        updateZones()
    }

    function pointToPixel(point) {
        var sliderDelta = to - from

        if(alignment === Qt.Vertical) {
            var factor = height / sliderDelta
            return height - (point - from) * factor
        } else {
            var factor = width / sliderDelta
            return (point - from) * factor
        }
    }

    function tryToInheritParametersFromParent() {
        if (parent) {
            if (parent.alignment !== undefined && sliderSpinBoxZonedBackground.alignment === undefined) {
                sliderSpinBoxZonedBackground.alignment = Qt.binding(function() { return parent.alignment })
                console.debug(`Inherited "alignment" from parent:  ${sliderSpinBoxZonedBackground.alignment}`)
            }
            if (parent.from !== undefined && sliderSpinBoxZonedBackground.from === undefined) {
                sliderSpinBoxZonedBackground.from = Qt.binding(function() { return parent.from })
                console.debug(`Inherited "from" from parent:  ${sliderSpinBoxZonedBackground.from}`)
            }
            if (parent.to !== undefined && sliderSpinBoxZonedBackground.to === undefined) {
                sliderSpinBoxZonedBackground.to = Qt.binding(function() { return parent.to })
                console.debug(`Inherited "to" from parent:  ${sliderSpinBoxZonedBackground.to}`)
            }
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

            if(alignment === Qt.Vertical) {
                var height = pixelFrom - pixelTo
                zoneRectangle.y = pixelFrom - height
                zoneRectangle.height = height

                zoneRectangle.anchors.left = left
                zoneRectangle.anchors.right = right
            } else if(alignment === Qt.Horizontal){
                zoneRectangle.x = pixelFrom
                zoneRectangle.width = pixelTo - pixelFrom

                zoneRectangle.anchors.top = top
                zoneRectangle.anchors.bottom = bottom
            }
        }
    }

    function initZones() {

        for(var i=0; i<zones.length; i++) {
            var zone = zones[i]
            var value = zone[2]

            var component =  Qt.createComponent("QtQuick", "Rectangle", Component.PreferSynchronous, sliderSpinBoxZonedBackground)
            var obj = component.createObject(sliderSpinBoxZonedBackground, {
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
