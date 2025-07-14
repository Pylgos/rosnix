{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "reductstore_agent";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."reductstore_agent";
  propagatedNativeBuildInputs = [ rclpy std-msgs std-srvs ];
  propagatedBuildInputs = [ rclpy std-msgs std-srvs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "reductstore_agent" = substituteSource {
      src = fetchgit {
        name = "reductstore_agent-source";
        url = "https://github.com/ros2-gbp/reductstore_agent-release.git";
        rev = "e50615f2990bd77c64abb24a8ec3e583ba464123";
        hash = "sha256-Bjn0VBWjCCbWOvRY9mu8kkTyQGPKBGyVhwncNTQBtNg=";
      };
    };
  });
  meta = {
    description = "ROS2 recorder node that logs selected topics to ReductStore, with YAML-driven pipelines (mcap/raw, compression, splitting, down-sampling, labelling).";
  };
})
