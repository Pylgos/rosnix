{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    realtime_tools = substituteSource {
      src = fetchFromGitHub {
        name = "realtime_tools-source";
        owner = "ros2-gbp";
        repo = "realtime_tools-release";
        rev = "91d15b9a3f699da477e644ad53208cbd93a9b8b1";
        hash = "sha256-mJ0j1sX7BpeTC7S7CmAoZXA0XLrOcy22ZW4+t0CWR4A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "realtime_tools";
  version = "2.6.0-1";
  src = sources.realtime_tools;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp_action ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock lifecycle_msgs rclcpp_lifecycle test_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Contains a set of tools that can be used from a hard realtime thread, without breaking the realtime behavior.";
  };
}
