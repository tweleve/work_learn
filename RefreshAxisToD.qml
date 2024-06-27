/*********************************************************************************//***
 * @copyright Copyright 2022 Shanghai Fangling Software Co., Ltd. All Rights Reserved.
 * @file      bodacylinder.qml
 * @version   V1.0
 * @brief     G axis Control cylinder switch
 * @author    Shihao Zhou (shihaozhou@flcnc.com)
 * @date      08/24/2022  (M/D/Y)
 * @details
 * @par History
 * Date  |  Author  |  Version  |  Description
 * ----  |  ------  |  -------  |  -----------
 * 08/24/2022  |  Shihao Zhou  | V1.0 | G axis Control cylinder switch
 *
 ***********************************************************************************/

 import QtQuick 1.1
import com.flcnc.tube 1.0
import "../"

Rectangle {
  id: root_
  width: 680
  height: 900
  color: "yellow"

  /// ui setting
  Item {
    id: ui_
    anchors.fill: parent

    Text {
      id: titile_
      text: qsTr("气缸设置")
      font.bold: true
      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter
      anchors.top: parent.top
      anchors.topMargin: 30
      anchors.horizontalCenter: parent.horizontalCenter
      font.pixelSize: 28
    }

    // ui param setting
    Item {
      id: input_item_
      anchors.top: titile_.bottom
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: bottom_item_.top
      anchors.topMargin: 20

      Column {
        anchors.fill: parent
        spacing: 12

        // g pose
        Row {
          id: line_
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("送料轴坐标值:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: g_axis_pos_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = false;
          }
        }

        // rest length
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("余料长度:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: rest_length_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = false;
          }
        }

        // raw steel length
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("原料长度:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: raw_length_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // raw tolerance
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("原料误差:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: raw_tolerance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // location Io pose
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("定位IO距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: io_pose_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // g back distance
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("送料轴G开始回退距离::")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: gback_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 1
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸1与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang1_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 2
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸2与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang2_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 3
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸3与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang3_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 4
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸4与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang4_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 5
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸5与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang5_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 6
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸6与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang6_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 7
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸7与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang7_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 8
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸8与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang8_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 9
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸9与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang9_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

        // cylinder 10
        Row {
          spacing: 8
          height: internal_.line_height_
          anchors.horizontalCenter: parent.horizontalCenter

          Item {
            width: internal_.title_width_
            anchors {
              top: parent.top
              bottom: parent.bottom
            }

            Text {
              text: qsTr("夹紧气缸10与送料轴安全距离:")
              anchors.rightMargin: 8
              anchors.fill: parent
              verticalAlignment: Text.AlignVCenter
              horizontalAlignment: Text.AlignRight
              font.pointSize: 14
              font.pixelSize: 15
            }
          }

          Loader {
            id: qigang10_distance_input_
            width: internal_.input_width_
            sourceComponent: input_text_

            anchors {
              top: parent.top
              bottom: parent.bottom
            }
            onLoaded: item.enable_key_ = true;
          }
        }

      }
    }

    // button
    Item {
      id: bottom_item_
      height: 290 //440
      anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
      }

      Column {
        anchors.fill: parent
        spacing: 12

        // gray
        Rectangle {
          anchors {
            left: parent.left
            right: parent.right
            leftMargin: 100
            rightMargin: 100
          }
          color: "gray"
          height: 3
          radius: 3
        }

        Row {
          height: 70
          anchors.horizontalCenter: parent.horizontalCenter
          spacing: 16

          Loader {
            id: status1_
            width: 50
            height: 50
            sourceComponent: status_monitor_

            anchors {
              verticalCenter: parent.verticalCenter
            }
            onLoaded: {
              item.port_name = internal_.status1_name_;
              item.status = false;
            }
          }

          Loader {
            id: status2_
            width: 50
            height: 50
            sourceComponent: status_monitor_

            anchors {
              verticalCenter: parent.verticalCenter
            }
            onLoaded: {
              item.port_name = internal_.status2_name_;
              item.status = false;
            }
          }

          Loader {
            id: status3_
            width: 50
            height: 50
            sourceComponent: status_monitor_

            anchors {
              verticalCenter: parent.verticalCenter
            }
            onLoaded: {
              item.port_name = internal_.status3_name_;
              item.status = false;
            }
          }

          Loader {
            id: status4_
            width: 50
            height: 50
            sourceComponent: status_monitor_

            anchors {
              verticalCenter: parent.verticalCenter
            }
            onLoaded: {
              item.port_name = internal_.status4_name_;
              item.status = false;
            }
          }

          Loader {
            id: status5_
            width: 50
            height: 50
            sourceComponent: status_monitor_

            anchors {
              verticalCenter: parent.verticalCenter
            }
            onLoaded: {
              item.port_name = internal_.status5_name_;
              item.status = false;
            }
          }
        }

        // button line1
        Row {
          height: 70
          anchors.horizontalCenter: parent.horizontalCenter
          spacing: 16

          Button {
            buttonText: qsTr("气缸模式\n 切换")
            buttonColor: "#FFFFC8"
            onButtonClick: {
              var status = operation_.getPlcStatus(internal_.status1_d_);
              if (status) { // to manual mode
                operation_.saveIOStatus();
                operation_.setPlcStatus(internal_.status1_d_, !status);
              } else { // to auto mode
                operation_.recoveryIOStatus();
                operation_.setPlcStatus(internal_.status1_d_, !status);
              }
            }
          }

          Button {
            id: io1_
            buttonText: qsTr("气缸1")
            buttonColor: "#FFFFC8"
            onButtonClick: {
              operation_.switchIOStatus(internal_.status2_d_);
            }
          }

          Button {
            id: io2_
            buttonText: qsTr("气缸2")
            buttonColor: "#FFFFC8"
            onButtonClick: {
              operation_.switchIOStatus(internal_.status3_d_);
            }
          }

          Button {
            id: io3_
            buttonText: qsTr("气缸3")
            buttonColor: "#FFFFC8"
            onButtonClick: {
              operation_.switchIOStatus(internal_.status4_d_);
            }
          }

          Button {
            id: io4_
            buttonText: qsTr("气缸4")
            buttonColor: "#FFFFC8"
            onButtonClick: {
              operation_.switchIOStatus(internal_.status5_d_);
            }
          }

        }

        Row {
          height: 70
          anchors.horizontalCenter: parent.horizontalCenter
          spacing: 16

          Button {
            buttonText: qsTr("保存到\n文件")
            buttonColor: "#FFFFC8"
            onButtonClick: {
              operation_.saveParam();
              param_.SaveParamToFile();
            }
          }

          Button {
            buttonText: qsTr("退出")
            buttonColor: "#FFFFC8"
            onButtonClick: {
              operation_.recoveryIOStatus();
              operation_.setPlcStatus(internal_.status1_d_, true); // to auto mode
              rootOjbect.show = false;
            }
          }
        }

      }
    }

    Component {
      id: input_text_

      Item {
        id: input_text_root_
        property alias text: input_.text
        property bool enable_key_: true
        property bool is_number_: true

        Rectangle {
          visible: input_text_root_.enable_key_
          anchors.fill: parent
          border.color: "#000000"
          border.width: 3
        }

        Text {
          id: input_
          anchors.fill: parent
          anchors.rightMargin: 6
          anchors.leftMargin: 6
          font.pointSize: 14
          text: qsTr("0")
          MouseArea {
            enabled: input_text_root_.enable_key_
            anchors.fill: parent
            onClicked: {
              input_board_.Open();
            }
          }
          KeyboardWrapper {
            id: input_board_
            is_num_: is_number_
            onAccepted: {
              input_.text = value_;
            }
          }
        }
      }
    }

    Component {
      id: status_monitor_

      Rectangle {
        property string port_name: ""
        property string icon: ""
        property bool status: false

        color: "transparent"

        QtObject {
          id: color_mode_
          property color no_trig_color_: "white"
          property color trig_color_: "orange"
        }

        TextIconFrame {
          id: status_monitor_icon_

          innerColor: color_mode_.no_trig_color_
          buttonText: port_name
          icon: parent.icon

          radius: 5

          anchors.verticalCenter: parent.verticalCenter
          anchors.left: parent.left
          width: parent.width
          height: parent.height
        }

        onStatusChanged: {
          status_monitor_icon_.innerColor = status ? color_mode_.trig_color_ : color_mode_.no_trig_color_;
        }
      }
    }
  }

  Item {
    id: operation_

    QtObject {
      id: internal_

      // ui param
      property variant title_width_: 150;
      property variant input_width_: 150;
      property variant line_height_: 20;
      property variant status_width_: 25;

      property string status1_name_: qsTr("自动\n手动");
      property string status2_name_: qsTr("气缸1");
      property string status3_name_: qsTr("气缸2");
      property string status4_name_: qsTr("气缸3");
      property string status5_name_: qsTr("气缸4");

      // d index 465-475
      property int cylinder_count_: 10;
      property int d_cylinder_index_base_: 464;

      // // d index auto run flag
      // property int d_auto_run_: 464;

      // status: mode
      property int no_trigger_: 99;
      property int trigger_: 100;

      property int m_location_io_: 207;

      // property int g_axis_index_: 6;

      property int g_back_m_: 379;
      property int g_back_io_m_: 380;

      /// Axis D index
      property int axis_g_pose_d_: 50;
      property int axis_u_pose_d_: 427;  //
      property int axis_e_pose_d_: 428;  //
      property int axis_h_pose_d_: 429;
      property int axis_w_pose_d_: 430;
      property int axis_v_pose_d_: 431;

      /// Axis index
      property int axis_g_index_: 6;
      property int axis_u_index_: 7;
      property int axis_e_index_: 8;
      property int axis_h_index_: 9;
      property int axis_w_index_: 10;
      property int axis_v_index_: 11;


      // steel param d_index
      property int raw_length_d_: 476;
      property int raw_tolerance_d_: 477;
      property int location_io_dis_d_: 478;
      property int part_length_d_: 479;
      property int cut_segment_length_d_: 480;
      property int g_back_d_: 481;

      // status
      property int location_io_d_: 482;
      property int auto_flag_d_: 483;
      property int part_begin_d_: 484;
      property int part_end_d_: 485;
      property int cut_segment_begin_d_: 486;
      property int cut_segment_end_d_: 487;
      property int gcode_end_d_: 488;


      // rest length
      property int rest_length_d_: 489;

      // status monitor
      property int status1_d_: 494;  // io mode
      property int status2_d_: 490;  // io 1
      property int status3_d_: 491;  // io 2
      property int status4_d_: 492;  // io 3
      property int status5_d_: 493;  // io 4

      // status save
      property bool save_status_: false;
      property bool save_io_status1_: false;
      property bool save_io_status2_: false;
      property bool save_io_status3_: false;
      property bool save_io_status4_: false;
    }

    Controller {
      id: control_

      onAutoModeChanged: {
        // set auto mode flag
        operation_.setPlcStatus(internal_.auto_flag_d_, automode);

        // clear status
        operation_.setPlcStatus(internal_.gcode_end_d_, false);
        operation_.setPlcStatus(internal_.part_begin_d_, false);
        operation_.setPlcStatus(internal_.part_end_d_, false);
        operation_.setPlcStatus(internal_.cut_segment_begin_d_, false);
        operation_.setPlcStatus(internal_.cut_segment_end_d_, false);

        if (!automode) {
          control_.SetPlcM(internal_.g_back_m_, false);
          control_.SetPlcM(internal_.g_back_io_m_, false);
        } else { // auto
          operation_.updateUiParamToPlc();
          operation_.setPlcStatus(internal_.status1_d_, true); // to auto mode
        }
      }

      onPartStart: {
        operation_.setPlcStatus(internal_.part_end_d_, false);
        operation_.setPlcStatus(internal_.part_begin_d_, true);
        operation_.setPlcDoubleValue(internal_.part_length_d_, length);
      }

      onPartEnd: {
        operation_.setPlcStatus(internal_.part_begin_d_, false);
        operation_.setPlcStatus(internal_.part_end_d_, true);
      }

      onCutSegTypeStart: {
        operation_.setPlcStatus(internal_.cut_segment_end_d_, false);
        operation_.setPlcStatus(internal_.cut_segment_begin_d_, true);
        operation_.setPlcDoubleValue(internal_.cut_segment_length_d_, length);
      }

      onCutSegTypeEnd: {
        operation_.setPlcStatus(internal_.cut_segment_begin_d_, false);
        operation_.setPlcStatus(internal_.cut_segment_end_d_, true);
      }

      onMValueChanged: {
        if (index == 2) { // M02
          operation_.setPlcStatus(internal_.gcode_end_d_, true);
          operation_.setPlcStatus(internal_.part_begin_d_, false);
          operation_.setPlcStatus(internal_.part_end_d_, false);
          operation_.setPlcStatus(internal_.cut_segment_begin_d_, false);
          operation_.setPlcStatus(internal_.cut_segment_end_d_, false);
        }

        if (index == internal_.g_back_m_) {
          if (operation_.getAbsCurrentG() > parseFloat(gback_distance_input_.item.text)) {
            control_.SetPlcM(internal_.g_back_io_m_, control_.GetPlcM(internal_.g_back_m_));
          }
        }

        if (index == internal_.m_location_io_) {
          var status = control_.GetPlcM(internal_.m_location_io_);
          operation_.setPlcStatus(internal_.location_io_d_, status);
        }
      }
    }

    // button view
    Monitor {
      id: change_btn_name_
      timeout: 500
      repeat: false
      onUpdate: {
        rootOjbect.custom_name = qsTr("气缸\n设置");
      }
    }

    // refresh pos
    Monitor {
      id: refresh_pos_
      timeout: 500
      repeat: true
      running: rootOjbect.show
      onUpdate: {
        var pos = operation_.getAbsCurrentG();
        g_axis_pos_input_.item.text = pos.toFixed(2);
        // need !  getPlcDoubleValue
        var value = operation_.getPlcDoubleValue(internal_.rest_length_d_);
        operation_.setRestLength(value);
      }
    }

    // refresh ui param
    Monitor {
      id: refresh_ui_param_
      repeat: false
      triggeredOnStart: true
      running: rootOjbect.show
      onUpdate: {
        operation_.refreshParam();
      }
    }

    /// refresh pos
    Monitor {
      id: refresh_axis_pos_
      timeout: 500
      repeat: true
      running: true
      triggeredOnStart: false
      onUpdate: {
        operation_.refreshAllAxisParam();
      }
    }

    // refresh axis pos to d
	Monitor {
      id: refresh_pos_to_d_
      timeout: 100
      repeat: true
      running: true
	  triggeredOnStart: false
      onUpdate: {
        operation_.updateAxisToD()
      }
    }

    /// refresh IO status
    Monitor {
      id: refresh_io_status_
      timeout: 500
      repeat: true
      running: rootOjbect.show
      triggeredOnStart: true
      onUpdate: {
        // io auto mode
        var status = operation_.getPlcStatus(internal_.status1_d_);
        status1_.item.status = status;
        operation_.switchIOButtonDisable(status);

        // io 1 status
        status = operation_.getPlcStatus(internal_.status2_d_);
        status2_.item.status = status;

        // io 2 status
        status = operation_.getPlcStatus(internal_.status3_d_);
        status3_.item.status = status;

        // io 3 status
        status = operation_.getPlcStatus(internal_.status4_d_);
        status4_.item.status = status;

        // io 4 status
        status = operation_.getPlcStatus(internal_.status5_d_);
        status5_.item.status = status;
      }
    }

    Parameter {
      id: param_
    }

    Logger {
      id: logger_
    }

    // get cylinder input distance
    function getCylinderInputDis(index) {
      var dis = 0.0;
      switch (index) {
        case 1:
          dis = parseFloat(qigang1_distance_input_.item.text);
          break;
        case 2:
          dis = parseFloat(qigang2_distance_input_.item.text);
          break;
        case 3:
          dis = parseFloat(qigang3_distance_input_.item.text);
          break;
        case 4:
          dis = parseFloat(qigang4_distance_input_.item.text);
          break;
        case 5:
          dis = parseFloat(qigang5_distance_input_.item.text);
          break;
        case 6:
          dis = parseFloat(qigang6_distance_input_.item.text);
          break;
        case 7:
          dis = parseFloat(qigang7_distance_input_.item.text);
          break;
        case 8:
          dis = parseFloat(qigang8_distance_input_.item.text);
          break;
        case 9:
          dis = parseFloat(qigang9_distance_input_.item.text);
          break;
        case 10:
          dis = parseFloat(qigang10_distance_input_.item.text);
          break;
        default:
          dis = -1;
          break;
      }

      return dis;
    }

    // get raw length input
    function getRawLengthInput() {
      var length = parseFloat(raw_length_input_.item.text);
      return length;
    }

    // get raw tolerance input
    function getRawToleranceInput() {
      var tolerance = parseFloat(raw_tolerance_input_.item.text);
      return tolerance;
    }

    // get location io pose input
    function getLocationIOPoseInput() {
      var pose = parseFloat(io_pose_input_.item.text);
      return pose;
    }

    // get g back distance input
    function getGBackDistanceInput() {
      var dis = parseFloat(gback_distance_input_.item.text);
      return dis;
    }

    // get rest length
    function getRestLength() {
      var dis = parseFloat(rest_length_input_.item.text);
      return dis;
    }

    // set rest length
    function setRestLength(dis) {
      rest_length_input_.item.text = dis;
    }

    // set raw length input
    function setRawLengthInput(dis) {
      raw_length_input_.item.text = dis;
    }

    // set raw tolerance input
    function setRawToleranceInput(dis) {
      raw_tolerance_input_.item.text = dis;
    }

    // set location io pose input
    function setLocationIOPoseInput(dis) {
      io_pose_input_.item.text = dis;
    }

    // get g back distance input
    function setGBackDistanceInput(dis) {
      gback_distance_input_.item.text = dis;
    }

    // set cylinder distance
    function setCylinderInputDis(index, dis) {
      switch (index) {
        case 1:
          qigang1_distance_input_.item.text = dis;
          break;
        case 2:
          qigang2_distance_input_.item.text = dis;
          break;
        case 3:
          qigang3_distance_input_.item.text = dis;
          break;
        case 4:
          qigang4_distance_input_.item.text = dis;
          break;
        case 5:
          qigang5_distance_input_.item.text = dis;
          break;
        case 6:
          qigang6_distance_input_.item.text = dis;
          break;
        case 7:
          qigang7_distance_input_.item.text = dis;
          break;
        case 8:
          qigang8_distance_input_.item.text = dis;
          break;
        case 9:
          qigang9_distance_input_.item.text = dis;
          break;
        case 10:
          qigang10_distance_input_.item.text = dis;
          break;
      }
    }

    function getAbsCurrentG() {
      var g_pos = operation_.getCurrentG();
      return Math.abs(g_pos);
    }

    function getCurrentG() {
      var g_id = operation_.getAxisIdInCard(internal_.axis_g_index_);
      var encode_dir = operation_.getEncodeDir(internal_.axis_g_index_) ? 1 : -1;
      var encode_ratio = operation_.getEncodeRatio(internal_.axis_g_index_);
      var units = operation_.getAxisPulsePerUnit(internal_.axis_g_index_);
      var encod_home_pose = operation_.getEncodeHomePose(internal_.axis_g_index_);
      var encode_value = operation_.getEncodeOriginValue(g_id);

      var encode_pose = encode_value / (units * encode_ratio) * encode_dir;
      var g_pos = encode_pose - encod_home_pose;
      return g_pos;
    }

    // switch io button disable
    function switchIOButtonDisable(disabled) {
      io1_.disabled = disabled;
      io2_.disabled = disabled;
      io3_.disabled = disabled;
      io4_.disabled = disabled;
    }

    // read config to refresh ui param
    function refreshParam() {
      var oem_param = getCustomParamIndex("BodaCylinder");
      if (oem_param >= 0) {
        raw_length_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 0));
        raw_tolerance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 1));
        io_pose_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 2));

        qigang1_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 3));
        qigang2_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 4));
        qigang3_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 5));
        qigang4_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 6));
        qigang5_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 7));
        qigang6_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 8));
        qigang7_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 9));
        qigang8_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 10));
        qigang9_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 11));
        qigang10_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 12));

        gback_distance_input_.item.text = parseFloat(operation_.getParamDoubleValue(oem_param, 13));
      }
    }

    // save ui param to config
    function saveParam() {
      var oem_param = getCustomParamIndex("BodaCylinder");
      if (oem_param >= 0) {
        param_.SetValue(getParamDoubleIndex(oem_param, 0), operation_.getRawLengthInput());
        param_.SetValue(getParamDoubleIndex(oem_param, 1), operation_.getRawToleranceInput());
        param_.SetValue(getParamDoubleIndex(oem_param, 2), operation_.getLocationIOPoseInput());
        param_.SetValue(getParamDoubleIndex(oem_param, 3), operation_.getCylinderInputDis(1));
        param_.SetValue(getParamDoubleIndex(oem_param, 4), operation_.getCylinderInputDis(2));
        param_.SetValue(getParamDoubleIndex(oem_param, 5), operation_.getCylinderInputDis(3));
        param_.SetValue(getParamDoubleIndex(oem_param, 6), operation_.getCylinderInputDis(4));
        param_.SetValue(getParamDoubleIndex(oem_param, 7), operation_.getCylinderInputDis(5));
        param_.SetValue(getParamDoubleIndex(oem_param, 8), operation_.getCylinderInputDis(6));
        param_.SetValue(getParamDoubleIndex(oem_param, 9), operation_.getCylinderInputDis(7));
        param_.SetValue(getParamDoubleIndex(oem_param, 10), operation_.getCylinderInputDis(8));
        param_.SetValue(getParamDoubleIndex(oem_param, 11), operation_.getCylinderInputDis(9));
        param_.SetValue(getParamDoubleIndex(oem_param, 12), operation_.getCylinderInputDis(10));
        param_.SetValue(getParamDoubleIndex(oem_param, 13), operation_.getGBackDistanceInput());
      }

      operation_.updateUiParamToPlc();
    }

    // save io status
    function saveIOStatus() {
      internal_.save_status_ = true;
      internal_.save_io_status1_ = operation_.getPlcStatus(internal_.status2_d_);
      internal_.save_io_status2_ = operation_.getPlcStatus(internal_.status3_d_);
      internal_.save_io_status3_ = operation_.getPlcStatus(internal_.status4_d_);
      internal_.save_io_status4_ = operation_.getPlcStatus(internal_.status5_d_);
    }

    // recovery io status
    function recoveryIOStatus() {
      if (internal_.save_status_ == true) {
        operation_.setPlcStatus(internal_.status2_d_, internal_.save_io_status1_);
        operation_.setPlcStatus(internal_.status3_d_, internal_.save_io_status2_);
        operation_.setPlcStatus(internal_.status4_d_, internal_.save_io_status3_);
        operation_.setPlcStatus(internal_.status5_d_, internal_.save_io_status4_);
      }

      internal_.save_status_ = false;
    }

    // set Cylinder to plc
    function setCylinderParamToPlc(index) {
      if (index < 0) {
        return;
      }

      var d_index = internal_.d_cylinder_index_base_ + index - 1;
      var distance = operation_.getCylinderInputDis(index);
      operation_.setPlcDoubleValue(d_index, distance);
    }

    // update Ui Param To Plc
    function updateUiParamToPlc() {
      operation_.updateAllCylinderParamToPlc();
      operation_.updateSteelSettingParam();
    }

    // update all cylinder param to plc
    function updateAllCylinderParamToPlc() {
      for (var i = 1 ; i <= internal_.cylinder_count_; ++i) {
        operation_.setCylinderParamToPlc(i);
      }
    }

    // update steel setting param
    function updateSteelSettingParam() {
      // raw length
      var value = operation_.getRawLengthInput();
      operation_.setPlcDoubleValue(internal_.raw_length_d_, value);

      // raw tolerance
      value = operation_.getRawToleranceInput();
      operation_.setPlcDoubleValue(internal_.raw_tolerance_d_, value);

      // location io distance
      value = operation_.getLocationIOPoseInput();
      operation_.setPlcDoubleValue(internal_.location_io_dis_d_, value);

      // g back dis
      value = operation_.getGBackDistanceInput();
      operation_.setPlcDoubleValue(internal_.g_back_d_, value);
    }

    // refresh all axis pose
    function refreshAllAxisParam() {
      operation_.refreshAxisPose('g');
      operation_.refreshAxisPose('u');
      operation_.refreshAxisPose('e');
      operation_.refreshAxisPose('h');
      operation_.refreshAxisPose('w');
      operation_.refreshAxisPose('v');
    }

    // refresh axis param
    function refreshAxisPose(axis_name) {
      var axis_index = operation_.getAxisIndex(axis_name);
      var axis_d_index = operation_.getAxisDIndex(axis_name);

      if (axis_index < 0 || axis_d_index < 0) {
        return;
      }

      var pose = operation_.getCncPose(axis_index);
      if (axis_name == 'g') {
        pose = operation_.getCurrentG();
      }
      operation_.setPlcDoubleValue(axis_d_index, pose);
    }

    // switch io status
    function switchIOStatus(d_index) {
      var status = operation_.getPlcStatus(d_index);
      operation_.setPlcStatus(d_index, !status);
    }

    // set d param
    function setDValue(d_index, value) {
      control_.SetPlcD(d_index, value);
    } 

    // get plc status
    function getPlcStatus(d_index) {
      var value = parseInt(control_.f(d_index));
      var status = value == internal_.trigger_ ? true : false;
      return status;
    }

    // set plc status
    function setPlcStatus(d_index, status) {
      var value = status == true ? internal_.trigger_ : internal_.no_trigger_;
      control_.SetPlcD(d_index, value);
    }

    // set plc double value
    function setPlcDoubleValue(d_index, value) {
      value = (value).toFixed(3) * 1000;
      control_.SetPlcD(d_index, value);
    }

    // get plc double value,轴序
    function getPlcDoubleValue(d_index) {
      var value = control_.GetPlcD(d_index) / 1000.0;
      return value;
    }

    // get cnc pose
    function getCncPose(axis_index) {
      var pose = control_.GetAxisPosition(axis_index).toFixed(3);
      return pose;
    }
	
	// MyWork
	function updateAxisToD(){
      // 1.get pose, and axis_index :axis_u_index_ | axis_e_index_
	  var axis_u_pos_value = 1000 * operation_.getCncPose(axis_u_index_).;
	  var axis_e_pos_value = 1000 * operation_.getCncPose(axis_e_index_);
	  // 2.push pos_value to d
	  control_.SetPlcD(axis_u_pose_d_, axis_u_pos_value);
	  control_.SetPlcD(axis_e_pose_d_, axis_e_pos_value);
	}

    /*
	function setPoseToD(axis_index, d_index) {
        var pos = getCncPose(axis_index); // 获取坐标值
        control_.SetPlcD(d_index, pos); // 将坐标值赋值给d指令
    }

    // 获取CNC坐标函数
    function getCncPose(axis_index) {
        var pose = control_.GetAxisPosition(axis_index);
        return pose;
    }

    // set d with value
    function setDValue(d_index, value) {
        control_.SetPlcD(d_index, value);
    }
    */

    /// Get axis d index
    function getAxisDIndex(axis_name) {
      var d_index = -1;
      switch (axis_name) {
        case 'g':
          d_index = internal_.axis_g_pose_d_;
          break;
        case 'u':
          d_index = internal_.axis_u_pose_d_;
          break;
        case 'e':
          d_index = internal_.axis_e_pose_d_;
          break;
        case 'h':
          d_index = internal_.axis_h_pose_d_;
          break;
        case 'w':
          d_index = internal_.axis_w_pose_d_;
          break;
        case 'v':
          d_index = internal_.axis_v_pose_d_;
          break;
        default:
          break;
      }

      return d_index;
    }

    /// Get aixs index
    function getAxisIndex(axis_name) {
      var axis_index = -1;
      switch (axis_name) {
        case 'g':
          axis_index = internal_.axis_g_index_;
          break;
        case 'u':
          axis_index = internal_.axis_u_index_;
          break;
        case 'e':
          axis_index = internal_.axis_e_index_;
          break;
        case 'h':
          axis_index = internal_.axis_h_index_;
          break;
        case 'w':
          axis_index = internal_.axis_w_index_;
          break;
        case 'v':
          axis_index = internal_.axis_v_index_;
          break;
        default:
          break;
      }

      return axis_index;
    }

    /// Get axis name
    function getAxisName(axis_index) {
      var axis_name = "";
      switch (axis_index) {
        case internal_.axis_g_index_:
          axis_name = 'g';
          break;
        case internal_.axis_u_index_:
          axis_name = 'u';
          break;
        case internal_.axis_e_index_:
          axis_name = 'e';
          break;
        case internal_.axis_h_index_:
          axis_name = 'h';
          break;
        case internal_.axis_w_index_:
          axis_name = 'w';
          break;
        case internal_.axis_v_index_:
          axis_name = 'v';
          break;
        default:
          break;
      }

      return axis_name;
    }

    /// Get encode ratio
    function getEncodeRatio(axis_index) {
      var MACHINETOOLAXESAXIS_ENCODERRATIO_MAP = 61043;
      var VALUE_OFFSET = 100;
      var value = param_.GetValue(MACHINETOOLAXESAXIS_ENCODERRATIO_MAP + VALUE_OFFSET * axis_index);

      var encode_ratio = 1.0;
      if (value !== "") {
        encode_ratio = parseFloat(value);
      }

      return encode_ratio;
    }

    /// Get encode dir (int)
    function getEncodeDir(axis_index) {
      var MACHINETOOLAXESAXIS_ENCODERDIR_MAP = 61044;
      var VALUE_OFFSET = 100;
      var value = param_.GetValue(MACHINETOOLAXESAXIS_ENCODERDIR_MAP + VALUE_OFFSET * axis_index);

      var encode_dir = 1;
      if (value !== "") {
        encode_dir = parseInt(value);
      }

      return encode_dir;
    }

    /// Get Home pose (float)
    function getEncodeHomePose(axis_index) {
      var MACHINETOOLAXESAXIS_ABSOLUTEENCODERHOMEPOS_MAP = 61042;
      var VALUE_OFFSET = 100;
      var value = param_.GetValue(MACHINETOOLAXESAXIS_ABSOLUTEENCODERHOMEPOS_MAP + VALUE_OFFSET * axis_index);

      var encode_home_pose = -Math.pow(2, 120);
      if (value !== "") {
        encode_home_pose = parseFloat(value);
      }

      return encode_home_pose;
    }

    /// Get Axis PulsePerUnit 获取单位轴脉冲
    function getAxisPulsePerUnit(axis_index) {
      var MACHINETOOLAXESAXIS_PULSEPERUNIT_MAP = 61009;
      var VALUE_OFFSET = 100;
      var value = param_.GetValue(MACHINETOOLAXESAXIS_PULSEPERUNIT_MAP + VALUE_OFFSET * axis_index);

      var pulse_per_unit = 0;
      if (value !== "") {
        pulse_per_unit = parseFloat(value);
      }

      return pulse_per_unit;
    }

    /// Get Encode value (float)
    function getEncodeOriginValue(axis_id_card) {
      var encode_value = 0;
      if (axis_id_card >= 0 && axis_id_card < 32) {
        var value = control_.ExcuteZmcCmd("?ENCODER(" + axis_id_card +")");
        encode_value = parseFloat(value);
      }

      return encode_value;
    }

    /// Get axis id in card (int)
    function getAxisIdInCard(axis_index) {
      var MACHINETOOLAXESAXIS_IDINCARD_MAP = 61001;
      var VALUE_OFFSET = 100;
      var value = param_.GetValue(MACHINETOOLAXESAXIS_IDINCARD_MAP + VALUE_OFFSET * axis_index);
      var axis_id = -1;
      if (value !== "") {
        axis_id = parseInt(value);
      }
      return axis_id;
    }

    // init param
    function initParam() {
      operation_.updateUiParamToPlc();
            // set auto mode flag
      operation_.setPlcStatus(internal_.auto_flag_d_, false);

      // clear status
      operation_.setPlcStatus(internal_.gcode_end_d_, false);
      operation_.setPlcStatus(internal_.part_begin_d_, false);
      operation_.setPlcStatus(internal_.part_end_d_, false);
      operation_.setPlcStatus(internal_.cut_segment_begin_d_, false);
      operation_.setPlcStatus(internal_.cut_segment_end_d_, false);

      control_.SetPlcM(internal_.g_back_m_, false);
      control_.SetPlcM(internal_.g_back_io_m_, false);

      var status = control_.GetPlcM(internal_.m_location_io_);
      operation_.setPlcStatus(internal_.location_io_d_, status);
    }

    // If not find "oem_name", it will create index of "oem_name"
    function getCustomParamIndex(oem_name) {
      for (var i = 0; param_.GetValue(36000 + i * 90).length > 0; ++i) {
        if (param_.GetValue(36000 + i * 90) == oem_name) {
          return i;
        }
      }
      param_.AppendCustomParam();
      param_.SetValue(36000 + i * 90, oem_name);
      return i;
    }

    // Get param_index value. If not find, create and set 0
    function getParamIntValue(oem_index, param_index) {
      var index = getParamIntIndex(oem_index, param_index);
      if (param_.GetValue(index).length == 0) {
        for (var i = 0; i <= param_index; i++) {
          var int_index = getParamIntIndex(oem_index, i);
          if (param_.GetValue(int_index).length == 0) {
            param_.AppendIntParam(oem_index);
            param_.SetValue(int_index, "0");
          }
        }
      }
      return param_.GetValue(index);
    }

    function getParamDoubleValue(oem_index, param_index) {
      var index = getParamDoubleIndex(oem_index, param_index);
      if (param_.GetValue(index).length == 0) {
        for (var i = 0; i <= param_index; i++) {
          var int_index = getParamDoubleIndex(oem_index, i);
          if (param_.GetValue(int_index).length == 0) {
            param_.AppendDoubleParam(oem_index);
            param_.SetValue(int_index, "0");
          }
        }
      }
      return param_.GetValue(index);
    }

    function getParamBoolValue(oem_index, param_index) {
      var index = getParamBoolIndex(oem_index, param_index);
      if (param_.GetValue(index).length == 0) {
        for (var i = 0; i <= param_index; i++) {
          var int_index = getParamBoolIndex(oem_index, i);
          if (param_.GetValue(int_index).length == 0) {
            param_.AppendBoolParam(oem_index);
            param_.SetValue(int_index, "0");
          }
        }
      }
      return param_.GetValue(index);
    }

    function getParamIntIndex(oem_index, param_index) {
      return 36000 + oem_index * 90 + param_index + 1;
    }

    function getParamDoubleIndex(oem_index, param_index) {
      return 36000 + oem_index * 90 + param_index + 31;
    }

    function getParamBoolIndex(oem_index, param_index) {
      return 36000 + oem_index * 90 + param_index + 61;
    }
  }

  Component.onCompleted: {
    operation_.refreshParam();
    operation_.initParam();
  }
}