{
  ament-cmake,
  buildAmentCmakePackage,
  camera-info-manager,
  cv-bridge,
  depth-image-proc,
  depthai,
  depthai-bridge,
  depthai-descriptions,
  depthai-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  foxglove-msgs,
  image-transport,
  mkSourceSet,
  rclcpp,
  robot-state-publisher,
  ros-environment,
  rosSystemPackages,
  rviz-imu-plugin,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  vision-msgs,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai_examples";
  version = "2.11.2-1";
  src = finalAttrs.passthru.sources."depthai_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ camera-info-manager cv-bridge depth-image-proc depthai depthai-bridge depthai-descriptions depthai-ros-msgs foxglove-msgs image-transport rclcpp robot-state-publisher ros-environment rviz-imu-plugin sensor-msgs std-msgs stereo-msgs vision-msgs xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-info-manager cv-bridge depth-image-proc depthai depthai-bridge depthai-descriptions depthai-ros-msgs foxglove-msgs image-transport rclcpp robot-state-publisher ros-environment rviz-imu-plugin sensor-msgs std-msgs stereo-msgs vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "depthai_examples" = substituteSource {
      src = fetchgit {
        name = "depthai_examples-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "4eabae61875e841e06b1769abe898c9a8c8a2afd";
        hash = "sha256-mDM7yG/0fl38S8CYe+Qsje1zT4ff+Ns/g+eqF5YN+hg=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD\n\"https://github.com/luxonis/depthai-experiments/blob/master/gen2-deeplabv3_multiclass/models/deeplab_v3_plus_mnv2_decoder_256_openvino_2021.4.blob?raw=true\"";
          to = "DOWNLOAD file://${sources."depthai_examples/deeplab_v3_plus_mnv2_decoder_256_openvino_2021"}";
        }
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \"https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/mobilenet-ssd_openvino_2021.2_6shave.blob\"";
          to = "DOWNLOAD file://${sources."depthai_examples/mobilenet-ssd_openvino_2021"}";
        }
        {
          path = "CMakeLists.txt";
          from = "DOWNLOAD \"https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/tiny-yolo-v4_openvino_2021.2_6shave.blob\"";
          to = "DOWNLOAD file://${sources."depthai_examples/tiny-yolo-v4_openvino_2021"}";
        }
      ];
    };
    "depthai_examples/deeplab_v3_plus_mnv2_decoder_256_openvino_2021" = substituteSource {
      src = fetchurl {
        name = "deeplab_v3_plus_mnv2_decoder_256_openvino_2021-source";
        url = "https://github.com/luxonis/depthai-experiments/blob/master/gen2-deeplabv3_multiclass/models/deeplab_v3_plus_mnv2_decoder_256_openvino_2021.4.blob?raw=true";
        hash = "sha256-KAY6eTwqXCEajqyoRF0ItBlzb0rQ5V1lEYVJU9f3Jio=";
      };
    };
    "depthai_examples/mobilenet-ssd_openvino_2021" = substituteSource {
      src = fetchurl {
        name = "mobilenet-ssd_openvino_2021-source";
        url = "https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/mobilenet-ssd_openvino_2021.2_6shave.blob";
        hash = "sha256-UVDQ5dGKvQ7LIcgoDgmHCXc1jASn0s+lOeHg9sKpPnE=";
      };
    };
    "depthai_examples/tiny-yolo-v4_openvino_2021" = substituteSource {
      src = fetchurl {
        name = "tiny-yolo-v4_openvino_2021-source";
        url = "https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/tiny-yolo-v4_openvino_2021.2_6shave.blob";
        hash = "sha256-mExQ4illK+nCUJLfSHGF6uKegOSteWT/NjL0d9v16FE=";
      };
    };
  });
  meta = {
    description = "The depthai_examples package";
  };
})
