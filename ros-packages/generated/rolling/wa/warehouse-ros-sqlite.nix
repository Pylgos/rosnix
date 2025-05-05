{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "warehouse_ros_sqlite";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."warehouse_ros_sqlite";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ class-loader rclcpp sqlite3-vendor warehouse-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ class-loader rclcpp sqlite3-vendor warehouse-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "warehouse_ros_sqlite" = substituteSource {
      src = fetchgit {
        name = "warehouse_ros_sqlite-source";
        url = "https://github.com/ros2-gbp/warehouse_ros_sqlite-release.git";
        rev = "22499a8fd19e66870fe3bfa41570e8ecca6d6d73";
        hash = "sha256-c1zikw94u1NKRvvSe3QEhXnRv1v5RH+vZQe6zOWG+mQ=";
      };
    };
  });
  meta = {
    description = "\n    Implementation of warehouse_ros for sqlite\n  ";
  };
})
