{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  sensor-msgs,
  sick-safetyscanners-base,
  sick-safetyscanners2-interfaces,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "sick_safetyscanners2" = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners2-source";
        url = "https://github.com/ros2-gbp/sick_safetyscanners2-release.git";
        rev = "96914d8dd6643a74aabae6292156b3aacaf790ca";
        hash = "sha256-DW09MAyJl2QfVunwcVkkufbRSONasFc8m8M5qpi9Dw8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "sick_safetyscanners2";
  version = "1.0.4-1";
  src = sources."sick_safetyscanners2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic-updater rclcpp rclcpp-lifecycle robot-state-publisher rviz2 sensor-msgs sick-safetyscanners2-interfaces sick-safetyscanners-base xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch-testing-ament-cmake launch-testing-ros xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-tools" ]; };
  meta = {
    description = "ROS2 Driver for the SICK safetyscanners";
  };
}
