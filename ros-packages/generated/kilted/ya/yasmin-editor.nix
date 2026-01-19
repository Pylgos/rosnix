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
  version = "4.2.4-1";
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
        rev = "b1d849c7cfb0296e30f6c2ff8bfe615f1d8ce0dd";
        hash = "sha256-rI+e5vGGrca1gEa/HeTFPJu5N23wyNqDJ74l/tSrUE8=";
      };
    };
  });
  meta = {
    description = "Editor for YASMIN (Yet Another State MachINe)";
  };
})
