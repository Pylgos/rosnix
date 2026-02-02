{
  ament-cmake,
  ament-cmake-python,
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
  version = "4.2.4-1";
  src = finalAttrs.passthru.sources."yasmin_viewer";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rclcpp rclpy yasmin yasmin-msgs yasmin-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-expiringdict" "python3-flask" "python3-flask-socketio" "python3-waitress" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclcpp rclpy yasmin yasmin-msgs yasmin-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-expiringdict" "python3-flask" "python3-flask-socketio" "python3-waitress" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_viewer" = substituteSource {
      src = fetchgit {
        name = "yasmin_viewer-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "8d9d0ed380041cf2f64090ce150aafc4e1c04dcb";
        hash = "sha256-vOMMIswJulaK5E/xtfgr1NnMqML7irNO0wVvs/BAtYg=";
      };
    };
  });
  meta = {
    description = "YASMIN viewer for FSM";
  };
})
