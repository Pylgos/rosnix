{
  ament-cmake,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "depthai_examples" = substituteSource {
      src = fetchgit {
        name = "depthai_examples-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "d734a390b4045623a9b7c7e82358d657604d7376";
        hash = "sha256-urfVIo8q7eOt8vQjo9v71wqhvVHCw1mzXTZ/4dPipXg=";
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
      substitutions = [
      ];
    };
    "depthai_examples/mobilenet-ssd_openvino_2021" = substituteSource {
      src = fetchurl {
        name = "mobilenet-ssd_openvino_2021-source";
        url = "https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/mobilenet-ssd_openvino_2021.2_6shave.blob";
        hash = "sha256-UVDQ5dGKvQ7LIcgoDgmHCXc1jASn0s+lOeHg9sKpPnE=";
      };
      substitutions = [
      ];
    };
    "depthai_examples/tiny-yolo-v4_openvino_2021" = substituteSource {
      src = fetchurl {
        name = "tiny-yolo-v4_openvino_2021-source";
        url = "https://artifacts.luxonis.com/artifactory/luxonis-depthai-data-local/network/tiny-yolo-v4_openvino_2021.2_6shave.blob";
        hash = "sha256-mExQ4illK+nCUJLfSHGF6uKegOSteWT/NjL0d9v16FE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "depthai_examples";
  version = "2.10.2-1";
  src = finalAttrs.passthru.sources."depthai_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ camera-info-manager cv-bridge depth-image-proc depthai depthai-bridge depthai-descriptions depthai-ros-msgs foxglove-msgs image-transport rclcpp robot-state-publisher rviz-imu-plugin sensor-msgs std-msgs stereo-msgs vision-msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The depthai_examples package";
  };
})
