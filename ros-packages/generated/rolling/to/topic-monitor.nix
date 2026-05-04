{
  ament-flake8,
  ament-mypy,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "topic_monitor";
  version = "0.37.8-2";
  src = finalAttrs.passthru.sources."topic_monitor";
  propagatedNativeBuildInputs = [ example-interfaces launch launch-ros rclpy std-msgs ];
  propagatedBuildInputs = [ example-interfaces launch launch-ros rclpy std-msgs ];
  checkInputs = [ ament-flake8 ament-mypy ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "topic_monitor" = substituteSource {
      src = fetchgit {
        name = "topic_monitor-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "8dec9637fe17e2ed4274b1bc44fafc1df7e17ecb";
        hash = "sha256-l6hp1ET9McSaAuCN2ooN+MF0Xnv/0hUO89JNSsu2P2U=";
      };
    };
  });
  meta = {
    description = "Package containing tools for monitoring ROS 2 topics.";
  };
})
