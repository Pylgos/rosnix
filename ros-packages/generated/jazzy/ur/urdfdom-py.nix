{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "urdfdom_py";
  version = "1.2.1-3";
  src = finalAttrs.passthru.sources."urdfdom_py";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom_py" = substituteSource {
      src = fetchgit {
        name = "urdfdom_py-source";
        url = "https://github.com/ros2-gbp/urdfdom_py-release.git";
        rev = "691b53d7cea6d00fed623d8273f8914d94de760c";
        hash = "sha256-XIQzb/e4G8nvo/oqr/BKyEWW1LAFi2kvQhIdXhJHG+Q=";
      };
    };
  });
  meta = {
    description = "Python implementation of the URDF parser.";
  };
})
