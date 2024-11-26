{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui_core";
  version = "2.8.3-1";
  src = finalAttrs.passthru.sources."qt_gui_core";
  nativeBuildInputs = [ ament-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "qt_gui_core" = substituteSource {
        src = fetchgit {
          name = "qt_gui_core-source";
          url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
          rev = "20b92558ee94b4d0eb6fb6abefb17f9f6bc23664";
          hash = "sha256-xecEm+tbZ72Uxeso+0PASCvCJK4OscTsthfI7NOeyzU=";
        };
      };
    });
  };
  meta = {
    description = "Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.";
  };
})
