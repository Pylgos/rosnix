{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-msgs,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flexbe_testing";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_testing";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ flexbe-core flexbe-msgs launch-ros rclpy ];
  checkInputs = [ ament-cmake-pytest ament-copyright ament-flake8 ament-pep257 launch-testing std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "flexbe_testing" = substituteSource {
      src = fetchgit {
        name = "flexbe_testing-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "7cbe302c79f606b5f242338a4d8fdfc0c1cd7e94";
        hash = "sha256-Z8v7JR6IuSmak5toK1AzflLXgHOoa40m9WxX883LZ7w=";
      };
    };
  });
  meta = {
    description = "flexbe_testing provides a framework for unit testing states.";
  };
})
