{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    gps_tools-04f6468301ac6916a9c164f10dfc565e495cb679 = substituteSource {
      src = fetchgit {
        name = "gps_tools-04f6468301ac6916a9c164f10dfc565e495cb679-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "04f6468301ac6916a9c164f10dfc565e495cb679";
        hash = "sha256-QlW/IzkRFxYsEks3A9lEuQANpxUCf0RKCDA/PSsqzyg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gps_tools";
  version = "2.0.3-2";
  src = sources.gps_tools-04f6468301ac6916a9c164f10dfc565e495cb679;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gps_msgs nav_msgs rclcpp rclcpp_components rclpy sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "GPS routines for use in GPS drivers";
  };
}
