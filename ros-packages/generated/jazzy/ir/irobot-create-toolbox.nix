{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-math-vendor,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_toolbox";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."irobot_create_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gz-math-vendor rclcpp ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_toolbox" = substituteSource {
      src = fetchgit {
        name = "irobot_create_toolbox-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "c16db4ef31eab56d12d68812ac41a6c399f6f40e";
        hash = "sha256-G1aWtTU0jiNj6YeC1U/ab26lI7Mm0VvgRj2TCkxI4vk=";
      };
    };
  });
  meta = {
    description = "Components and helpers for the iRobot(R) Create(R) 3 Educational Robot.";
  };
})
