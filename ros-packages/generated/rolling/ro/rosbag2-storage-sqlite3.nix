{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2-storage,
  rosbag2-test-common,
  sqlite3-vendor,
  std-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "rosbag2_storage_sqlite3" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_sqlite3-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "dc9614637cfcca001e88510a0133e776ec0b89c9";
        hash = "sha256-mkbunv+2kgd6fb0MwEJ2kiWjZy1jN7TE+Mg6j0DKSjI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosbag2_storage_sqlite3";
  version = "0.29.0-1";
  src = sources."rosbag2_storage_sqlite3";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib rcpputils rcutils rosbag2-storage sqlite3-vendor yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rosbag2-test-common std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROSBag2 SQLite3 storage plugin";
  };
}
