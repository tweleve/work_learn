/************************************************************************************
 * @copyright Copyright 2024 Shanghai Fangling Software Co., Ltd. All Rights Reserved.
 * @file      RefreshAxisToD.qml
 * @version   V1.0
 * @brief     axis to d
 * @author    Zhijun Huo (shihaozhou@flcnc.com)
 * @date      06/27/2024  (M/D/Y)
 * @details
 * @par History
 * Date  |  Author  |  Version  |  Description
 * ----  |  ------  |  -------  |  -----------
 * 06/27/2024  |  Zhijun Huo  | V1.0 | refresh axis x and y to d 
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

  Item {
    id: operation_

    QtObject {
      id: internal_

      /// Axis D index 427-458
      property int axis_x_pose_d_: 427;
      property int axis_y_pose_d_: 428;

      // Axis index
      property int axis_x_index_: 0;
      property int axis_y_index_: 5;

      // ModBusReg index
      property int mbr_index_:326

      // flush time and multiples
      property int time_flush_:100
      property int multiples_:1000
    }

    Controller {
      id: control_
    }

    // refresh axis pos to d
    Monitor {
      id: refresh_pos_to_d_
      timeout: internal_.time_flush_
      repeat: true
      running: true
      onUpdate: {
        if(operation_.getPlcStatusM()){
          operation_.updateAxisToD(internal_.axis_x_index_,internal_.axis_x_pose_d_)
          operation_.updateAxisToD(internal_.axis_y_index_,internal_.axis_y_pose_d_)
        }
      }
    }
	
	Monitor {
      triggeredOnStart: true
      repeat: false
      onUpdate: {
        root_.visible = false;
        root_.show = false;
      }
    }

    Parameter {
      id: param_
    }

    Logger {
      id: logger_
    }

    // Myfunction
    function updateAxisToD(axis_index,axis_index_d_){
      // get pose, and axis_index
      var axis_pos_value = internal_.multiples_ * operation_.getCncPose(axis_index);
      // push pos_value to d_index
      control_.SetPlcD(axis_index_d_, axis_pos_value);
    }

    // 1.get plc status
    function getPlcStatusM() {
      var status_bool = control_.GetPlcM(internal_.mbr_index_);
      return status_bool;
    }

    // 2.get cnc pose
    function getCncPose(axis_index) {
      var pose = control_.GetAxisPosition(axis_index).toFixed(3);
      return pose;
    }

  }

  Component.onCompleted: {
    
  }
}