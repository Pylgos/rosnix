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
  mkSourceSet,
  rc_common_msgs,
  rc_genicam_api,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  stereo_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rc_genicam_driver" = substituteSource {
      src = fetchgit {
        name = "rc_genicam_driver-source";
        url = "https://github.com/ros2-gbp/rc_genicam_driver_ros2-release.git";
        rev = "54ae34d134aaab76623d61c9728d34503bc68b26";
        hash = "sha256-DXGpRFliAauxi+eYKJddSkZfNo9jJ/5UsxBtJEkSdCs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rc_genicam_driver";
  version = "0.3.1-1";
  src = sources."rc_genicam_driver";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_updater image_transport rc_common_msgs rc_genicam_api rclcpp rclcpp_components sensor_msgs stereo_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for rc_visard and rc_cube from Roboception GmbH";
  };
}
