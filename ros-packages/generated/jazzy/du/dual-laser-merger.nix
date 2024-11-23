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
let
  sources = mkSourceSet (sources: {
    "dual_laser_merger" = substituteSource {
      src = fetchgit {
        name = "dual_laser_merger-source";
        url = "https://github.com/ros2-gbp/dual_laser_merger-release.git";
        rev = "693b3b2c82703ea08e68ead07f472c9974e55b7a";
        hash = "sha256-k6n4Zz7U1+/hRdCJ1i61VsE3PPwNhvnG7GpwMwGXtoM=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "dual_laser_merger";
  version = "0.0.1-1";
  src = finalAttrs.passthru.sources."dual_laser_merger";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs laser-geometry message-filters pcl-conversions pcl-ros rclcpp rclcpp-components tf2 tf2-ros tf2-sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-cpplint ament-flake8 ament-lint-auto ament-lint-common ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "merge dual lidar's scans.";
  };
})
