import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
          id: root
          property int current: 0
          property bool increasing: true
          // Example index automation for convenience, disabled on click or tap
          /*
          SequentialAnimation {
              id: anim
              loops: -1
              running: true
              ScriptAction {
                  script: if (increasing) {
                              current++;
                              if (current >= aModel.count -1) {
                                  current = aModel.count - 1;
                                  increasing = !increasing;
                              }
                          } else {
                              current--;
                              if (current <= 0) {
                                  current = 0;
                                  increasing = !increasing;
                              }
                          }
              }

              PauseAnimation { duration: 500 }
          }
          */

          Component{
              id : petDelegate
              Item{
                  id: rowId
                  height: dataRowId.implicitHeight
                  width : dataRowId.implicitWidth
                  Row{
                      id: dataRowId
                      spacing : 10
                      Text{
                          text: index + ". Name: " + model.name
                      }
                      Text{
                          text: "Type: " + model.type
                      }
                  }
                  MouseArea{
                      anchors.fill: parent
                      onClicked: rowId.ListView.view.currentIndex = index
                  }
              }
          }

          /*
          ListView {
              id: list1
              height: 50; width: parent.width
              model: PetsModel {id: aModel}
              delegate: petDelegate
              orientation: ListView.Horizontal

              highlight: Rectangle { color: "lightsteelblue" }
              currentIndex: root.current
              onCurrentIndexChanged: root.current = currentIndex
              focus: true
          }
          */

          ListView {
              id: list2
              y: 160
              height: 200; width: parent.width
              model: PetsModel {}
              delegate: petDelegate

              //orientation: ListView.Horizontal

              highlight: Rectangle { color: "yellow" }
              currentIndex: root.current
              preferredHighlightBegin: 80; preferredHighlightEnd: 100
              highlightRangeMode: ListView.ApplyRange
          }

          /*
          ListView {
              id: list3
              y: 320
              height: 50; width: parent.width
              model: PetsModel {}
              delegate: petDelegate
              orientation: ListView.Horizontal

              highlight: Rectangle { color: "yellow" }
              currentIndex: root.current
              onCurrentIndexChanged: root.current = currentIndex
              preferredHighlightBegin: 125; preferredHighlightEnd: 125
              highlightRangeMode: ListView.StrictlyEnforceRange
          }
          */
      }
}
