{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot4-viz,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_desktop" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_desktop-source";
        url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
        rev = "c216a96b2199bb366549440b715e0efb6a626cbb";
        hash = "sha256-Sm+AW/MaBF+UFPE6xYjHvSY75R4PSkkxG6FQEsboGsE=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_desktop";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_desktop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ turtlebot4-viz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Turtlebot4 Desktop Metapackage";
  };
})
