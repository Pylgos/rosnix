{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rviz2" = substituteSource {
      src = fetchgit {
        name = "rviz2-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "3b74291e5624c206c7bd6b1e943e669562558bf1";
        hash = "sha256-9z/KAmTAatuqQTqLzneMzaarQe2wvad9FwyKoVJcxz0=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz2";
  version = "14.3.1-1";
  src = finalAttrs.passthru.sources."rviz2";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rviz-common rviz-default-plugins rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pytest ament-lint-auto ament-lint-common geometry-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "3D visualization tool for ROS.";
  };
})
