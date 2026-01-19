{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-python,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_example_line_follower";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."leo_example_line_follower";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ cv-bridge generate-parameter-library geometry-msgs rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-opencv" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ cv-bridge generate-parameter-library geometry-msgs rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-opencv" ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_example_line_follower" = substituteSource {
      src = fetchgit {
        name = "leo_example_line_follower-source";
        url = "https://github.com/ros2-gbp/leo_examples-ros2-release.git";
        rev = "3a2ece67dc92dfc50dc67efb440702046eaa053e";
        hash = "sha256-sGgACJKk6pDuSTdhqnkDavz1u8ccWbywplZSiWfxI10=";
      };
    };
  });
  meta = {
    description = "\n    A line track follower example for Leo Rover.\n  ";
  };
})
