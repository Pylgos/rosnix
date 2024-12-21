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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."qt_gui_core";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui_core" = substituteSource {
      src = fetchgit {
        name = "qt_gui_core-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "fad49dcaf08abb0379cc80c7742ffedcd8bee3fc";
        hash = "sha256-6wk5EDXB8FOnmk8nGM8yg6tj1ZY71u422N1fu0YHKpg=";
      };
    };
  });
  meta = {
    description = "Integration of the ROS package system and ROS-specific plugins for a Qt-based GUI.";
  };
})
