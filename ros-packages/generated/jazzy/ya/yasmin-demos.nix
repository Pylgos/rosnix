{
  ament-cmake,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclpy,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  yasmin,
  yasmin-ros,
  yasmin-viewer,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_demos";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."yasmin_demos";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ example-interfaces nav-msgs rclcpp rclpy yasmin yasmin-ros yasmin-viewer ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_demos" = substituteSource {
      src = fetchgit {
        name = "yasmin_demos-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "7262c2c9a3510d3dd326714ae71597b0a3c1c16e";
        hash = "sha256-8CVHUDlqIaCiMtv03tas30Y5xL8VW+MXclzfYmW7CJA=";
      };
    };
  });
  meta = {
    description = "Demos of YASMIN (Yet Another State MachINe)";
  };
})
