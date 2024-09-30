{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  laser-geometry,
  launch,
  launch-ros,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-sensor-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "pointcloud_to_laserscan" = substituteSource {
      src = fetchgit {
        name = "pointcloud_to_laserscan-source";
        url = "https://github.com/ros2-gbp/pointcloud_to_laserscan-release.git";
        rev = "f1cea776ee8801bc6833e635f83efcbc9a589d73";
        hash = "sha256-qr3WavBoAsGaLii5dCMmNk764fMGdISwf7EAd5q14MQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "pointcloud_to_laserscan";
  version = "2.0.2-2";
  src = sources."pointcloud_to_laserscan";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ laser-geometry launch launch-ros message-filters rclcpp rclcpp-components sensor-msgs tf2 tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Converts a 3D Point Cloud into a 2D laser scan. This is useful for making devices like the Kinect appear like a laser scanner for 2D-based algorithms (e.g. laser-based SLAM).";
  };
}
