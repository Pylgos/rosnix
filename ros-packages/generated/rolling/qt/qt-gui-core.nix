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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."qt_gui_core";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_core" = substituteSource {
      src = fetchgit {
        name = "qt_gui_core-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "1cfe1859400b8bdad5a20c17cf5cf70085af2c91";
        hash = "sha256-ryX8zyzquebgOzwKLdr6A/NUlMIkpnTQlXWz4y0OOEM=";
      };
    };
  });
  meta = {
    description = "\n    Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.\n  ";
  };
})
