{
  ament_cmake,
  buildRosPackage,
  camera_info_manager,
  cv_bridge,
  depth_image_proc,
  depthai,
  depthai_bridge,
  depthai_descriptions,
  depthai_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  foxglove_msgs,
  image_transport,
  opencv,
  rclcpp,
  robot_state_publisher,
  ros_environment,
  rviz_imu_plugin,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  vision_msgs,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    depthai_examples = substituteSource {
      src = fetchgit {
        name = "depthai_examples-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "1830cee35b19673de07dc2ecd6fb1343d55235e4";
        hash = "sha256-jHAWYyIasl4ctginzbQrJPCY2OQhVW4uWywxdB3MCIU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD\n\"https://github.com/luxonis/depthai-experiments/blob/master/gen2-deeplabv3_multiclass/models/deeplab_v3_plus_mnv2_decoder_256_openvino_2021.4.blob?raw=true\"";
          to = "DOWNLOAD file://${depthai_examples-vendor_source-deeplab_v3_plus_mnv2_decoder_256_openvino_2021-0}";
        }
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \"https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/mobilenet-ssd_openvino_2021.2_6shave.blob\"";
          to = "DOWNLOAD file://${depthai_examples-vendor_source-mobilenet-ssd_openvino_2021-0}";
        }
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \"https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/tiny-yolo-v4_openvino_2021.2_6shave.blob\"";
          to = "DOWNLOAD file://${depthai_examples-vendor_source-tiny-yolo-v4_openvino_2021-0}";
        }
      ];
    };
    depthai_examples-vendor_source-deeplab_v3_plus_mnv2_decoder_256_openvino_2021-0 = substituteSource {
      src = fetchurl {
        name = "depthai_examples-vendor_source-deeplab_v3_plus_mnv2_decoder_256_openvino_2021-0-source";
        url = "https://github.com/luxonis/depthai-experiments/blob/master/gen2-deeplabv3_multiclass/models/deeplab_v3_plus_mnv2_decoder_256_openvino_2021.4.blob?raw=true";
        hash = "sha256-KAY6eTwqXCEajqyoRF0ItBlzb0rQ5V1lEYVJU9f3Jio=";
      };
      substitutions = [
      ];
    };
    depthai_examples-vendor_source-mobilenet-ssd_openvino_2021-0 = substituteSource {
      src = fetchurl {
        name = "depthai_examples-vendor_source-mobilenet-ssd_openvino_2021-0-source";
        url = "https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/mobilenet-ssd_openvino_2021.2_6shave.blob";
        hash = "sha256-UVDQ5dGKvQ7LIcgoDgmHCXc1jASn0s+lOeHg9sKpPnE=";
      };
      substitutions = [
      ];
    };
    depthai_examples-vendor_source-tiny-yolo-v4_openvino_2021-0 = substituteSource {
      src = fetchurl {
        name = "depthai_examples-vendor_source-tiny-yolo-v4_openvino_2021-0-source";
        url = "https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/tiny-yolo-v4_openvino_2021.2_6shave.blob";
        hash = "sha256-mExQ4illK+nCUJLfSHGF6uKegOSteWT/NjL0d9v16FE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_examples";
  version = "2.10.0-1";
  src = sources.depthai_examples;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager cv_bridge depth_image_proc depthai depthai_bridge depthai_descriptions depthai_ros_msgs foxglove_msgs image_transport opencv rclcpp robot_state_publisher rviz_imu_plugin sensor_msgs std_msgs stereo_msgs vision_msgs xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The depthai_examples package";
  };
}