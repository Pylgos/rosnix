{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rc_common_msgs,
  rc_genicam_api,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  stereo_msgs,
  substituteSource,
}:
let
  sources = rec {
    rc_genicam_driver = substituteSource {
      src = fetchgit {
        name = "rc_genicam_driver-source";
        url = "https://github.com/ros2-gbp/rc_genicam_driver_ros2-release.git";
        rev = "d56cbe21b74232fd2602bc2cc2921c365d034321";
        hash = "sha256-DXGpRFliAauxi+eYKJddSkZfNo9jJ/5UsxBtJEkSdCs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_genicam_driver";
  version = "0.3.1-1";
  src = sources.rc_genicam_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_updater image_transport rc_common_msgs rc_genicam_api rclcpp rclcpp_components sensor_msgs stereo_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cppcheck ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Driver for rc_visard and rc_cube from Roboception GmbH";
  };
}
