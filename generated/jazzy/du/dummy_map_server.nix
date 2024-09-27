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
    dummy_map_server-251bec8deb312789dad96f65c31409b45df2cec3 = substituteSource {
      src = fetchgit {
        name = "dummy_map_server-251bec8deb312789dad96f65c31409b45df2cec3-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "251bec8deb312789dad96f65c31409b45df2cec3";
        hash = "sha256-NVk5s+9vu7JiXH8MRaXY+ei9yeqVpLkbp7NsDWO4Zgs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_map_server";
  version = "0.33.5-1";
  src = sources.dummy_map_server-251bec8deb312789dad96f65c31409b45df2cec3;
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
