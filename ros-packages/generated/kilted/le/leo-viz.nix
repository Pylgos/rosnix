{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-publisher,
  joint-state-publisher-gui,
  leo-description,
  mkSourceSet,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_viz";
  version = "3.0.0-3";
  src = finalAttrs.passthru.sources."leo_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ joint-state-publisher joint-state-publisher-gui leo-description rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joint-state-publisher joint-state-publisher-gui leo-description rviz2 ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_viz" = substituteSource {
      src = fetchgit {
        name = "leo_viz-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "2a56725828f4169227fc073ae22cbe1862bb3c5f";
        hash = "sha256-JrS6oiobEEu7mNXfAH7Ayk6hIbPY0ldoaaA3B4v78iI=";
      };
    };
  });
  meta = {
    description = "\n    Visualization launch files and RViz configurations for Leo Rover\n  ";
  };
})
