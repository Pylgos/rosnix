{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2_storage,
  rosbag2_test_common,
  sqlite3_vendor,
  std_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_storage_sqlite3 = substituteSource {
      src = fetchFromGitHub {
        name = "rosbag2_storage_sqlite3-source";
        owner = "ros2-gbp";
        repo = "rosbag2-release";
        rev = "dc9614637cfcca001e88510a0133e776ec0b89c9";
        hash = "sha256-mkbunv+2kgd6fb0MwEJ2kiWjZy1jN7TE+Mg6j0DKSjI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_sqlite3";
  version = "0.29.0-1";
  src = sources.rosbag2_storage_sqlite3;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2_storage sqlite3_vendor yaml_cpp_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common rosbag2_test_common std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROSBag2 SQLite3 storage plugin";
  };
}
