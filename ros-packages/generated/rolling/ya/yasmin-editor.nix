{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  yasmin,
  yasmin-factory,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_editor";
  version = "4.2.3-1";
  src = finalAttrs.passthru.sources."yasmin_editor";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclpy ros-environment yasmin yasmin-factory ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lxml" "python3-pyqt5" "python3-tqdm" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclpy ros-environment yasmin yasmin-factory ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" "python3-pyqt5" "python3-tqdm" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_editor" = substituteSource {
      src = fetchgit {
        name = "yasmin_editor-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "964f5eb016d6cb5d248d92dba00a85787ba78fc4";
        hash = "sha256-LCWer+avjIu673gC7X8RHI7poJjsvl4eljnXCJhhhdg=";
      };
    };
  });
  meta = {
    description = "Editor for YASMIN (Yet Another State MachINe)";
  };
})
