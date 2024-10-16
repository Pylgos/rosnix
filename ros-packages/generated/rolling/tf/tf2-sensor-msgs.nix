{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  sensor-msgs-py,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-ros-py,
}:
let
  sources = mkSourceSet (sources: {
    "tf2_sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "dfd8f654b9e3ad166dc722f398b58e44d76b234d";
        hash = "sha256-v/gcBTLkgODybIjW3ZUsGfcdWgNJODEJGI5+l/VIwUI=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_sensor_msgs";
  version = "0.39.1-1";
  src = finalAttrs.passthru.sources."tf2_sensor_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs sensor-msgs sensor-msgs-py std-msgs tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-numpy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Small lib to transform sensor_msgs with tf. Most notably, PointCloud2";
  };
})
