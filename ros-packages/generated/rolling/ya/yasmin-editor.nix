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
  yasmin-plugins-manager,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_editor";
  version = "5.0.0-1";
  src = finalAttrs.passthru.sources."yasmin_editor";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclpy ros-environment yasmin yasmin-factory yasmin-plugins-manager ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lxml" "python3-pyqt5" "python3-tqdm" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclpy ros-environment yasmin yasmin-factory yasmin-plugins-manager ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" "python3-pyqt5" "python3-tqdm" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_editor" = substituteSource {
      src = fetchgit {
        name = "yasmin_editor-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "a45a048e619f025c1a7df5cfcf6d31a019c51663";
        hash = "sha256-fD0kEB4ZfO8fQKJgCvwqbnnRbA4Uat1ioHZchAgxMQY=";
      };
    };
  });
  meta = {
    description = "Editor for YASMIN (Yet Another State MachINe)";
  };
})
