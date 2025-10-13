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
  version = "2.9.2-1";
  src = finalAttrs.passthru.sources."qt_gui_core";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_core" = substituteSource {
      src = fetchgit {
        name = "qt_gui_core-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "85cc0896ad15cfb57f1d59c724c2336904ab9d42";
        hash = "sha256-2rhI7takr150FVw5ewZUhc2ILgdIT0kKUtK3Wq0aMPo=";
      };
    };
  });
  meta = {
    description = "\n    Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.\n  ";
  };
})
