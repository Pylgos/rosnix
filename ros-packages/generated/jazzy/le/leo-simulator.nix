{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo-gz-bringup,
  leo-gz-plugins,
  leo-gz-worlds,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "leo_simulator" = substituteSource {
      src = fetchgit {
        name = "leo_simulator-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "2eb3d91a1f287e2f534b9c7385b44b4b05bb07a9";
        hash = "sha256-9NYk63AFSej3cyv3E/oe0Je7ctEdJ/3W2HmArd4XKp0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "leo-simulator";
  version = "2.0.0-1";
  src = sources."leo_simulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ leo-gz-bringup leo-gz-plugins leo-gz-worlds ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage for Leo Rover Gazebo simulation in ROS2";
  };
}