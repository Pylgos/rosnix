{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  interactive-markers,
  mkSourceSet,
  qt-gui-py-common,
  rclpy,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  rqt-gui,
  rqt-gui-py,
  std-msgs,
  substituteSource,
  tf-transformations,
  tf2-ros,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "frame_editor";
  version = "2.0.2-5";
  src = finalAttrs.passthru.sources."frame_editor";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs interactive-markers qt-gui-py-common rclpy rosidl-default-generators rosidl-default-runtime rqt-gui rqt-gui-py std-msgs tf2-ros tf-transformations visualization-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs interactive-markers qt-gui-py-common rclpy rosidl-default-generators rosidl-default-runtime rqt-gui rqt-gui-py std-msgs tf2-ros tf-transformations visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "frame_editor" = substituteSource {
      src = fetchgit {
        name = "frame_editor-source";
        url = "https://github.com/ros2-gbp/rqt_frame_editor_plugin-release.git";
        rev = "03f5dc280fff08df4165fb9c46baa3b91cc20c86";
        hash = "sha256-qel4UEbMZfz7VQjCsSw1Z3nfxVNUBV9fNRn+s6hPrmY=";
      };
    };
  });
  meta = {
    description = "The frame_editor package";
  };
})
