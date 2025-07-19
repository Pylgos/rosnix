{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  zbar-ros-interfaces,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "zbar_ros";
  version = "0.7.0-2";
  src = finalAttrs.passthru.sources."zbar_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge rclcpp sensor-msgs std-msgs zbar-ros-interfaces ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "zbar" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge rclcpp sensor-msgs std-msgs zbar-ros-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zbar" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "zbar_ros" = substituteSource {
      src = fetchgit {
        name = "zbar_ros-source";
        url = "https://github.com/ros2-gbp/zbar_ros-release.git";
        rev = "58b4ff95f8a0c05d4c6ddf4629e8c69e42998315";
        hash = "sha256-ABj7YLhPfSz7aMGTa8kmb/hLGuY9WLHpwfxsdwZbBWI=";
      };
    };
  });
  meta = {
    description = "Lightweight ROS wrapper for Zbar barcode/qrcode reader library (http://zbar.sourceforge\n    .net/)";
  };
})
