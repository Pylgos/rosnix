{
  ament-cmake,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."yasmin_viewer";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rclcpp rclpy yasmin yasmin-msgs yasmin-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-expiringdict" "python3-flask" "python3-waitress" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclcpp rclpy yasmin yasmin-msgs yasmin-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-expiringdict" "python3-flask" "python3-waitress" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_viewer" = substituteSource {
      src = fetchgit {
        name = "yasmin_viewer-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "c53c6d4f50a1d461efdfbe5e59c9e3dc7c613163";
        hash = "sha256-Mga/7WwDzr/NhPcUsAr/jS3rglXUbgjxYSkjmNq3Se8=";
      };
    };
  });
  meta = {
    description = "YASMIN viewer for FSM";
  };
})
