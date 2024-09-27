{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    dummy_map_server-013262b4101af3984b2783493b5891d248ba0f04 = substituteSource {
      src = fetchgit {
        name = "dummy_map_server-013262b4101af3984b2783493b5891d248ba0f04-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "013262b4101af3984b2783493b5891d248ba0f04";
        hash = "sha256-gy4gx1dyM0ezKzQen9Q6Mnpx5IKPpthH+UePo7rzaw0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_map_server";
  version = "0.34.2-1";
  src = sources.dummy_map_server-013262b4101af3984b2783493b5891d248ba0f04;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ nav_msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "dummy map server node";
  };
}
