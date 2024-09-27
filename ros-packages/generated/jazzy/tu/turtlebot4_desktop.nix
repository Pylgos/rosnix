{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  turtlebot4_viz,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_desktop-c216a96b2199bb366549440b715e0efb6a626cbb = substituteSource {
      src = fetchgit {
        name = "turtlebot4_desktop-c216a96b2199bb366549440b715e0efb6a626cbb-source";
        url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
        rev = "c216a96b2199bb366549440b715e0efb6a626cbb";
        hash = "sha256-Sm+AW/MaBF+UFPE6xYjHvSY75R4PSkkxG6FQEsboGsE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_desktop";
  version = "2.0.1-1";
  src = sources.turtlebot4_desktop-c216a96b2199bb366549440b715e0efb6a626cbb;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ turtlebot4_viz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Turtlebot4 Desktop Metapackage";
  };
}
