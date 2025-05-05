{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control,
  joint-state-publisher-gui,
  launch,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus_description";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."crane_plus_description";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gz-ros2-control joint-state-publisher-gui launch robot-state-publisher rviz2 xacro ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ gz-ros2-control joint-state-publisher-gui launch robot-state-publisher rviz2 xacro ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus_description" = substituteSource {
      src = fetchgit {
        name = "crane_plus_description-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "4d28ee5a61c221e5aae4b430bdde74968f8c1466";
        hash = "sha256-u0G/0KoRjQLRXqmm9VUVOmcrdsZcAT49pZAgWNM5udg=";
      };
    };
  });
  meta = {
    description = "CRANE+ V2 description package";
  };
})
