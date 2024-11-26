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
        rev = "1b789fe079cfd519d6b52af9da1ece80b617b2d7";
        hash = "sha256-XBjby/cle6UcIPSo+NLF8GfT7LiAiSh7oBDgsJi2IWc=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "dual_laser_merger";
  version = "0.3.1-1";
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
