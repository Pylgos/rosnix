{
  ament-cmake,
  ament-cmake-python,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
  yasmin,
  yasmin-msgs,
  yasmin-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_viewer";
  version = "5.0.0-2";
  src = finalAttrs.passthru.sources."yasmin_viewer";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp rclpy yasmin yasmin-msgs yasmin-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-cpp rclcpp rclpy yasmin yasmin-msgs yasmin-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_viewer" = substituteSource {
      src = fetchgit {
        name = "yasmin_viewer-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "01ca1ec804e42daec267c6df5a7ae6bee9023372";
        hash = "sha256-hA+GxJDYjZiu6l3SfmgYDlhuhqw39ODuaona14acl7Y=";
      };
    };
  });
  meta = {
    description = "YASMIN viewer for FSM";
  };
})
