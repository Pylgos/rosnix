{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    tuw_geometry-1ec8432bce0f5c3155a16a68991b6ec9963a2e12 = substituteSource {
      src = fetchgit {
        name = "tuw_geometry-1ec8432bce0f5c3155a16a68991b6ec9963a2e12-source";
        url = "https://github.com/ros2-gbp/tuw_geometry-release.git";
        rev = "1ec8432bce0f5c3155a16a68991b6ec9963a2e12";
        hash = "sha256-3joMrg733OXs5YY23/zK9hQEuS0t3jlDrTEsNlr8C3Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tuw_geometry";
  version = "0.0.7-4";
  src = sources.tuw_geometry-1ec8432bce0f5c3155a16a68991b6ec9963a2e12;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The tuw_geometry package";
  };
}
