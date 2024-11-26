{
  ament-copyright,
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_param_builder";
  version = "0.1.1-4";
  src = finalAttrs.passthru.sources."launch_param_builder";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy xacro ];
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_param_builder" = substituteSource {
      src = fetchgit {
        name = "launch_param_builder-source";
        url = "https://github.com/ros2-gbp/launch_param_builder-release.git";
        rev = "2280989be87fab08084bbe03dc0680c190b698d9";
        hash = "sha256-5wzPO7Vg6sA7heEmRxiLcDbilS5YyieLi8fBrtcJe/g=";
      };
    };
  });
  meta = {
    description = "Python library for loading parameters in launch files";
  };
})
