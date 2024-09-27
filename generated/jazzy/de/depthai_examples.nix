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
  rclcpp,
  robot_state_publisher,
  rosSystemPackages,
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
    deeplab_v3_plus_mnv2_decoder_256_openvino_2021-vendor_source-0ai6yzbm6jc525jmvrfh99pp66dl11fl9a5ciqd22p1a7iwkl1i8 = substituteSource {
      src = fetchurl {
        name = "deeplab_v3_plus_mnv2_decoder_256_openvino_2021-vendor_source-0ai6yzbm6jc525jmvrfh99pp66dl11fl9a5ciqd22p1a7iwkl1i8-source";
        url = "https://github.com/luxonis/depthai-experiments/blob/master/gen2-deeplabv3_multiclass/models/deeplab_v3_plus_mnv2_decoder_256_openvino_2021.4.blob?raw=true";
        hash = "sha256-KAY6eTwqXCEajqyoRF0ItBlzb0rQ5V1lEYVJU9f3Jio=";
      };
      substitutions = [
      ];
    };
    depthai_examples-9cf6f669f3238bf94c331e9f1d7d7b054197e662 = substituteSource {
      src = fetchgit {
        name = "depthai_examples-9cf6f669f3238bf94c331e9f1d7d7b054197e662-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "9cf6f669f3238bf94c331e9f1d7d7b054197e662";
        hash = "sha256-7LxGcJ7RKmYufxF+QwUQ9hNXr4ZUvf1hrkEZ3Ny82lk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD\n\"https://github.com/luxonis/depthai-experiments/blob/master/gen2-deeplabv3_multiclass/models/deeplab_v3_plus_mnv2_decoder_256_openvino_2021.4.blob?raw=true\"";
          to = "DOWNLOAD file://${deeplab_v3_plus_mnv2_decoder_256_openvino_2021-vendor_source-0ai6yzbm6jc525jmvrfh99pp66dl11fl9a5ciqd22p1a7iwkl1i8}";
        }
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \"https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/mobilenet-ssd_openvino_2021.2_6shave.blob\"";
          to = "DOWNLOAD file://${mobilenet-ssd_openvino_2021-vendor_source-0w9ym71gdq7176jwzlm70j63axq9hw4hwa68475hxgcas7jx0l2i}";
        }
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \"https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/tiny-yolo-v4_openvino_2021.2_6shave.blob\"";
          to = "DOWNLOAD file://${tiny-yolo-v4_openvino_2021-vendor_source-0lg8ypdpgx1j6vzn8yddwj09xqpahmqlipwja31fjav557i50k4q}";
        }
      ];
    };
    mobilenet-ssd_openvino_2021-vendor_source-0w9ym71gdq7176jwzlm70j63axq9hw4hwa68475hxgcas7jx0l2i = substituteSource {
      src = fetchurl {
        name = "mobilenet-ssd_openvino_2021-vendor_source-0w9ym71gdq7176jwzlm70j63axq9hw4hwa68475hxgcas7jx0l2i-source";
        url = "https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/mobilenet-ssd_openvino_2021.2_6shave.blob";
        hash = "sha256-UVDQ5dGKvQ7LIcgoDgmHCXc1jASn0s+lOeHg9sKpPnE=";
      };
      substitutions = [
      ];
    };
    tiny-yolo-v4_openvino_2021-vendor_source-0lg8ypdpgx1j6vzn8yddwj09xqpahmqlipwja31fjav557i50k4q = substituteSource {
      src = fetchurl {
        name = "tiny-yolo-v4_openvino_2021-vendor_source-0lg8ypdpgx1j6vzn8yddwj09xqpahmqlipwja31fjav557i50k4q-source";
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
  version = "2.10.1-1";
  src = sources.depthai_examples-9cf6f669f3238bf94c331e9f1d7d7b054197e662;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera_info_manager cv_bridge depth_image_proc depthai depthai_bridge depthai_descriptions depthai_ros_msgs foxglove_msgs image_transport rclcpp robot_state_publisher rviz_imu_plugin sensor_msgs std_msgs stereo_msgs vision_msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The depthai_examples package";
  };
}
