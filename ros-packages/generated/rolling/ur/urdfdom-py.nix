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
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lxml" "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-lxml" "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom_py" = substituteSource {
      src = fetchgit {
        name = "urdfdom_py-source";
        url = "https://github.com/ros2-gbp/urdfdom_py-release.git";
        rev = "8f80049bad7934533933463c8e484177540921f8";
        hash = "sha256-XIQzb/e4G8nvo/oqr/BKyEWW1LAFi2kvQhIdXhJHG+Q=";
      };
    };
  });
  meta = {
    description = "Python implementation of the URDF parser.";
  };
})
