{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher-gui,
  launch,
  launch-ros,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = mkSourceSet (sources: {
    "ur_description" = substituteSource {
      src = fetchgit {
        name = "ur_description-source";
        url = "https://github.com/ros2-gbp/ur_description-release.git";
        rev = "48ec53775ca46845b38c8d92afafc298fae0f6db";
        hash = "sha256-S49Zxap5rZMmT7JpRonDsJaITE/nW9zGBDHVhPVHS1M=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_description";
  version = "2.4.5-1";
  src = finalAttrs.passthru.sources."ur_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint-state-publisher-gui launch launch-ros robot-state-publisher rviz2 urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-pytest launch-testing-ament-cmake launch-testing-ros xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-tools" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "URDF description for Universal Robots";
  };
})
