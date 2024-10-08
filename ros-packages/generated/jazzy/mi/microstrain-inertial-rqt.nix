{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  microstrain-inertial-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "microstrain_inertial_rqt" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_rqt-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "aadd1cd9bb0be3d6d5c2285d3ff2f559ca13f750";
        hash = "sha256-PmfMnM67zdGmBxihr+jVfGvg9kgpjXm/QhtBQmz2ZZk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "microstrain_inertial_rqt";
  version = "4.4.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_rqt";
  nativeBuildInputs = [ wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs microstrain-inertial-msgs nav-msgs rclpy rqt-gui rqt-gui-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "The microstrain_inertial_rqt package provides several RQT widgets to view the status of Microstrain devices";
  };
})
