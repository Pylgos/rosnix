{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  ros2cli,
  ros2cli-test-interfaces,
  rosSystemPackages,
  rosidl-adapter,
  rosidl-runtime-py,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2interface";
  version = "0.36.1-1";
  src = finalAttrs.passthru.sources."ros2interface";
  propagatedNativeBuildInputs = [ rosidl-adapter ];
  propagatedBuildInputs = [ ament-index-python ros2cli rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros ros2cli-test-interfaces test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2interface" = substituteSource {
      src = fetchgit {
        name = "ros2interface-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "6e461b11f1c216b9436dbc35f669309983739df9";
        hash = "sha256-SNS+rBLhREuCgaK7Uo5bB95GpYcJA6+c2NGAmlx7slM=";
      };
    };
  });
  meta = {
    description = "The interface command for ROS 2 command line tools";
  };
})
