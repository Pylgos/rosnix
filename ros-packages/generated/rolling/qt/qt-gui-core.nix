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
  version = "2.10.1-1";
  src = finalAttrs.passthru.sources."qt_gui_core";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_core" = substituteSource {
      src = fetchgit {
        name = "qt_gui_core-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "521edb5682672497f25ac33c509a7e2361eb9231";
        hash = "sha256-HwfaxKMJwWA0ipCsUt9hE7qRn6RcLvUYPDQvh0IjTk8=";
      };
    };
  });
  meta = {
    description = "\n    Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.\n  ";
  };
})
