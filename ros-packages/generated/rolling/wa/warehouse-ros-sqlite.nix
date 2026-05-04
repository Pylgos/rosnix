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
  substituteSource,
  warehouse-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "warehouse_ros_sqlite";
  version = "1.0.7-2";
  src = finalAttrs.passthru.sources."warehouse_ros_sqlite";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ class-loader rclcpp warehouse-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libsqlite3-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ class-loader rclcpp warehouse-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libsqlite3-dev" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "warehouse_ros_sqlite" = substituteSource {
      src = fetchgit {
        name = "warehouse_ros_sqlite-source";
        url = "https://github.com/ros2-gbp/warehouse_ros_sqlite-release.git";
        rev = "a5c2b95332b78e6818ca756c0459e1a488be3b20";
        hash = "sha256-YaNWLSSyY0atVzBQABKqmnxy6uzy6R70Ui410qXZiYk=";
      };
    };
  });
  meta = {
    description = "\n    Implementation of warehouse_ros for sqlite\n  ";
  };
})
