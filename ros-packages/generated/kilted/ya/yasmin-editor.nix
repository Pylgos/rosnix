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
  version = "4.0.1-1";
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
        rev = "8fad805784fc394513d8a654eca8e7462cab9815";
        hash = "sha256-fFUHDhH5JmC8bZG8gGQ1HMYaVF3t+DS3cMgC7ONSO8k=";
      };
    };
  });
  meta = {
    description = "Editor for YASMIN (Yet Another State MachINe)";
  };
})
