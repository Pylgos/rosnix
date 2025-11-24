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
  version = "0.40.2-1";
  src = finalAttrs.passthru.sources."ros2interface";
  propagatedNativeBuildInputs = [ ament-index-python ros2cli rosidl-adapter rosidl-runtime-py ];
  propagatedBuildInputs = [ ament-index-python ros2cli rosidl-adapter rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros ros2cli-test-interfaces test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2interface" = substituteSource {
      src = fetchgit {
        name = "ros2interface-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "ebab70170d1dbd08302ae80f960704bdebd34e36";
        hash = "sha256-paNVAMESG8MSIIKrM7SRhwrWM2Bcedaui6coYjHDHow=";
      };
    };
  });
  meta = {
    description = "\n    The interface command for ROS 2 command line tools\n  ";
  };
})
