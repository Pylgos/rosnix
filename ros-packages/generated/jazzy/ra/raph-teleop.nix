{
  ackermann-msgs,
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-python,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-linux,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raph_teleop";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."raph_teleop";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ackermann-msgs joy-linux rclpy sensor-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ackermann-msgs joy-linux rclpy sensor-msgs ];
  checkInputs = [ ament-cmake-copyright ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "raph_teleop" = substituteSource {
      src = fetchgit {
        name = "raph_teleop-source";
        url = "https://github.com/ros2-gbp/raph_common-release.git";
        rev = "55ba372732a598ace7c7b4cfb2323c9c3f5a49f7";
        hash = "sha256-eP5F6pbfl2jPGNhNF18YUJqMjlpopnpLb8Y4K71e98g=";
      };
    };
  });
  meta = {
    description = "\n    Scripts and launch files for Raph Rover teleoperation\n  ";
  };
})
