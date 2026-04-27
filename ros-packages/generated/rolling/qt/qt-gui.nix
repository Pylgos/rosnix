{
  ament-cmake,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rosSystemPackages,
  substituteSource,
  tango-icons-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qt_gui";
  version = "2.10.5-1";
  src = finalAttrs.passthru.sources."qt_gui";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python python-qt-binding tango-icons-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding tango-icons-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "qt_gui" = substituteSource {
      src = fetchgit {
        name = "qt_gui-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "ca888f0d588ef57517544046ee65f4f6de5bd20e";
        hash = "sha256-V96iKyP0uLU41cHZGk+APxFch2yMqIasj1JBhCLVg4g=";
      };
    };
  });
  meta = {
    description = "\n    qt_gui provides the infrastructure for an integrated graphical user interface based on Qt.\n    It is extensible with Python- and C++-based plugins (implemented in separate packages) which can contribute arbitrary widgets.\n    It requires either PyQt or PySide bindings.\n  ";
  };
})
