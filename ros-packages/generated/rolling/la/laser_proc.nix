{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    laser_proc-375ba7dddba78c60149bc553a781315bcd626d77 = substituteSource {
      src = fetchgit {
        name = "laser_proc-375ba7dddba78c60149bc553a781315bcd626d77-source";
        url = "https://github.com/ros2-gbp/laser_proc-release.git";
        rev = "375ba7dddba78c60149bc553a781315bcd626d77";
        hash = "sha256-h2lPjaJimCF/20eVEH3+ZS7CDqoML9voXq2B0x32NSY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "laser_proc";
  version = "1.0.2-6";
  src = sources.laser_proc-375ba7dddba78c60149bc553a781315bcd626d77;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ class_loader rclcpp rclcpp_components sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "laser_proc";
  };
}
