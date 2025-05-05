{
  ament-cmake,
  ament-cmake-auto,
  ament-copyright,
  ament-cpplint,
  ament-flake8,
  ament-lint-auto,
  ament-lint-common,
  ament-pep257,
  ament-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  laser-geometry,
  message-filters,
  mkSourceSet,
  pcl-conversions,
  pcl-ros,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-sensor-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dual_laser_merger";
  version = "0.0.1-1";
  src = finalAttrs.passthru.sources."dual_laser_merger";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedNativeBuildInputs = [ geometry-msgs laser-geometry message-filters pcl-conversions pcl-ros rclcpp rclcpp-components tf2 tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-auto ];
  propagatedBuildInputs = [ geometry-msgs laser-geometry message-filters pcl-conversions pcl-ros rclcpp rclcpp-components tf2 tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  checkInputs = [ ament-copyright ament-cpplint ament-flake8 ament-lint-auto ament-lint-common ament-pep257 ament-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "dual_laser_merger" = substituteSource {
      src = fetchgit {
        name = "dual_laser_merger-source";
        url = "https://github.com/ros2-gbp/dual_laser_merger-release.git";
        rev = "e1776a50011aabbe855703e08b78e40a4bfbe437";
        hash = "sha256-k6n4Zz7U1+/hRdCJ1i61VsE3PPwNhvnG7GpwMwGXtoM=";
      };
    };
  });
  meta = {
    description = "merge dual lidar's scans.";
  };
})
