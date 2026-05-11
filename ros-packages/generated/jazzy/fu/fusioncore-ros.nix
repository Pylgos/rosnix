{
  ament-cmake,
  buildAmentCmakePackage,
  compass-msgs,
  diagnostic-msgs,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  fusioncore-core,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fusioncore_ros";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."fusioncore_ros";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ compass-msgs diagnostic-msgs eigen3-cmake-module fusioncore-core geographic-msgs geometry-msgs nav-msgs rclcpp rclcpp-lifecycle rosidl-default-runtime sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "proj" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ compass-msgs diagnostic-msgs eigen3-cmake-module fusioncore-core geographic-msgs geometry-msgs nav-msgs rclcpp rclcpp-lifecycle rosidl-default-runtime sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "proj" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fusioncore_ros" = substituteSource {
      src = fetchgit {
        name = "fusioncore_ros-source";
        url = "https://github.com/manankharwar/fusioncore-release.git";
        rev = "310f6bbf787e0ce76f0bec8899bc08c51f220b78";
        hash = "sha256-lXTqHxeWrsdDL9gAXSBR3KtMtAR3I4vXnNccy6WFamI=";
      };
    };
  });
  meta = {
    description = "ROS 2 UKF sensor fusion for GPS, IMU and wheel encoders. 22-state filter with ECEF-native GPS handling, automatic IMU bias estimation, adaptive noise covariance, and chi-squared outlier rejection on every sensor. Drop-in robot_localization alternative. Native ROS 2 Jazzy and Humble, benchmarked on 6 NCLT public dataset sequences.";
  };
})
