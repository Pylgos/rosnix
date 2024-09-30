{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sqlite3-vendor,
  substituteSource,
  warehouse-ros,
}:
let
  sources = mkSourceSet (sources: {
    "warehouse_ros_sqlite" = substituteSource {
      src = fetchgit {
        name = "warehouse_ros_sqlite-source";
        url = "https://github.com/ros2-gbp/warehouse_ros_sqlite-release.git";
        rev = "73680e23c32c168ac82d2033a13d4cd8a5c08f74";
        hash = "sha256-c1zikw94u1NKRvvSe3QEhXnRv1v5RH+vZQe6zOWG+mQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "warehouse_ros_sqlite";
  version = "1.0.5-1";
  src = sources."warehouse_ros_sqlite";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ class-loader rclcpp sqlite3-vendor warehouse-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Implementation of warehouse_ros for sqlite";
  };
}
