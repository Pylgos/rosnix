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
  version = "3.5.0-1";
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
        rev = "7d652c84892ca2a19e72d729d28df37c1add2ba7";
        hash = "sha256-sKOgOcyW924Tflc7epBiEVf4Dm8e86Zm25kRh8RlfNE=";
      };
    };
  });
  meta = {
    description = "YASMIN viewer for FSM";
  };
})
